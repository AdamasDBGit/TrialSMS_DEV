CREATE PROCEDURE [dbo].[uspGetNotification]
(
 @NotificationTemplateId int null
)
AS
BEGIN
SELECT
I_NotificationTemplate_ID as NotificationTemplateID
,S_Title as Title
,S_Message as Message
,I_Type as Type
,I_NotificationCategory_ID as NotificationCategory
,I_Status as Status
,I_Deleted as Deleted
,I_IsApproved IsApproved
FROM T_NotificationTemplate 
where I_NotificationTemplate_ID = ISNULL(@NotificationTemplateId,I_NotificationTemplate_ID)
order by Dt_CreatedAt desc
END