CREATE PROCEDURE [dbo].[uspApproveNotificationTemplate]
(
 @NotificationTemplateId int null
)
AS
BEGIN
BEGIN TRY  
BEGIN TRANSACTION  
UPDATE T_NotificationTemplate set I_IsApproved = 1
where I_NotificationTemplate_ID = @NotificationTemplateId
select 1 as statusFlag,'Template approved successfully' as Message
 COMMIT TRANSACTION  
END TRY 
BEGIN CATCH 
IF @@TRANCOUNT > 0  
ROLLBACK TRANSACTION  
select 0 as statusFlag,'Something went wrong!' as Message,ERROR_MESSAGE() as errorMessage
END CATCH  
END