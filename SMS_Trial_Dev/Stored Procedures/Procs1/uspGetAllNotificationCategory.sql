CREATE PROCEDURE [dbo].[uspGetAllNotificationCategory]
(
@NotificationCategoryID int
)

AS 

BEGIN TRY

    SET NoCount ON ;
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT 
I_NotificationCategory_ID NotificationCategoryID
,S_NotificationCategory_Name NotificationCategoryName
FROM T_NotificationCategory where I_status = 1 and I_NotificationCategory_ID = ISNULL(@NotificationCategoryID,I_NotificationCategory_ID)
	
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
    DECLARE @ErrMsg NVARCHAR(4000),@ErrSeverity INT
    SELECT  @ErrMsg = ERROR_MESSAGE(),@ErrSeverity = ERROR_SEVERITY()
    RAISERROR ( @ErrMsg, @ErrSeverity, 1 )

END CATCH
