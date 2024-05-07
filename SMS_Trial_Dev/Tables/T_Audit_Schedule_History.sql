CREATE TABLE [AUDIT].[T_Audit_Schedule_History] (
    [I_Audit_Schedule_History_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Audit_Schedule_ID]         INT          NULL,
    [I_Center_ID]                 INT          NOT NULL,
    [Dt_Audit_On]                 DATETIME     NULL,
    [I_User_ID]                   INT          NULL,
    [I_Audit_Type_ID]             INT          NULL,
    [I_Status_ID]                 INT          NULL,
    [S_Crtd_By]                   VARCHAR (20) NULL,
    [S_Upd_By]                    VARCHAR (20) NULL,
    [Dt_Crtd_On]                  DATETIME     NULL,
    [Dt_Upd_On]                   DATETIME     NULL,
    CONSTRAINT [PK__T_Audit_Schedule__60597C63] PRIMARY KEY CLUSTERED ([I_Audit_Schedule_History_ID] ASC),
    CONSTRAINT [FK_T_Audit_Schedule_History] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Audit_Schedule_History1] FOREIGN KEY ([I_Audit_Schedule_ID]) REFERENCES [AUDIT].[T_Audit_Schedule] ([I_Audit_Schedule_ID])
);

