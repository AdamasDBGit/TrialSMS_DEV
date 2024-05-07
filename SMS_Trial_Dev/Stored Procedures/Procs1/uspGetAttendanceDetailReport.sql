CREATE PROCEDURE [REPORT].[uspGetAttendanceDetailReport]
    (
      @sHierarchyList VARCHAR(MAX) ,
      @sBrandID VARCHAR(MAX) ,
      @sBatchIDs VARCHAR(MAX) = NULL ,
      @dtStartDate DATETIME ,
      @dtEndDate DATETIME  
    )
AS 
    BEGIN  
  
        CREATE TABLE #attendance
            (
              Center_ID INT ,
              Course_ID INT ,
              Batch_ID INT ,
              Student_ID INT ,
              Student_Code VARCHAR(100) ,
              Center_Name VARCHAR(100) ,
              Course_Name VARCHAR(100) ,
              Batch_Name VARCHAR(100) ,
              Student_Name VARCHAR(100) ,
              Scheduled INT ,
              Attended INT ,
              Mobile_No VARCHAR(100) ,
              Roll_No INT ,
              Percentage REAL ,
              Leave_Status INT
            )  
  
  
        INSERT  INTO #attendance
                ( Center_ID ,
                  Center_Name ,
                  Course_ID ,
                  Course_Name ,
                  Batch_ID ,
                  Student_ID ,
                  Student_Code ,
                  Student_Name ,
                  Mobile_No ,
                  Roll_No
                )
                SELECT  F.I_Center_ID ,
                        F.S_Center_Name ,
                        D.I_Course_ID ,
                        E.S_Course_Name ,
                        B.I_Batch_ID ,
                        A.I_Student_Detail_ID ,
                        S_Student_ID ,
                        S_First_Name + ' ' + S_Last_Name ,
                        S_Mobile_No ,
                        I_RollNo
                FROM    T_Student_Detail A
                        INNER JOIN T_Student_Batch_Details B ON A.I_Student_Detail_ID = B.I_Student_ID
                                                              AND B.I_Status = 1
                        INNER JOIN T_Center_Batch_Details C ON C.I_Batch_ID = B.I_Batch_ID
                        INNER JOIN T_Student_Course_Detail D ON D.I_Student_Detail_ID = A.I_Student_Detail_ID
                                                              AND D.I_Status = 1
                        INNER JOIN T_Course_Master E ON E.I_Course_ID = D.I_Course_ID
                                                        AND E.I_Status = 1
                        INNER JOIN T_Center_Hierarchy_Name_Details F ON F.I_Center_ID = C.I_Centre_Id
                WHERE   C.I_Centre_Id IN (
                        SELECT  CenterList.centerID
                        FROM    dbo.fnGetCentersForReports(@sHierarchyList,
                                                           CAST(@sBrandID AS INT)) CenterList )
                        AND @sBatchIDs IS NULL
                        OR C.I_Batch_ID IN (
                        SELECT  Val
                        FROM    dbo.fnString2Rows(@sBatchIDs, ',') )  
   
  
  
        UPDATE  T
        SET     T.Batch_Name = X.S_Batch_Name
        FROM    #attendance T
                INNER JOIN ( SELECT I_Batch_ID ,
                                    S_Batch_Name
                             FROM   T_Student_Batch_Master A
                                    INNER JOIN #attendance B ON A.I_Batch_ID = B.Batch_ID
                           ) X ON T.Batch_ID = X.I_Batch_ID  
  
  
  
        UPDATE  T
        SET     T.Scheduled = X.Scheduled
        FROM    #attendance T
                INNER JOIN ( SELECT I_Batch_ID ,
                                    COUNT(I_TimeTable_ID) AS Scheduled
                             FROM   T_TimeTable_Master
                             WHERE  Dt_Schedule_Date BETWEEN @dtStartDate
                                                     AND     @dtEndDate
                             GROUP BY I_Batch_ID
                           ) X ON X.I_Batch_ID = T.Batch_ID  
  
  
        UPDATE  T
        SET     T.Attended = X.Attended
        FROM    #attendance T
                INNER JOIN ( SELECT I_Student_Detail_ID ,
                                    COUNT(DISTINCT A.I_TimeTable_ID) Attended
                             FROM   T_Student_Attendance A
                                    INNER JOIN T_Student_Batch_Details B ON A.I_Student_Detail_ID = B.I_Student_ID
                                                              AND B.I_Status = 1
                                    INNER JOIN T_TimeTable_Master C ON C.I_TimeTable_ID = A.I_TimeTable_ID
                                                              AND B.I_Batch_ID = C.I_Batch_ID
                                                              AND A.I_TimeTable_ID IN (
                                                              SELECT
                                                              I_TimeTable_ID
                                                              FROM
                                                              T_TimeTable_Master
                                                              WHERE
                                                              Dt_Schedule_Date BETWEEN @dtStartDate
                                                              AND
                                                              @dtEndDate
                                                              AND I_Center_ID IN (
                                                              SELECT
                                                              CenterList.centerID
                                                              FROM
                                                              dbo.fnGetCentersForReports(@sHierarchyList,
                                                              CAST(@sBrandID AS INT)) CenterList ) )
                             GROUP BY I_Student_Detail_ID
                           ) X ON X.I_Student_Detail_ID = T.Student_ID  
  
  
        UPDATE  A
        SET     A.Percentage = X.Percentage
        FROM    #attendance A
                INNER JOIN ( SELECT Student_ID ,
                                    ROUND(( CONVERT(DECIMAL, Attended)
                                            / CONVERT(DECIMAL, Scheduled) )
                                          * 100, 2) AS Percentage
                             FROM   #attendance
                           ) X ON A.Student_ID = X.Student_ID  
   
        UPDATE  A
        SET     A.Leave_Status = ISNULL(B.I_Status, '')
        FROM    #attendance A
                INNER JOIN ( SELECT A.I_Student_Detail_ID ,
                                    A.I_Status
                             FROM   T_Student_Leave_Request A
                                    INNER JOIN #attendance B ON A.I_Student_Detail_ID = B.Student_ID
                                                              AND A.I_Status = 1
                                                              AND DATEDIFF(dd,
                                                              A.Dt_From_Date,
                                                              @dtStartDate) >= 0
                                                              AND DATEDIFF(dd,
                                                              A.Dt_To_Date,
                                                              @dtEndDate) <= 0
                           ) B ON A.Student_ID = B.I_Student_Detail_ID  
  
        SELECT  A.* ,
                FN2.instanceChain
        FROM    #attendance A
                INNER JOIN [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                          CAST(@SBrandID AS INT)) FN1 ON A.Center_ID = FN1.CenterID
                INNER JOIN [dbo].[fnGetInstanceNameChainForReports](@sHierarchyList,
                                                              CAST(@sBrandID AS INT)) FN2 ON FN1.HierarchyDetailID = FN2.HierarchyDetailID
        ORDER BY Batch_Name ,
                Roll_No  
  
    END  