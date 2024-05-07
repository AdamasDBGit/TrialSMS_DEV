CREATE TABLE [dbo].[T_NotificationTemplate] (
    [I_NotificationTemplate_ID] INT            IDENTITY (1, 1) NOT NULL,
    [S_Title]                   NVARCHAR (200) NOT NULL,
    [S_Message]                 NVARCHAR (MAX) NOT NULL,
    [I_Type]                    INT            NULL,
    [I_NotificationCategory_ID] INT            NULL,
    [S_ImageUrl]                NVARCHAR (MAX) NULL,
    [Dt_CreatedAt]              DATETIME       NULL,
    [S_CreatedBy]               NVARCHAR (50)  NULL,
    [Dt_UpdatedAt]              DATETIME       NULL,
    [S_UpdatedBy]               NVARCHAR (50)  NULL,
    [I_Deleted]                 INT            NULL,
    [I_Status]                  INT            NULL,
    [I_IsApproved]              INT            NULL,
    CONSTRAINT [PK_T_NotificationTemplate] PRIMARY KEY CLUSTERED ([I_NotificationTemplate_ID] ASC)
);

