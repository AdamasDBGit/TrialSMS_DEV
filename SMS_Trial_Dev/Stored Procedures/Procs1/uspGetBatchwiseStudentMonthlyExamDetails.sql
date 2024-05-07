CREATE PROCEDURE [REPORT].[uspGetBatchwiseStudentMonthlyExamDetails]
    (
      @dtExamDate DATETIME ,
      @dtstart DATETIME ,
      @sHierarchyList VARCHAR(MAX) ,
      @iBrandID INT ,
      @iBatchID VARCHAR(MAX)
    )
AS 
    BEGIN

-------------------Create temporary tables start---------------------------
        CREATE TABLE #temp1
            (
              S_Center_Name VARCHAR(100) ,
              I_Student_Detail_ID INT ,
              I_Term_ID INT ,
              I_Batch_ID INT ,
              I_Center_ID INT ,
              STUDENT_CODE VARCHAR(100) ,
              NAME VARCHAR(100) ,
              S_Batch_Name VARCHAR(100) ,
              Course_Name VARCHAR(100) ,
              S_Term_Name VARCHAR(100) ,
              S_Component_Name VARCHAR(100) ,
              S_Course_Name VARCHAR(100) ,
              MARKS_OBTAINED REAL ,
              FULL_MARKS INT ,
              PERCENTAGE REAL ,
              Category VARCHAR(MAX) ,
              RankCategory VARCHAR(MAX) ,
              RankNo INT ,
              Total_Percentage REAL ,
              S_Mobile_No VARCHAR(100) ,
              I_RollNo INT ,
              Class_Scheduled INT ,
              Class_Attended INT ,
              Homework_Assigned INT
		    --Homework_Submitted INT,
		    --S_Photo VARCHAR(100),
		    --Highest_Marks INT
            )

        CREATE TABLE #temp2
            (
              S_Center_Name VARCHAR(100) ,
              I_Student_Detail_ID INT ,
              I_Term_ID INT ,
              I_Batch_ID INT ,
              I_Center_ID INT ,
              STUDENT_CODE VARCHAR(100) ,
              NAME VARCHAR(100) ,
              S_Batch_Name VARCHAR(100) ,
              Course_Name VARCHAR(100) ,
              S_Term_Name VARCHAR(100) ,
              S_Component_Name VARCHAR(100) ,
              S_Course_Name VARCHAR(100) ,
              MARKS_OBTAINED REAL ,
              FULL_MARKS INT ,
              PERCENTAGE REAL ,
              Category VARCHAR(MAX) ,
              RankCategory VARCHAR(MAX) ,
              RankNo INT ,
              Total_Percentage REAL ,
              S_Mobile_No VARCHAR(100) ,
              I_RollNo INT ,
              Class_Scheduled INT ,
              Class_Attended INT ,
              Homework_Assigned INT ,
              Homework_Submitted INT ,
              MathTeacher VARCHAR(MAX) ,
              EnglishTeacher VARCHAR(MAX) ,
              GITeacher VARCHAR(MAX) ,
              Mentor VARCHAR(MAX) ,
              HistBatchStrength INT ,
              CurrBatchStrength INT ,
              BatchDuration INT ,
              Board VARCHAR(MAX) ,
              Contact VARCHAR(MAX)
		    --Homework_Submitted INT,
		    --S_Photo VARCHAR(100),
		    --Highest_Marks INT
            )
            
-------------------Create temporary tables end---------------------------            
            
-------------------Populate Base Table start-----------------------------            
        INSERT  INTO #temp1
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  MARKS_OBTAINED ,
                  FULL_MARKS ,
                  PERCENTAGE 
                )
                SELECT  E.S_Center_Name ,
                        A.I_Student_Detail_ID ,
			--S_Student_Photo,
                        T2.I_Term_ID ,
                        C.I_Batch_ID ,
                        D.I_Centre_Id ,
                        S_Student_ID AS STUDENT_CODE ,
                        A.S_First_Name + ' ' + A.S_Middle_Name + ' '
                        + A.S_Last_Name AS NAME ,
                        c.S_Batch_Name ,
                        S_Course_Name ,
                        S_Term_Name ,
			--S_Component_Name,
                        A.S_Mobile_No ,
                        I_RollNo ,
                        'Monthly Test Score' AS Category ,
                        SUM(ISNULL(J.I_Exam_Total, 0)) / 1.00 AS MARKS_OBTAINED ,
                        SUM(G.I_TotMarks) AS FULL_MARKS ,
                        ( SUM(ISNULL(CAST(J.I_Exam_Total AS DECIMAL), 0))
                          / SUM(CAST(G.I_TotMarks AS DECIMAL)) ) * 100 AS 'PERCENTAGE'
                FROM    T_Student_Detail A
                        INNER JOIN T_Student_Batch_Details B ON A.I_Student_Detail_ID = B.I_Student_ID
                                                              AND ( B.I_Status = 1
                                                              OR B.I_Status = 2
                                                              )
                        INNER JOIN T_Student_Batch_Master C ON C.I_Batch_ID = B.I_Batch_ID
                        INNER JOIN T_Center_Batch_Details D ON D.I_Batch_ID = C.I_Batch_ID
                        INNER JOIN T_Center_Hierarchy_Name_Details E ON E.I_Center_ID = D.I_Centre_Id
                        INNER JOIN T_Course_Master F ON F.I_Course_ID = C.I_Course_ID
                        INNER JOIN T_Term_Course_Map T1 ON T1.I_Course_ID = F.I_Course_ID
                        INNER JOIN T_Term_Master T2 ON T2.I_Term_ID = T1.I_Term_ID
                        LEFT JOIN T_Term_Eval_Strategy G ON G.I_Term_ID = T2.I_Term_ID
                                                            AND G.I_Status = 1
                                                            AND T2.I_Status = 1
                        LEFT JOIN T_Exam_Component_Master H ON H.I_Exam_Component_ID = G.I_Exam_Component_ID
                                                              AND H.I_Status = 1
                        LEFT JOIN EXAMINATION.T_Batch_Exam_Map I ON I.I_Batch_ID = C.I_Batch_ID
                                                              AND I.I_Exam_Component_ID = H.I_Exam_Component_ID
                                                              AND I.I_Term_ID = T2.I_Term_ID
                        LEFT JOIN EXAMINATION.T_Student_Marks J ON J.I_Batch_Exam_ID = I.I_Batch_Exam_ID
                                                              AND A.I_Student_Detail_ID = J.I_Student_Detail_ID
                        INNER JOIN T_Enquiry_Regn_Detail K ON A.I_Enquiry_Regn_ID = K.I_Enquiry_Regn_ID
                WHERE   E.I_Center_ID IN (
                        SELECT  centerID
                        FROM    [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                              @iBrandID) )
--AND
--T2.I_Term_ID=ISNULL(@iTermID,T2.I_Term_ID)
                        AND ( J.Dt_Exam_Date BETWEEN DATEADD(dd, -1, @dtstart)
                                             AND     DATEADD(dd, 1,
                                                             @dtExamDate) )
                        AND C.I_Batch_ID IN (
                        SELECT  BatchID.Val
                        FROM    dbo.fnString2Rows(@iBatchID, ',') AS BatchID )


 --'2013-07-10'-- BETWEEN @dtStart AND @dtEnd

--AND
--C.I_Batch_ID=32
GROUP BY                D.I_Centre_ID ,
                        S_Center_Name ,
                        S_Course_Name ,
                        C.I_Batch_ID ,
                        C.S_Batch_Name ,
                        A.I_Student_Detail_ID ,
                        S_Student_ID ,
                        A.S_First_Name + ' ' + A.S_Middle_Name + ' '
                        + A.S_Last_Name ,
                        I_RollNo ,
                        A.S_Mobile_No ,
                        T2.I_Term_ID ,
                        S_Term_Name
                        
-------------------Populate Base Table end-----------------------------
                        
