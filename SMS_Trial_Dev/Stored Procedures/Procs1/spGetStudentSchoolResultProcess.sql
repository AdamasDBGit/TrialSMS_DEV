-- =============================================
-- Author:		Sahidur
-- Create date: 29/05/2023
-- Description:	Result for App
-- =============================================
CREATE PROCEDURE [dbo].[spGetStudentSchoolResultProcess] 
	-- Add the parameters for the stored procedure here
	(
		@S_Student_ID nvarchar(100)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
insert into  T_Student_Result (S_Student_ID,I_Batch_ID,I_Course_ID,I_Term_ID,I_Aggregate_Full_Marks,I_Aggregate_Obtained_Marks
,I_Aggregate_Percentage)	
select 
cm.S_Student_ID
,cm.I_Batch_ID,cm.I_Course_ID
,cm.I_Term_ID
,floor(sum(cm.Class_Sub_Total_FM)) as I_Aggregate_Full_Marks
,floor(sum(cm.Class_Sub_Total_OB)) as I_Aggregate_Obtained_Marks
,CEILING((floor(sum(cm.Class_Sub_Total_OB))/floor(sum(cm.Class_Sub_Total_FM)) )*100) as Aggregate_Percentage
from 
(
select 
sm.S_Student_ID,sm.I_Batch_Exam_ID
,sm.I_Course_ID,sm.I_Batch_ID
,sm.S_Course_Desc,sm.I_Term_ID,sm.S_Term_Name
,sm.I_Exam_Component_ID,sm.S_Component_Name
,sum(sm.I_TotMarks) as Class_Sub_Total_FM
,floor(sum(sm.EffectiveMarks)) as Class_Sub_Total_OB
from 
(
SELECT  TSD.S_Student_ID,TSD.I_Student_Detail_ID,TSM.I_Batch_Exam_ID,TCM.I_Course_ID,TSBM.I_Batch_ID
,TCM.S_Course_Desc
,TBEM.I_Term_ID,TTM.S_Term_Name,
TMES.I_Exam_Component_ID,TECM.S_Component_Name
,SUBSTRING(TECM.S_Component_Name,CHARINDEX('-',TECM.S_Component_Name)+1,LEN(TECM.S_Component_Name)-CHARINDEX('-',TECM.S_Component_Name)) AS SubExamComponentName
,REPLACE(TECM.S_Component_Name,'-'+(SUBSTRING(TECM.S_Component_Name,CHARINDEX('-',TECM.S_Component_Name)+1,LEN(TECM.S_Component_Name)-CHARINDEX('-',TECM.S_Component_Name))),'') as ExamComponentName
,TBEM.I_Module_ID,TMM.S_Module_Name,TMES.I_TotMarks,TMES.N_Weightage,
ISNULL(TSM.I_Exam_Total,NULL) as MarksObtained,
CASE WHEN (TMES.N_Weightage=100.00 OR TMES.N_Weightage=0.00) THEN ISNULL(TSM.I_Exam_Total,0) ELSE ROUND((ISNULL(TSM.I_Exam_Total,0)*TMES.N_Weightage)/TMES.I_TotMarks,0) END as EffectiveMarks,
TMTM.I_Sequence,0 as CumMarks,TMES.I_Module_Strategy_ID
FROM EXAMINATION.T_Student_Marks AS TSM
INNER JOIN EXAMINATION.T_Batch_Exam_Map AS TBEM ON TBEM.I_Batch_Exam_ID = TSM.I_Batch_Exam_ID
INNER JOIN dbo.T_Student_Batch_Master AS TSBM ON TSBM.I_Batch_ID = TBEM.I_Batch_ID
INNER JOIN dbo.T_Course_Master AS TCM ON TCM.I_Course_ID = TSBM.I_Course_ID
INNER JOIN dbo.T_Student_Detail AS TSD ON TSD.I_Student_Detail_ID = TSM.I_Student_Detail_ID
INNER JOIN dbo.T_Student_Batch_Details AS TSBD ON TSBD.I_Student_Id= TSM.I_Student_Detail_ID 
	AND TSBD.I_Batch_ID = TSBM.I_Batch_ID
INNER JOIN dbo.T_Center_Hierarchy_Name_Details AS TCHND ON TCHND.I_Center_ID = TSM.I_Center_ID
INNER JOIN dbo.T_Term_Master AS TTM ON TTM.I_Term_ID = TBEM.I_Term_ID
INNER JOIN dbo.T_Module_Master AS TMM ON TMM.I_Module_ID = TBEM.I_Module_ID
INNER JOIN T_Module_Term_Map TMTM on TMM.I_Module_ID=TMTM.I_Module_ID and TTM.I_Term_ID=TMTM.I_Term_ID and TMTM.I_Status=1
INNER JOIN dbo.T_Exam_Component_Master AS TECM ON TECM.I_Exam_Component_ID = TBEM.I_Exam_Component_ID
INNER JOIN dbo.T_Module_Eval_Strategy AS TMES ON TMES.I_Module_ID=TBEM.I_Module_ID 
			AND TMES.I_Exam_Component_ID = TBEM.I_Exam_Component_ID 
			AND TMES.I_Term_ID = TBEM.I_Term_ID AND TMES.I_Status=1 
			AND TMES.I_Course_ID=TCM.I_Course_ID

WHERE
TBEM.I_Status=1 AND TCHND.I_Brand_ID=107 
-- AND TSM.I_Center_ID=@CentreID  
-- AND TSBM.I_Course_ID=@CourseID 
-- AND TBEM.I_Batch_ID=10701
-- AND TBEM.I_Term_ID = 1862
-- AND TBEM.I_Term_ID=ISNULL(@TermID,TTM.I_Term_ID)
AND TSD.S_Student_ID='17-0009'
-- AND TCM.S_Course_Desc = 'Class 3'
-- and TSBD.I_Status='1'
) as sm 
group by sm.S_Student_ID
,sm.I_Course_ID,sm.I_Batch_Exam_ID,sm.I_Batch_ID
,sm.S_Course_Desc,sm.I_Term_ID,sm.S_Term_Name
,sm.I_Exam_Component_ID,sm.S_Component_Name
/*order by sm.S_Student_ID
,sm.I_Course_ID,sm.I_Batch_ID
,sm.I_Term_ID
,sm.I_Exam_Component_ID,sm.S_Component_Name
*/
) as cm 
group by cm.S_Student_ID
,cm.I_Batch_ID,cm.I_Course_ID
,cm.I_Term_ID
order by cm.S_Student_ID
,cm.I_Course_ID,cm.I_Batch_ID
,cm.I_Term_ID
;


insert into T_Student_Result_Detail(S_Student_ID,I_Batch_Exam_ID,I_Course_ID,I_Batch_ID,I_Term_ID,I_Exam_Component_ID,I_Full_Marks,I_Obtained_Marks)
select 
sm.S_Student_ID
,sm.I_Batch_Exam_ID
,sm.I_Course_ID,sm.I_Batch_ID
--,sm.S_Course_Desc
,sm.I_Term_ID
-- ,sm.S_Term_Name
,sm.I_Exam_Component_ID
-- ,sm.S_Component_Name
,sum(sm.I_TotMarks) as I_Full_Marks

,floor(sum(sm.EffectiveMarks)) as I_Obtained_Marks
from 
(
SELECT  TSD.S_Student_ID,TSM.I_Batch_Exam_ID,TSD.I_Student_Detail_ID,TCM.I_Course_ID,TSBM.I_Batch_ID
,TCM.S_Course_Desc
,TBEM.I_Term_ID,TTM.S_Term_Name,
TMES.I_Exam_Component_ID,TECM.S_Component_Name
,SUBSTRING(TECM.S_Component_Name,CHARINDEX('-',TECM.S_Component_Name)+1,LEN(TECM.S_Component_Name)-CHARINDEX('-',TECM.S_Component_Name)) AS SubExamComponentName
,REPLACE(TECM.S_Component_Name,'-'+(SUBSTRING(TECM.S_Component_Name,CHARINDEX('-',TECM.S_Component_Name)+1,LEN(TECM.S_Component_Name)-CHARINDEX('-',TECM.S_Component_Name))),'') as ExamComponentName
,TBEM.I_Module_ID,TMM.S_Module_Name,TMES.I_TotMarks,TMES.N_Weightage,
ISNULL(TSM.I_Exam_Total,NULL) as MarksObtained,
CASE WHEN (TMES.N_Weightage is null OR TMES.N_Weightage=0.00) THEN ISNULL(TSM.I_Exam_Total,0) ELSE ROUND((ISNULL(TSM.I_Exam_Total,0)*TMES.N_Weightage)/TMES.I_TotMarks,0) END as EffectiveMarks,
TMTM.I_Sequence,0 as CumMarks,TMES.I_Module_Strategy_ID
FROM EXAMINATION.T_Student_Marks AS TSM
INNER JOIN EXAMINATION.T_Batch_Exam_Map AS TBEM ON TBEM.I_Batch_Exam_ID = TSM.I_Batch_Exam_ID
INNER JOIN dbo.T_Student_Batch_Master AS TSBM ON TSBM.I_Batch_ID = TBEM.I_Batch_ID
INNER JOIN dbo.T_Course_Master AS TCM ON TCM.I_Course_ID = TSBM.I_Course_ID
INNER JOIN dbo.T_Student_Detail AS TSD ON TSD.I_Student_Detail_ID = TSM.I_Student_Detail_ID
INNER JOIN dbo.T_Student_Batch_Details AS TSBD ON TSBD.I_Student_Id= TSM.I_Student_Detail_ID 
	AND TSBD.I_Batch_ID = TSBM.I_Batch_ID
INNER JOIN dbo.T_Center_Hierarchy_Name_Details AS TCHND ON TCHND.I_Center_ID = TSM.I_Center_ID
INNER JOIN dbo.T_Term_Master AS TTM ON TTM.I_Term_ID = TBEM.I_Term_ID
INNER JOIN dbo.T_Module_Master AS TMM ON TMM.I_Module_ID = TBEM.I_Module_ID
INNER JOIN T_Module_Term_Map TMTM on TMM.I_Module_ID=TMTM.I_Module_ID and TTM.I_Term_ID=TMTM.I_Term_ID and TMTM.I_Status=1
INNER JOIN dbo.T_Exam_Component_Master AS TECM ON TECM.I_Exam_Component_ID = TBEM.I_Exam_Component_ID
INNER JOIN dbo.T_Module_Eval_Strategy AS TMES ON TMES.I_Module_ID=TBEM.I_Module_ID 
			AND TMES.I_Exam_Component_ID = TBEM.I_Exam_Component_ID 
			AND TMES.I_Term_ID = TBEM.I_Term_ID AND TMES.I_Status=1 
			AND TMES.I_Course_ID=TCM.I_Course_ID

WHERE
TBEM.I_Status=1 AND TCHND.I_Brand_ID=107 
-- AND TSM.I_Center_ID=@CentreID  
-- AND TSBM.I_Course_ID=@CourseID 
-- AND TBEM.I_Batch_ID=10701
-- AND TBEM.I_Term_ID = 1862
-- AND TBEM.I_Term_ID=ISNULL(@TermID,TTM.I_Term_ID)
AND TSD.S_Student_ID= '17-0009'
-- AND TCM.S_Course_Desc = 'Class 3'
-- and TSBD.I_Status='1'
) as sm 
group by sm.S_Student_ID,sm.I_Batch_Exam_ID
,sm.I_Course_ID,sm.I_Batch_ID
,sm.I_Term_ID
,sm.I_Exam_Component_ID
order by sm.S_Student_ID
,sm.I_Course_ID,sm.I_Batch_ID
,sm.I_Term_ID
,sm.I_Exam_Component_ID
;

END
