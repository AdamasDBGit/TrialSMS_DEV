--exec [uspGetAllResultByExamScheduleId] 3
CREATE PROCEDURE [dbo].[uspUpdateExamSchedulePublishDate]
(
	@iExamScheduleID int = null,
	@dtDate datetime = null
)
AS

BEGIN TRY 

  UPDATE T_Result_Exam_Schedule set Dt_Result_Publish_Date = @dtDate where I_Result_Exam_Schedule_ID = @iExamScheduleID
		select 1 StatusFlag,'Publish date updated' Message
END TRY
BEGIN CATCH
	
	DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int

	SELECT	@ErrMsg = ERROR_MESSAGE(),
			@ErrSeverity = ERROR_SEVERITY()

	RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH
