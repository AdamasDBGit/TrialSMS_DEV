CREATE PROCEDURE [REPORT].[uspGetExamAttendanceReport]
    (
      @sHierarchyList VARCHAR(MAX) = NULL ,
      @iBrandID INT = NULL ,
      @dtStartDate DATE = NULL ,
      @dtEndDate DATE = NULL
    )
AS 
    BEGIN
	
        CREATE TABLE #EMSData
            (
              Dt_Exam_Date DATE ,
              I_Exam_Category_ID INT ,
              S_Exam_Category_Name VARCHAR(250) ,
              I_Exam_ID INT ,
              S_Student_ID VARCHAR(250) ,
              N_Student_Marks NUMERIC(18, 2)
            )

        INSERT  INTO #EMSData
                ( Dt_Exam_Date ,
                  I_Exam_Category_ID ,
                  S_Exam_Category_Name ,
                  I_Exam_ID ,
                  S_Student_ID ,
                  N_Student_Marks
                )
        SELECT * FROM OPENQUERY (QBOLE, 'SELECT  tsqah.Dt_Crtd_On ,
                        toem.I_Exam_Category_ID ,
                        toem.S_Exam_Category_Name ,
                        tsqah.I_Exam_ID ,
                        S_Crtd_By ,
                        Student_Marks
                FROM    RICE_ExamPortal.Examination.T_Student_Question_Answer_History
                        AS tsqah
                        INNER JOIN RICE_ExamPortal.Examination.T_Offline_Examination_Master
                        AS toem ON tsqah.I_Exam_ID = toem.I_Exam_ID
                UNION
                SELECT  tsqa.Dt_Crtd_On ,
                        toem.I_Exam_Category_ID ,
                        toem.S_Exam_Category_Name ,
                        tsqa.I_Exam_ID ,
                        S_Crtd_By ,
                        Student_Marks
                FROM    RICE_ExamPortal.Examination.T_Student_Question_Answer
                        AS tsqa
                        INNER JOIN RICE_ExamPortal.Examination.T_Offline_Examination_Master
                        AS toem ON tsqa.I_Exam_ID = toem.I_Exam_ID') EMSData

		--SELECT DISTINCT I_Batch_ID, ed.I_Exam_Category_ID, ed.S_Exam_Category_Name, ed2.Dt_Exam_Date 
		--INTO #Temp1
		--FROM #EMSData AS ed
		--INNER JOIN dbo.T_Student_Detail AS tsd ON ed.S_Student_ID  collate SQL_Latin1_General_CP1_CI_AS = tsd.S_Student_ID  collate SQL_Latin1_General_CP1_CI_AS
		--INNER JOIN dbo.T_Student_Batch_Details AS tsbd ON tsbd.I_Student_ID = tsd.I_Student_Detail_ID
		
		SELECT I_Batch_ID, ed.I_Exam_Category_ID, ed.S_Exam_Category_Name, COUNT(DISTINCT ed.I_Exam_ID) AS Batch_Exam_Count
		INTO #Temp
		FROM #EMSData AS ed
		INNER JOIN dbo.T_Student_Detail AS tsd ON ed.S_Student_ID  collate SQL_Latin1_General_CP1_CI_AS = tsd.S_Student_ID  collate SQL_Latin1_General_CP1_CI_AS
		INNER JOIN dbo.T_Student_Batch_Details AS tsbd ON tsbd.I_Student_ID = tsd.I_Student_Detail_ID
		WHERE ed.Dt_Exam_Date BETWEEN @dtStartDate AND @dtEndDate
		and
		tsbd.I_Status=1
		GROUP BY I_Batch_ID, I_Exam_Category_ID, S_Exam_Category_Name

        SELECT  FN2.instanceChain, tsbd.I_Batch_ID, tsbm.S_Batch_Name, tsd.S_Student_ID, tsd.S_First_Name + ' ' + ISNULL(tsd.S_Middle_Name,'') + ' ' + S_Last_Name AS S_Student_Name, I_RollNo , Temp.S_Exam_Category_Name,
				Temp.Batch_Exam_Count, COUNT(ed.S_Student_ID) AS Student_Attended
        FROM    dbo.T_Center_Batch_Details AS tcbd
        INNER JOIN [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                          @iBrandID) FN1 ON tcbd.I_Centre_Id = FN1.CenterID
        INNER JOIN [dbo].[fnGetInstanceNameChainForReports](@sHierarchyList,
                                                              @iBrandID) FN2 ON FN1.HierarchyDetailID = FN2.HierarchyDetailID
		INNER JOIN dbo.T_Student_Batch_Details AS tsbd ON tsbd.I_Batch_ID = tcbd.I_Batch_ID
		INNER JOIN dbo.T_Student_Batch_Master AS tsbm ON tcbd.I_Batch_ID = tsbm.I_Batch_ID
		INNER JOIN dbo.T_Student_Detail AS tsd ON tsd.I_Student_Detail_ID = tsbd.I_Student_ID
		INNER JOIN #Temp  Temp ON Temp.I_Batch_ID = tsbd.I_Batch_ID
		LEFT OUTER JOIN	#EMSData AS ed ON ed.S_Student_ID  collate SQL_Latin1_General_CP1_CI_AS  = tsd.S_Student_ID	collate SQL_Latin1_General_CP1_CI_AS 	
		AND Temp.I_Exam_Category_ID = ed.I_Exam_Category_ID AND ed.Dt_Exam_Date BETWEEN @dtStartDate AND @dtEndDate
		where tsbd.I_Status=1/*to check batch transfer*/
		GROUP BY FN2.instanceChain, tsbd.I_Batch_ID, tsbm.S_Batch_Name, tsd.S_Student_ID, tsd.S_First_Name + ' ' + ISNULL(tsd.S_Middle_Name,'') + ' ' + S_Last_Name,
		I_RollNo , Temp.S_Exam_Category_Name,Temp.Batch_Exam_Count
		ORDER BY S_Batch_Name, tsd.I_RollNo
    END