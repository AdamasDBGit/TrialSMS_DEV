﻿
--exec [REPORT].[uspGetAISPROGRESSREPORTNew] 758,null,null
CREATE PROCEDURE [REPORT].[uspGetAISPROGRESSREPORTNew]
    (
      @sHierarchyList varchar(MAX),
	  @iBrandID int,
      @iBatchID INT, 
      @iTermID int =Null,
      @iStudentID int =Null
   
    )
AS 
    BEGIN
    Declare @iCourseID INT,
			@sCourierName varchar(50),
			@sBatchName varchar(100),
			@iBatchExamID Int,
			@iModuleID int,
			@iExamComponentID int,
			@sStudentName VARCHAR(250),
			@sStudentID VARCHAR(250)

	SELECT  @iCourseID=tsbm.I_Course_ID,
			@sBatchName=tsbm.S_Batch_Name,
			@sCourierName=tcm.S_Course_Name
	FROM dbo.T_Student_Batch_Master AS tsbm
	INNER JOIN T_Course_Master tcm on tcm.I_Course_ID=tsbm.I_Course_ID
	where tsbm.I_Batch_ID=@iBatchID

  CREATE TABLE #tbltempResult 
            (
              I_Center_ID INT ,
              I_Batch_Exam_ID INT,
              I_Batch_ID INT,
              I_Course_ID INT,
              courseSequence INT,
              I_Term_ID INT,
              I_Module_ID INT,
              S_Module_Name Varchar(250),
              I_Exam_Component_ID INT,
              S_Component_Name varchar(250),
              GradeSequence INT,
              I_Student_Detail_ID INT,
              I_Exam_Total Numeric(8,2),
              ModuleID1 INT,
              ModuleID1Marks Numeric(8,2),
			  ModuleID2 INT,
			  ModuleID2Marks Numeric(8,2),
			  ModuleID3 INT,
		      ModuleID3Marks Numeric(8,2),
		      ModuleID4 INT,
	 	     ModuleID4Marks Numeric(8,2)
                         
            )


     CREATE TABLE #tblResult 
            (
              I_Student_Detail_ID INT ,
              S_Student_ID VARCHAR(250) ,
              S_Student_Name VARCHAR(150) ,
              I_Course_ID INT ,
              S_Course_Name VARCHAR(250) ,
              I_Batch_ID INT ,
              S_Batch_Name VARCHAR(250) ,
              I_Term_ID INT ,
              S_Term_Name VARCHAR(250) ,
              I_Exam_Component_ID INT ,
              S_Exam_Component_Name VARCHAR(200) ,
              I_Module_ID1 INT,
              ModuleID1FullMarks INT,
			  I_Exam_Total1 Numeric(8,2),
			  I_Module_ID2 INT,
			  ModuleID2FullMarks INT,
			  I_Exam_Total2 Numeric(8,2),
			  I_Module_ID3 INT,
			  ModuleID3FullMarks INT,
			  I_Exam_Total3 Numeric(8,2),
			  I_Module_ID4 INT,
			  ModuleID4FullMarks INT,
			  I_Exam_Total4 Numeric(8,2),
			  TotalMarks Numeric(8,2),
			  HighestMarks Numeric(8,2)
			 
              
            )
            
            
            INSERT INTO #tblResult(
            I_Student_Detail_ID  ,
              S_Student_ID  ,
              S_Student_Name  ,
              I_Course_ID  ,
              S_Course_Name  ,
              I_Batch_ID  ,
              S_Batch_Name , 
              I_Term_ID  ,
              S_Term_Name  ,
              I_Exam_Component_ID  ,
              S_Exam_Component_Name 
            
            )
            SELECT distinct tsd.I_Student_Detail_ID,
            TSD.S_Student_ID,
            TSD.S_First_Name + ' ' + ISNULL(TSD.S_Middle_Name, '')+ ' ' + TSD.S_Last_Name StudentName,
            @iCourseID,
            @sCourierName,
            @iBatchID,
            @sBatchName,
            TBEM.I_Term_ID,
			TTM.S_Term_Name,
			TBEM.I_Exam_Component_ID,
			tecm.S_Component_Name
                  
            
  FROM EXAMINATION.T_Batch_Exam_Map AS tbem with(NOLOCK)
  INNER JOIN EXAMINATION.T_Student_Marks TSM with(NOLOCK) ON tsm.I_Batch_Exam_ID=tbem.I_Batch_Exam_ID
  INNER JOIN dbo.T_Student_Detail AS tsd with(NOLOCK) ON tsm.I_Student_Detail_ID=tsd.I_Student_Detail_ID
  INNER JOIN dbo.T_Term_Master TTM with(NOLOCK) ON TBEM.I_Term_ID=TTM.I_Term_ID
  INNER JOIN dbo.T_Exam_Component_Master  AS tecm with(NOLOCK) ON TBEM.I_Exam_Component_ID = tecm.I_Exam_Component_ID
  where tbem.I_Batch_ID=@iBatchID and tbem.I_Term_ID=ISNULL(@iTermID,tbem.I_Term_ID) and TSM.I_Student_Detail_ID=ISNULL(@istudentid,TSM.I_Student_Detail_ID)
  ORDER BY tsd.I_Student_Detail_ID,TBEM.I_Exam_Component_ID
  
  
  
  INSERT INTO #tbltempResult 
            (
              I_Center_ID  ,
              I_Batch_Exam_ID ,
              I_Batch_ID ,
              I_Course_ID ,
              courseSequence ,
              I_Term_ID ,
              I_Module_ID ,
              S_Module_Name ,
              I_Exam_Component_ID ,
              S_Component_Name ,
              GradeSequence ,
              I_Student_Detail_ID ,
              I_Exam_Total ,
              ModuleID1 ,
			  ModuleID1Marks ,
			  ModuleID2 ,
			  ModuleID2Marks ,
			  ModuleID3 ,
		      ModuleID3Marks ,
		      ModuleID4 ,
		     ModuleID4Marks 
                         
            )
 select  TSM.I_Center_ID,
		TSM.I_Batch_Exam_ID,
		TBEM.I_Batch_ID, 
		tsbm.I_Course_ID,
		ttcm.I_Sequence courseSequence,
		TBEM.I_Term_ID,
		TBEM.I_Module_ID,
		tmm.S_Module_Name,
		TBEM.I_Exam_Component_ID,
		tecm.S_Component_Name, 
		 tmtm.I_Sequence GradeSequence,
		TSM.I_Student_Detail_ID,
		TSM.I_Exam_Total ,
		Case when tmtm.I_Sequence=1 then TBEM.I_Module_ID else Null end ModuleID1,
		Case when tmtm.I_Sequence=1 then TSM.I_Exam_Total else Null end ModuleID1Marks,
		Case when tmtm.I_Sequence=2 then TBEM.I_Module_ID else Null end ModuleID2,
		Case when tmtm.I_Sequence=2 then TSM.I_Exam_Total else Null end ModuleID2Marks,
		Case when tmtm.I_Sequence=3 then TBEM.I_Module_ID else Null end ModuleID3,
		Case when tmtm.I_Sequence=3 then TSM.I_Exam_Total else Null end ModuleID3Marks,
		Case when tmtm.I_Sequence=4 then TBEM.I_Module_ID else Null end ModuleID4,
		Case when tmtm.I_Sequence=4 then TSM.I_Exam_Total else Null end ModuleID4Marks
		from EXAMINATION.T_Student_Marks TSM with(NOLOCK)
		INNER JOIN EXAMINATION.T_Batch_Exam_Map TBEM with(NOLOCK) ON TBEM.I_Batch_Exam_ID = TSM.I_Batch_Exam_ID
		INNER JOIN dbo.T_Exam_Component_Master AS tecm with(NOLOCK) ON tbem.I_Exam_Component_ID = tecm.I_Exam_Component_ID
		INNER JOIN  dbo.T_Module_Master AS tmm with(NOLOCK) ON TBEM.I_Module_ID =tmm.I_Module_ID
		INNER JOIN dbo.T_Module_Term_Map AS tmtm with(NOLOCK) ON tbem.I_Module_ID = tmtm.I_Module_ID AND tbem.I_Term_ID = tmtm.I_Term_ID	 AND tmtm.I_Status = 1
		INNER JOIN dbo.T_Term_Course_Map AS ttcm with(NOLOCK) ON tmtm.I_Term_ID = ttcm.I_Term_ID AND ttcm.I_Status = 1
		INNER JOIN dbo.T_Student_Batch_Master tsbm with(NOLOCK) ON tsbm.I_Batch_ID = tbem.I_Batch_ID	
		INNER JOIN #tblResult A ON TSM.I_Student_Detail_ID=A.I_Student_Detail_ID
  
  
  
  
  --select * from #tbltempResult
  
  UPDATE T SET  I_Module_ID1 =V.ModuleID1,
			  I_Exam_Total1 =V.ModuleID1Marks  FROM #tblResult T INNER JOIN #tbltempResult V ON T.I_Course_ID=V.I_Course_ID and T.I_Term_ID =V.I_Term_ID and T.I_Student_Detail_ID=V.I_Student_Detail_ID and T.I_Exam_Component_ID=V.I_Exam_Component_ID and V.GradeSequence=1
            
 
  UPDATE T SET  I_Module_ID2 =V.ModuleID2,
			  I_Exam_Total2 =V.ModuleID2Marks  FROM #tblResult T INNER JOIN #tbltempResult V ON T.I_Course_ID=V.I_Course_ID and T.I_Term_ID =V.I_Term_ID and T.I_Student_Detail_ID=V.I_Student_Detail_ID and T.I_Exam_Component_ID=V.I_Exam_Component_ID and V.GradeSequence=2
			  
  UPDATE T SET  I_Module_ID3 =V.ModuleID3,
			  I_Exam_Total3 =V.ModuleID3Marks  FROM #tblResult T INNER JOIN #tbltempResult V ON T.I_Course_ID=V.I_Course_ID and T.I_Term_ID =V.I_Term_ID and T.I_Student_Detail_ID=V.I_Student_Detail_ID and T.I_Exam_Component_ID=V.I_Exam_Component_ID and V.GradeSequence=3
			  
  UPDATE T SET  I_Module_ID4 =V.ModuleID4,
			  I_Exam_Total4 =V.ModuleID4Marks  FROM #tblResult T INNER JOIN #tbltempResult V ON T.I_Course_ID=V.I_Course_ID and T.I_Term_ID =V.I_Term_ID and T.I_Student_Detail_ID=V.I_Student_Detail_ID and T.I_Exam_Component_ID=V.I_Exam_Component_ID and V.GradeSequence=4
  
          
 UPDATE #tblResult SET   TotalMarks=ISNULL(I_Exam_Total1,0)+ISNULL(I_Exam_Total2,0)+ISNULL(I_Exam_Total3,0)+ISNULL(I_Exam_Total4,0)
         
        
        
    
         
       Update T set HighestMarks =VR.Marks FROM #tblResult    T INNER JOIN 
         (select V.I_Course_ID,V.I_Term_ID,V.I_Exam_Component_ID,MAX(V.Marks)Marks  from ( 
         SELECT tsbm.I_Course_ID,tmtm.I_Term_ID,tbem.I_Exam_Component_ID ,tsm.I_Student_Detail_ID,sum(ISNULL(I_Exam_Total,0)) Marks
		FROM EXAMINATION.T_Student_Marks AS tsm with(NOLOCK)
		INNER JOIN EXAMINATION.T_Batch_Exam_Map tbem with(NOLOCK) ON tbem.I_Batch_Exam_ID = tsm.I_Batch_Exam_ID
		INNER JOIN dbo.T_Student_Batch_Master tsbm with(NOLOCK) ON tsbm.I_Batch_ID = tbem.I_Batch_ID
		INNER JOIN dbo.T_Module_Term_Map AS tmtm with(NOLOCK) ON tbem.I_Module_ID = tmtm.I_Module_ID AND tbem.I_Term_ID = tmtm.I_Term_ID AND tmtm.I_Status = 1
		INNER JOIN dbo.T_Module_Eval_Strategy AS tmes with(NOLOCK) ON tmes.I_Module_ID = tbem.I_Module_ID AND tmes.I_Term_ID = tbem.I_Term_ID AND tmes.I_Exam_Component_ID = tbem.I_Exam_Component_ID
		INNER JOIN dbo.T_Exam_Component_Master AS tecm with(NOLOCK) ON tbem.I_Exam_Component_ID = tecm.I_Exam_Component_ID
		Group BY  tsbm.I_Course_ID,tmtm.I_Term_ID,tbem.I_Exam_Component_ID,tsm.I_Student_Detail_ID)V 
		Group BY V.I_Course_ID,V.I_Term_ID,V.I_Exam_Component_ID ) VR
		ON T.I_Course_ID=VR.I_Course_ID and T.I_Term_ID=VR.I_Term_ID
		and VR.I_Exam_Component_ID=T.I_Exam_Component_ID
          
          UPDATE #tblResult SET ModuleID1FullMarks=100 where  I_Module_ID1  is not null and I_Module_ID2  is null 
          and I_Module_ID3  is null and I_Module_ID4  is null
          
           UPDATE #tblResult SET ModuleID1FullMarks=50 where  I_Module_ID1  is not null and I_Module_ID2  is not  null 
          and I_Module_ID3  is null and I_Module_ID4  is null
              UPDATE #tblResult SET ModuleID2FullMarks=80 where  I_Module_ID1  is not null and I_Module_ID2  is not  null 
          and I_Module_ID3  is null and I_Module_ID4  is null
          
          
           UPDATE #tblResult SET ModuleID1FullMarks=25 where  I_Module_ID1  is not null and I_Module_ID2  is not  null 
          and I_Module_ID3  is not null and I_Module_ID4  is not null
              
           UPDATE #tblResult SET ModuleID2FullMarks=25 where  I_Module_ID1  is not null and I_Module_ID2  is not  null 
          and I_Module_ID3  is not null and I_Module_ID4  is not null
           UPDATE #tblResult SET ModuleID3FullMarks=25 where  I_Module_ID1  is not null and I_Module_ID2  is not  null 
          and I_Module_ID3  is not null and I_Module_ID4  is not null
           UPDATE #tblResult SET ModuleID4FullMarks=25 where  I_Module_ID1  is not null and I_Module_ID2  is not  null 
          and I_Module_ID3  is not null and I_Module_ID4  is not null
		SELECT   * FROM #tblResult AS tr                        
    END
