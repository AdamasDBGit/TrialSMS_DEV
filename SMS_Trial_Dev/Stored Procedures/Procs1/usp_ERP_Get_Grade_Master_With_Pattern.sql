--exec [dbo].[usp_ERP_Get_Grade_Master] 2
CREATE PROCEDURE [dbo].[usp_ERP_Get_Grade_Master_With_Pattern]
(
  @h_I_Exam_Grade_Master_Header_ID INT = NULL
)
AS
BEGIN
select 
I_Exam_Grade_Master_Header_ID ExamGradeMasterHeaderID,
S_Grade_Name GradeName
from T_ERP_Exam_Grade_Master_Header
where I_Exam_Grade_Master_Header_ID = @h_I_Exam_Grade_Master_Header_ID
AND Is_Active = 1
select 
I_Exam_Grade_Master_ID ExamGradeMasterDetailsID,
I_Exam_Grade_Master_Header_ID ExamGradeMasterHeaderID,
S_Symbol GradeType,
I_Upper_Limit MaximumMarks,
I_Lower_Limit MinimumMarks,
S_Remarks Remarks
from 
T_ERP_Exam_Grade_Master where I_Exam_Grade_Master_Header_ID = @h_I_Exam_Grade_Master_Header_ID 
AND Is_Active = 1
END