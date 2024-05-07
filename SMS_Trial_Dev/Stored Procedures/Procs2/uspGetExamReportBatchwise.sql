CREATE PROCEDURE [REPORT].[uspGetExamReportBatchwise]
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

        SELECT  tsbd.I_Batch_ID, S_Batch_Name, dbo.[fnGetTotalStudentCount](TSBM.I_Batch_ID) TotalStudentCount , I_Exam_ID, 
				S_Exam_Category_Name, Dt_Exam_Date, COUNT(E.S_Student_ID) AS Student_Count, FN2.instanceChain
        FROM    #EMSData E
                INNER JOIN dbo.T_Student_Detail AS tsd ON E.S_Student_ID collate SQL_Latin1_General_CP1_CI_AS = tsd.S_Student_ID collate SQL_Latin1_General_CP1_CI_AS
                INNER JOIN dbo.T_Student_Batch_Details AS tsbd ON tsbd.I_Student_ID = tsd.I_Student_Detail_ID
                INNER JOIN dbo.T_Student_Batch_Master AS tsbm ON tsbm.I_Batch_ID = tsbd.I_Batch_ID
                INNER JOIN dbo.T_Student_Center_Detail AS tscd ON tscd.I_Student_Detail_ID = tsd.I_Student_Detail_ID
                INNER JOIN [dbo].[fnGetCentersForReports](@sHierarchyList,
                                                          @iBrandID) FN1 ON tscd.I_Centre_Id = FN1.CenterID
                INNER JOIN [dbo].[fnGetInstanceNameChainForReports](@sHierarchyList,
                                                              @iBrandID) FN2 ON FN1.HierarchyDetailID = FN2.HierarchyDetailID
		WHERE E.Dt_Exam_Date BETWEEN @dtStartDate AND @dtEndDate
		GROUP BY tsbd.I_Batch_ID, S_Batch_Name, dbo.[fnGetTotalStudentCount](TSBM.I_Batch_ID) , I_Exam_ID ,S_Exam_Category_Name,
				Dt_Exam_Date, FN2.instanceChain
		ORDER BY S_Batch_Name, I_Exam_ID
    END