-------------------Populate Marks Data Start---------------------------                        
        INSERT  INTO #temp2
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  MARKS_OBTAINED ,
                  FULL_MARKS ,
                  PERCENTAGE 
                )
                SELECT  E.S_Center_Name ,
                        A.I_Student_Detail_ID ,
			--S_Student_Photo,
                        T2.I_Term_ID ,
                        C.I_Batch_ID ,
                        D.I_Centre_Id ,
                        S_Student_ID AS STUDENT_CODE ,
                        A.S_First_Name + ' ' + A.S_Middle_Name + ' '
                        + A.S_Last_Name AS NAME ,
                        c.S_Batch_Name ,
                        S_Course_Name ,
                        S_Term_Name ,
			--S_Component_Name,
                        A.S_Mobile_No ,
                        I_RollNo ,
                        'Monthly Test Score' AS Category ,
                        SUM(ISNULL(J.I_Exam_Total, 0)) / 1.00 AS MARKS_OBTAINED ,
                        SUM(G.I_TotMarks) AS FULL_MARKS ,
                        ( SUM(ISNULL(CAST(J.I_Exam_Total AS DECIMAL), 0))
                          / SUM(CAST(G.I_TotMarks AS DECIMAL)) ) * 100 AS 'PERCENTAGE'
                FROM    T_Student_Detail A
                        INNER JOIN T_Student_Batch_Details B ON A.I_Student_Detail_ID = B.I_Student_ID
                                                              AND ( B.I_Status = 1
                                                              OR B.I_Status = 2
                                                              )
                        INNER JOIN T_Student_Batch_Master C ON C.I_Batch_ID = B.I_Batch_ID
                        INNER JOIN T_Center_Batch_Details D ON D.I_Batch_ID = C.I_Batch_ID
                        INNER JOIN T_Center_Hierarchy_Name_Details E ON E.I_Center_ID = D.I_Centre_Id
                        INNER JOIN T_Course_Master F ON F.I_Course_ID = C.I_Course_ID
                        INNER JOIN T_Term_Course_Map T1 ON T1.I_Course_ID = F.I_Course_ID
                        INNER JOIN T_Term_Master T2 ON T2.I_Term_ID = T1.I_Term_ID
                        LEFT JOIN T_Term_Eval_Strategy G ON G.I_Term_ID = T2.I_Term_ID
                                                            AND G.I_Status = 1
                                                            AND T2.I_Status = 1
                        LEFT JOIN T_Exam_Component_Master H ON H.I_Exam_Component_ID = G.I_Exam_Component_ID
                                                              AND H.I_Status = 1
                        LEFT JOIN EXAMINATION.T_Batch_Exam_Map I ON I.I_Batch_ID = C.I_Batch_ID
                                                              AND I.I_Exam_Component_ID = H.I_Exam_Component_ID
                                                              AND I.I_Term_ID = T2.I_Term_ID
                        LEFT JOIN EXAMINATION.T_Student_Marks J ON J.I_Batch_Exam_ID = I.I_Batch_Exam_ID
                                                              AND A.I_Student_Detail_ID = J.I_Student_Detail_ID
                        INNER JOIN T_Enquiry_Regn_Detail K ON A.I_Enquiry_Regn_ID = K.I_Enquiry_Regn_ID
                WHERE   E.I_Center_ID IN (
                        SELECT  centerID
                        FROM    [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                              @iBrandID) )
--AND
--T2.I_Term_ID=ISNULL(@iTermID,T2.I_Term_ID)
                        AND ( J.Dt_Exam_Date BETWEEN DATEADD(dd, -1, @dtstart)
                                             AND     DATEADD(dd, 1,
                                                             @dtExamDate) )
                        AND C.I_Batch_ID = @iBatchID


 --'2013-07-10'-- BETWEEN @dtStart AND @dtEnd

--AND
--C.I_Batch_ID=32
GROUP BY                D.I_Centre_ID ,
                        S_Center_Name ,
                        S_Course_Name ,
                        C.I_Batch_ID ,
                        C.S_Batch_Name ,
                        A.I_Student_Detail_ID ,
                        S_Student_ID ,
                        A.S_First_Name + ' ' + A.S_Middle_Name + ' '
                        + A.S_Last_Name ,
                        I_RollNo ,
                        A.S_Mobile_No ,
                        T2.I_Term_ID ,
                        S_Term_Name

-------------------Populate Marks Data End---------------------------

-------------------Populate Attendance Data Start---------------------------

        INSERT  INTO #temp2
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  Class_Scheduled 
                )
                SELECT  TT.S_Center_Name ,
                        TT.I_Student_Detail_ID ,
                        TT.I_Term_ID ,
                        TT.I_Batch_ID ,
                        TT.I_Center_ID ,
                        TT.STUDENT_CODE ,
                        TT.NAME ,
                        TT.S_Batch_Name ,
                        TT.Course_Name ,
                        TT.S_Term_Name ,
                        TT.S_Mobile_No ,
                        TT.I_RollNo ,
                        'Attendance' AS Category ,
                        ScheduledClass.Scheduled
                FROM    #temp1 TT
                        INNER JOIN ( SELECT /*T2.I_Term_ID,*/
                                            T2.I_Batch_ID ,
                                            T2.I_Term_ID ,
                                            COUNT(DISTINCT I_TimeTable_ID/*I_Session_ID*/) Scheduled
                                     FROM   T_TimeTable_Master T2
                                     WHERE  T2.I_Center_ID IN (
                                            SELECT  centerID
                                            FROM    [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                              @iBrandID) )
                                            AND /*I_Session_ID is not null and*/ t2.Dt_Schedule_Date BETWEEN @dtstart
                                                              AND
                                                              @dtExamDate
                                     GROUP BY /*T2.I_Term_ID,*/ T2.I_Batch_ID ,
                                            T2.I_Term_ID
                                   ) ScheduledClass ON TT.I_Batch_ID = ScheduledClass.I_Batch_ID
                                                       AND TT.I_Term_ID = ScheduledClass.I_Term_ID


        UPDATE  T1
        SET     T1.Class_Attended = ISNULL(T3.Attended, 0)
        FROM    ( SELECT /*T2.I_Term_ID,*/
                            T2.I_Student_Detail_ID ,
                            T2.I_Term_ID ,
                            ISNULL(COUNT(DISTINCT I_TimeTable_ID/*I_Session_ID*/),
                                   0) Attended
                  FROM      T_Student_Attendance_Details T2
                  WHERE     T2.I_Centre_ID IN (
                            SELECT  centerID
                            FROM    [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                              @iBrandID) ) /*and I_Session_ID is not null*/
                            AND t2.I_TimeTable_ID IN (
                            SELECT  I_TimeTable_ID
                            FROM    T_TimeTable_Master
                            WHERE   I_Center_ID IN (
                                    SELECT  centerID
                                    FROM    [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                              @iBrandID) )
                                    AND Dt_Schedule_Date BETWEEN @dtstart AND @dtExamDate )
                  GROUP BY /*T2.I_Term_ID,*/ T2.I_Student_Detail_ID ,
                            T2.I_Term_ID
                ) T3
                INNER JOIN #temp2 T1 ON /*T1.I_Term_ID=T3.I_Term_ID AND*/ T1.I_Student_Detail_ID = T3.I_Student_Detail_ID
                                        AND T1.I_Term_ID = T3.I_Term_ID
                                        AND T1.Class_Scheduled IS NOT NULL
                                        
                                        
        UPDATE  #temp2
        SET     MARKS_OBTAINED = ROUND(( CAST(ISNULL(Class_Attended, 0) AS REAL)
                                         / CAST(ISNULL(Class_Scheduled, 0) AS REAL)
                                         * 100 ), 0)
        WHERE   Category = 'Attendance' ;
                                        
-------------------Populate Attendance Data End---------------------------

