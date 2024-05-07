CREATE PROCEDURE [dbo].[uspGetNotificationByMobile]
(
@sStudentID nvarchar(15),
@iInterval int
)
AS 

BEGIN TRY

    SET NoCount ON ;
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
	DECLARE @Days int
	SET @Days = CASE @iInterval
                     WHEN 1 THEN 1 -- days
					 WHEN 2 THEN 2
					 WHEN 3 THEN 7
					 WHEN 4 THEN 15
					 WHEN 5 THEN 30
					 WHEN 6 THEN 90
					 WHEN 7 THEN 180
					 WHEN 8 THEN 365
                   END 
select NR.I_NotificationSchedule_ID ID
,NS.S_Title Title
,NS.S_MessageBody Message
,NS.Dt_ScheduleDateTime Date 
--,NT.I_NotificationCategory_ID
,NC.I_NotificationCategory_ID CategoryID
,NC.S_NotificationCategory_Name Category
from T_NotificationRecipient NR inner join T_Student_Detail SD ON SD.I_Student_Detail_ID = NR.I_Recepient_ID
inner join T_NotificationSchedule NS ON NS.I_NotificationSchedule_ID = NR.I_NotificationSchedule_ID
inner join T_NotificationTemplate NT ON NT.I_NotificationTemplate_ID = NS.I_NotificationTemplate_ID
inner join T_NotificationCategory NC ON NC.I_NotificationCategory_ID = NT.I_NotificationCategory_ID
WHERE SD.S_Student_ID = @sStudentID and NS.Dt_ScheduleDateTime>=DATEADD(DAY,-@Days,GETDATE()) and NS.Dt_ScheduleDateTime<GETDATE()
ORDER BY NS.Dt_ScheduleDateTime desc


	
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
    DECLARE @ErrMsg NVARCHAR(4000),@ErrSeverity INT
    SELECT  @ErrMsg = ERROR_MESSAGE(),@ErrSeverity = ERROR_SEVERITY()
    RAISERROR ( @ErrMsg, @ErrSeverity, 1 )

END CATCH
