CREATE PROCEDURE [dbo].[uspInsertUpdateDeleteNotification]
(
 @NotificationTemplateId int null
,@Title NVARCHAR(200) = null
,@Message NVARCHAR(MAX)= null
,@Type int = null
,@NotificationCategory int =null
,@CreatedBy nvarchar(50)= null
,@Status int=null
,@OperationId int

)
AS
BEGIN
BEGIN TRY  
BEGIN TRANSACTION  
IF(@OperationId>0)
BEGIN
IF (@NotificationTemplateId=0)
BEGIN
IF NOT EXISTS(select * from T_NotificationTemplate where S_Title = @Title)
BEGIN
INSERT INTO T_NotificationTemplate
(
 S_Title
,S_Message
,I_Type
,I_NotificationCategory_ID
,Dt_CreatedAt
,S_CreatedBy
,I_Status
,I_Deleted
)
VALUES
(
@Title
,@Message
,@Type
,@NotificationCategory
,GETDATE()
,@CreatedBy
,@Status
,0
)
select 1 as statusFlag,'Notification created successfully' as Message
END
ELSE
BEGIN
select 0 as statusFlag,'Duplicate notification template !' as Message
END

END
ELSE
BEGIN
IF NOT EXISTS (select * from T_NotificationTemplate where S_Title = @Title and I_NotificationTemplate_ID!=@NotificationTemplateId)
BEGIN
UPDATE T_NotificationTemplate
SET 
 S_Title = @Title
,S_Message = @Message
,I_Type = @Type
,I_NotificationCategory_ID = @NotificationCategory
,Dt_UpdatedAt = GETDATE()
,S_UpdatedBy = @CreatedBy
,I_Status = @Status
where I_NotificationTemplate_ID = @NotificationTemplateId
select 1 as statusFlag,'Notification updated successfully' as Message
END
ELSE
BEGIN
select 0 as statusFlag,'Duplicate notification template !' as Message
END
END
END
ELSE
BEGIN
UPDATE T_NotificationTemplate
SET 
I_Deleted = 1
where I_NotificationTemplate_ID = @NotificationTemplateId
select 1 as statusFlag,'Notification deleted successfully' as Message
END
 COMMIT TRANSACTION  
END TRY 
BEGIN CATCH 
IF @@TRANCOUNT > 0  
ROLLBACK TRANSACTION  
select 0 as statusFlag,'Something went wrong!' as Message,ERROR_MESSAGE() as errorMessage
END CATCH  
END