-------------------Populate Rank Data Start---------------------------

        INSERT  INTO #temp2
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  MARKS_OBTAINED 
                )
                SELECT  TT.S_Center_Name ,
                        TT.I_Student_Detail_ID ,
                        TT.I_Term_ID ,
                        TT.I_Batch_ID ,
                        TT.I_Center_ID ,
                        TT.STUDENT_CODE ,
                        TT.NAME ,
                        TT.S_Batch_Name ,
                        TT.Course_Name ,
                        TT.S_Term_Name ,
                        TT.S_Mobile_No ,
                        TT.I_RollNo ,
                        'WB Rank' AS Category ,
                        T1.Overall_Rank
                FROM    #temp1 TT
                        INNER JOIN ( SELECT SM.I_Student_Detail_ID ,
                                            BEM.I_Term_ID ,
                                            DENSE_RANK() OVER ( PARTITION BY BEM.I_Term_ID ORDER BY SUM(ISNULL(SM.I_Exam_Total,
                                                              0)) DESC ) AS [Overall_Rank]
                                     FROM   EXAMINATION.T_Student_Marks SM
                                            INNER JOIN EXAMINATION.T_Batch_Exam_Map BEM ON BEM.I_Batch_Exam_ID = SM.I_Batch_Exam_ID
                                                              AND SM.Dt_Exam_Date BETWEEN @dtstart
                                                              AND
                                                              DATEADD(dd, 1,
                                                              @dtExamDate)
 -- AND SM.Dt_Crtd_On<'2013-03-31'                   
                                     GROUP BY I_Student_Detail_ID ,
                                            BEM.I_Term_ID
                                   ) T1 ON TT.I_Student_Detail_ID = T1.I_Student_Detail_ID
                                           AND TT.I_Term_ID = T1.I_Term_ID
                                           
                                           
        INSERT  INTO #temp2
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  MARKS_OBTAINED 
                )
                SELECT  TT.S_Center_Name ,
                        TT.I_Student_Detail_ID ,
                        TT.I_Term_ID ,
                        TT.I_Batch_ID ,
                        TT.I_Center_ID ,
                        TT.STUDENT_CODE ,
                        TT.NAME ,
                        TT.S_Batch_Name ,
                        TT.Course_Name ,
                        TT.S_Term_Name ,
                        TT.S_Mobile_No ,
                        TT.I_RollNo ,
                        'Center Rank' AS Category ,
                        T1.Center_Rank
                FROM    #temp1 TT
                        INNER JOIN ( SELECT SM.I_Student_Detail_ID ,
                                            BEM.I_Term_ID ,
                                            DENSE_RANK() OVER ( PARTITION BY BEM.I_Term_ID,
                                                              SM.I_Center_ID ORDER BY SUM(ISNULL(SM.I_Exam_Total,
                                                              0)) DESC ) AS [Center_Rank]
                                     FROM   EXAMINATION.T_Student_Marks SM
                                            INNER JOIN EXAMINATION.T_Batch_Exam_Map BEM ON BEM.I_Batch_Exam_ID = SM.I_Batch_Exam_ID
                                                              AND SM.Dt_Exam_Date BETWEEN @dtstart
                                                              AND
                                                              DATEADD(dd, 1,
                                                              @dtExamDate)
   --@dtExamDate-- AND SM.Dt_Crtd_On<'2013-03-31'                   
                                     GROUP BY I_Student_Detail_ID ,
                                            BEM.I_Term_ID ,
                                            SM.I_Center_ID
                                   ) T1 ON TT.I_Student_Detail_ID = T1.I_Student_Detail_ID
                                           AND TT.I_Term_ID = T1.I_Term_ID 
                                           
                                           
                                           
        INSERT  INTO #temp2
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  MARKS_OBTAINED 
                )
                SELECT  TT.S_Center_Name ,
                        TT.I_Student_Detail_ID ,
                        TT.I_Term_ID ,
                        TT.I_Batch_ID ,
                        TT.I_Center_ID ,
                        TT.STUDENT_CODE ,
                        TT.NAME ,
                        TT.S_Batch_Name ,
                        TT.Course_Name ,
                        TT.S_Term_Name ,
                        TT.S_Mobile_No ,
                        TT.I_RollNo ,
                        'Batch Rank' AS Category ,
                        T1.Batch_Rank
                FROM    #temp1 TT
                        INNER JOIN ( SELECT SM.I_Student_Detail_ID ,
                                            BEM.I_Term_ID ,
                                            DENSE_RANK() OVER ( PARTITION BY BEM.I_Term_ID,
                                                              SM.I_Center_ID,
                                                              BEM.I_Batch_ID ORDER BY SUM(ISNULL(SM.I_Exam_Total,
                                                              0)) DESC ) AS [Batch_Rank]
                                     FROM   EXAMINATION.T_Student_Marks SM
                                            INNER JOIN EXAMINATION.T_Batch_Exam_Map BEM ON BEM.I_Batch_Exam_ID = SM.I_Batch_Exam_ID
                                                              AND SM.Dt_Exam_Date BETWEEN @dtstart
                                                              AND
                                                              DATEADD(dd, 1,
                                                              @dtExamDate)
 --'2013-07-10'-- AND SM.Dt_Crtd_On<'2013-03-31'                   
                                     GROUP BY I_Student_Detail_ID ,
                                            BEM.I_Term_ID ,
                                            SM.I_Center_ID ,
                                            BEM.I_Batch_ID
                                   ) T1 ON TT.I_Student_Detail_ID = T1.I_Student_Detail_ID
                                           AND TT.I_Term_ID = T1.I_Term_ID                                         
                                           
                                           
