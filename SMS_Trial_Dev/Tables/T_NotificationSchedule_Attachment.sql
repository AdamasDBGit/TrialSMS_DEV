CREATE TABLE [dbo].[T_NotificationSchedule_Attachment] (
    [I_NotificationSchedule_Attachment_ID] INT            IDENTITY (1, 1) NOT NULL,
    [I_NotificationSchedule_ID]            INT            NULL,
    [S_AttachmentFileName]                 NVARCHAR (MAX) NULL,
    [S_CreatedBy]                          VARCHAR (MAX)  NULL,
    [Dt_CreatedOn]                         DATETIME       NULL
);