-------------------Populate Rank Data End--------------------------- 

        INSERT  INTO #temp2
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  MARKS_OBTAINED
                )
                SELECT  TT.S_Center_Name ,
                        TT.I_Student_Detail_ID ,
                        TT.I_Term_ID ,
                        TT.I_Batch_ID ,
                        TT.I_Center_ID ,
                        TT.STUDENT_CODE ,
                        TT.NAME ,
                        TT.S_Batch_Name ,
                        TT.Course_Name ,
                        TT.S_Term_Name ,
                        TT.S_Mobile_No ,
                        TT.I_RollNo ,
                        'Homework Assigned' AS Category ,
                        T1.AssignedHW
                FROM    #temp1 TT
                        INNER JOIN ( SELECT I_Batch_ID ,
                                            I_Term_ID ,
                                            COUNT(DISTINCT I_Homework_ID) AS AssignedHW
                                     FROM   EXAMINATION.T_Homework_Master THM
                                     WHERE  I_Center_ID IN (
                                            SELECT  FCGR.centerID
                                            FROM    dbo.fnGetCentersForReports(@sHierarchyList,
                                                              @iBrandID) FCGR )
                                            AND THM.Dt_Submission_Date BETWEEN @dtstart
                                                              AND
                                                              DATEADD(dd, 1,
                                                              @dtExamDate)
                                            AND THM.I_Status = 1
                                     GROUP BY I_Batch_ID ,
                                            I_Term_ID
                                   ) T1 ON TT.I_Batch_ID = T1.I_Batch_ID
                                           AND TT.I_Term_ID = T1.I_Term_ID
                        
                        
                        
                        
        INSERT  INTO #temp2
                ( S_Center_Name ,
                  I_Student_Detail_ID ,
                  I_Term_ID ,
                  I_Batch_ID ,
                  I_Center_ID ,
                  STUDENT_CODE ,
                  NAME ,
                  S_Batch_Name ,
                  Course_Name ,
                  S_Term_Name ,
                  S_Mobile_No ,
                  I_RollNo ,
                  Category ,
                  MARKS_OBTAINED
                )
                SELECT  TT.S_Center_Name ,
                        TT.I_Student_Detail_ID ,
                        TT.I_Term_ID ,
                        TT.I_Batch_ID ,
                        TT.I_Center_ID ,
                        TT.STUDENT_CODE ,
                        TT.NAME ,
                        TT.S_Batch_Name ,
                        TT.Course_Name ,
                        TT.S_Term_Name ,
                        TT.S_Mobile_No ,
                        TT.I_RollNo ,
                        'Homework Submitted' AS Category ,
                        T1.SubmittedHW
                FROM    #temp1 TT
                        INNER JOIN ( SELECT THS.I_Student_Detail_ID ,
                                            THM.I_Term_ID ,
                                            COUNT(DISTINCT THM.I_Homework_ID) AS SubmittedHW
                                     FROM   EXAMINATION.T_Homework_Master THM
                                            INNER JOIN EXAMINATION.T_Homework_Submission THS ON THM.I_Homework_ID = THS.I_Homework_ID
                                     WHERE  I_Center_ID IN (
                                            SELECT  FCGR.centerID
                                            FROM    dbo.fnGetCentersForReports(@sHierarchyList,
                                                              @iBrandID) FCGR )
                                            AND THS.I_Status = 1
                                            AND THS.Dt_Submission_Date BETWEEN @dtstart
                                                              AND
                                                              DATEADD(dd, 1,
                                                              @dtExamDate)
                                     GROUP BY THS.I_Student_Detail_ID ,
                                            THM.I_Term_ID
                                   ) T1 ON TT.I_Student_Detail_ID = T1.I_Student_Detail_ID
                                           AND TT.I_Term_ID = T1.I_Term_ID
                        



        UPDATE  TT
        SET     TT.MathTeacher = MathFaculty.EmployeeName
        FROM    #temp2 TT
                INNER JOIN ( SELECT *
                             FROM   ( SELECT    TTTM.I_Batch_ID ,
                                                TED.I_Employee_ID ,
                                                TED.S_First_Name + ' '
                                                + ISNULL(TED.S_Middle_Name, '')
                                                + ' ' + ISNULL(TED.S_Last_Name,
                                                              '') AS EmployeeName ,
                                                COUNT(DISTINCT TTTM.I_TimeTable_ID) AS NoOfOccurance ,
                                                DENSE_RANK() OVER ( PARTITION BY TTTM.I_Batch_ID ORDER BY COUNT(DISTINCT TTTM.I_TimeTable_ID) DESC ) AS RankID
                                      FROM      dbo.T_TimeTable_Master TTTM
                                                INNER JOIN dbo.T_Session_Master TSM ON TTTM.I_Session_ID = TSM.I_Session_ID
                                                INNER JOIN dbo.T_TimeTable_Faculty_Map TTTFM ON TTTM.I_TimeTable_ID = TTTFM.I_TimeTable_ID
                                                INNER JOIN dbo.T_Employee_Dtls TED ON TTTFM.I_Employee_ID = TED.I_Employee_ID
                                                INNER JOIN dbo.fnGetCentersForReports(@sHierarchyList,
                                                              @iBrandID) FGCFR ON TTTM.I_Center_ID = FGCFR.centerID
                                      WHERE     TSM.I_Skill_ID = 51
                                                AND TTTFM.B_Is_Actual = 1
                                                AND TED.I_Status = 3
                                      GROUP BY  TTTM.I_Batch_ID ,
                                                TED.I_Employee_ID ,
                                                TED.S_First_Name + ' '
                                                + ISNULL(TED.S_Middle_Name, '')
                                                + ' ' + ISNULL(TED.S_Last_Name,
                                                              '')
                                    ) Math
                             WHERE  Math.RankID = 1
                           ) Mathfaculty ON TT.I_Batch_ID = Mathfaculty.I_Batch_ID 


        UPDATE  TT
        SET     TT.EnglishTeacher = EnglishFaculty.EmployeeName
        FROM    #temp2 TT
                INNER JOIN ( SELECT *
                             FROM   ( SELECT    TTTM.I_Batch_ID ,
                                                TED.I_Employee_ID ,
                                                TED.S_First_Name + ' '
                                                + ISNULL(TED.S_Middle_Name, '')
                                                + ' ' + ISNULL(TED.S_Last_Name,
                                                              '') AS EmployeeName ,
                                                COUNT(DISTINCT TTTM.I_TimeTable_ID) AS NoOfOccurance ,
                                                DENSE_RANK() OVER ( PARTITION BY TTTM.I_Batch_ID ORDER BY COUNT(DISTINCT TTTM.I_TimeTable_ID) DESC ) AS RankID
                                      FROM      dbo.T_TimeTable_Master TTTM
                                                INNER JOIN dbo.T_Session_Master TSM ON TTTM.I_Session_ID = TSM.I_Session_ID
                                                INNER JOIN dbo.T_TimeTable_Faculty_Map TTTFM ON TTTM.I_TimeTable_ID = TTTFM.I_TimeTable_ID
                                                INNER JOIN dbo.T_Employee_Dtls TED ON TTTFM.I_Employee_ID = TED.I_Employee_ID
                                                INNER JOIN dbo.fnGetCentersForReports(@sHierarchyList,
                                                              @iBrandID) FGCFR ON TTTM.I_Center_ID = FGCFR.centerID
                                      WHERE     TSM.I_Skill_ID = 52
                                                AND TTTFM.B_Is_Actual = 1
                                                AND TED.I_Status = 3
                                      GROUP BY  TTTM.I_Batch_ID ,
                                                TED.I_Employee_ID ,
                                                TED.S_First_Name + ' '
                                                + ISNULL(TED.S_Middle_Name, '')
                                                + ' ' + ISNULL(TED.S_Last_Name,
                                                              '')
                                    ) English
                             WHERE  English.RankID = 1
                           ) Englishfaculty ON TT.I_Batch_ID = Englishfaculty.I_Batch_ID 



        UPDATE  TT
        SET     TT.GITeacher = GIFaculty.EmployeeName
        FROM    #temp2 TT
                INNER JOIN ( SELECT *
                             FROM   ( SELECT    TTTM.I_Batch_ID ,
                                                TED.I_Employee_ID ,
                                                TED.S_First_Name + ' '
                                                + ISNULL(TED.S_Middle_Name, '')
                                                + ' ' + ISNULL(TED.S_Last_Name,
                                                              '') AS EmployeeName ,
                                                COUNT(DISTINCT TTTM.I_TimeTable_ID) AS NoOfOccurance ,
                                                DENSE_RANK() OVER ( PARTITION BY TTTM.I_Batch_ID ORDER BY COUNT(DISTINCT TTTM.I_TimeTable_ID) DESC ) AS RankID
                                      FROM      dbo.T_TimeTable_Master TTTM
                                                INNER JOIN dbo.T_Session_Master TSM ON TTTM.I_Session_ID = TSM.I_Session_ID
                                                INNER JOIN dbo.T_TimeTable_Faculty_Map TTTFM ON TTTM.I_TimeTable_ID = TTTFM.I_TimeTable_ID
                                                INNER JOIN dbo.T_Employee_Dtls TED ON TTTFM.I_Employee_ID = TED.I_Employee_ID
                                                INNER JOIN dbo.fnGetCentersForReports(@sHierarchyList,
                                                              @iBrandID) FGCFR ON TTTM.I_Center_ID = FGCFR.centerID
                                      WHERE     TSM.I_Skill_ID IN ( 53, 492 )
                                                AND TTTFM.B_Is_Actual = 1
                                                AND TED.I_Status = 3
                                      GROUP BY  TTTM.I_Batch_ID ,
                                                TED.I_Employee_ID ,
                                                TED.S_First_Name + ' '
                                                + ISNULL(TED.S_Middle_Name, '')
                                                + ' ' + ISNULL(TED.S_Last_Name,
                                                              '')
                                    ) GI
                             WHERE  GI.RankID = 1
                           ) GIfaculty ON TT.I_Batch_ID = GIfaculty.I_Batch_ID


        UPDATE  TT
        SET     TT.Mentor = Mentor.EmployeeName
        FROM    #temp2 TT
                INNER JOIN ( SELECT I_Batch_ID ,
                                    TED.S_First_Name + ' '
                                    + ISNULL(TED.S_Middle_Name, '') + ' '
                                    + ISNULL(TED.S_Last_Name, '') AS EmployeeName
                             FROM   dbo.T_Center_Batch_Details TCBD
                                    INNER JOIN dbo.fnGetCentersForReports(@sHierarchyList,
                                                              @iBrandID) FGCFR ON TCBD.I_Centre_Id = FGCFR.centerID
                                    LEFT JOIN dbo.T_Employee_Dtls TED ON TCBD.I_Employee_ID = TED.I_Employee_ID
                           ) Mentor ON TT.I_Batch_ID = Mentor.I_Batch_ID


        UPDATE  TT
        SET     TT.HistBatchStrength = HistStudentCount.HistNoOfStudents
        FROM    #temp2 TT
                INNER JOIN ( SELECT YY.HistoricalBatch ,
                                    COUNT(DISTINCT YY.I_Student_ID) AS HistNoOfStudents
                             FROM   ( SELECT    TSBD.I_Student_ID ,
                                                dbo.fnGetHistoricalBatchID(TSBD.I_Student_ID,
                                                              TSBM2.Dt_BatchStartDate) AS HistoricalBatch
                                      FROM      dbo.T_Student_Batch_Details TSBD
                                                INNER JOIN dbo.T_Student_Batch_Master TSBM2 ON TSBD.I_Batch_ID = TSBM2.I_Batch_ID
                                                INNER JOIN dbo.T_Center_Batch_Details TCBD2 ON TSBD.I_Batch_ID = TCBD2.I_Batch_ID
                                                INNER JOIN #temp1 TTT ON TTT.I_Batch_ID = TSBD.I_Batch_ID
                                      WHERE     TSBD.I_Status IN ( 0, 1, 2 )
                                    ) YY
                             GROUP BY YY.HistoricalBatch
                           ) HistStudentCount ON TT.I_Batch_ID = HistStudentCount.HistoricalBatch
                           
        UPDATE  TT
        SET     TT.CurrBatchStrength = StudentCount.NoOfStudents
        FROM    #temp2 TT
                INNER JOIN ( SELECT TSBD1.I_Batch_ID ,
                                    COUNT(DISTINCT TSBD1.I_Student_ID) AS NoOfStudents
                             FROM   dbo.T_Student_Batch_Details TSBD1
                                    INNER JOIN #temp1 TTT ON TTT.I_Batch_ID = TSBD1.I_Batch_ID
                             WHERE  TSBD1.I_Status = 1
                             GROUP BY TSBD1.I_Batch_ID
                           ) StudentCount ON TT.I_Batch_ID = StudentCount.I_Batch_ID
                           
        UPDATE  TT
        SET     TT.BatchDuration = BatchDuration.Duration
        FROM    #temp2 TT
                INNER JOIN ( SELECT TSBM.I_Batch_ID ,
                                    DATEDIFF(MONTH, TSBM.Dt_BatchStartDate,
                                             TSBM.Dt_Course_Expected_End_Date) AS Duration
                             FROM   dbo.T_Student_Batch_Master TSBM
                                    INNER JOIN dbo.T_Center_Batch_Details TCBD ON TSBM.I_Batch_ID = TCBD.I_Batch_ID
                                    INNER JOIN #temp1 TTT ON TTT.I_Batch_ID = TSBM.I_Batch_ID
                           ) BatchDuration ON TT.I_Batch_ID = BatchDuration.I_Batch_ID
        
        
        --UPDATE TT
        --SET TT.Board=StudentBoard.Board
        --FROM
        --#temp2 TT
        --INNER JOIN
        --(
        --SELECT TTT.I_Student_Detail_ID,TEQD.S_University_Name AS Board FROM #temp1 TTT
        --INNER JOIN dbo.T_Student_Detail TSD ON TTT.I_Student_Detail_ID=TSD.I_Student_Detail_ID
        --INNER JOIN dbo.T_Enquiry_Qualification_Details TEQD ON TSD.I_Enquiry_Regn_ID = TEQD.I_Enquiry_Regn_ID
        --WHERE
        --TEQD.S_Name_Of_Exam='Class XII'
        --) StudentBoard ON TT.I_Student_Detail_ID=StudentBoard.I_Student_Detail_ID  
        
        
        --UPDATE TT
        --SET TT.Contact=StudentBoard.Contact
        --FROM
        --#temp2 TT
        --INNER JOIN
        --(
        --SELECT TTT.I_Student_Detail_ID,TSD.S_Mobile_No AS Contact FROM #temp1 TTT
        --INNER JOIN dbo.T_Student_Detail TSD ON TTT.I_Student_Detail_ID=TSD.I_Student_Detail_ID
        ----INNER JOIN dbo.T_Enquiry_Qualification_Details TEQD ON TSD.I_Enquiry_Regn_ID = TEQD.I_Enquiry_Regn_ID
        ----WHERE
        ----TEQD.S_Name_Of_Exam='Class XII'
        --) StudentBoard ON TT.I_Student_Detail_ID=StudentBoard.I_Student_Detail_ID
                                                                        

        SELECT  *
        FROM    #temp2 ;

    END