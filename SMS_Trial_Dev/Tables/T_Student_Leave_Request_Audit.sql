CREATE TABLE [dbo].[T_Student_Leave_Request_Audit] (
    [I_Student_Leave_Audit_ID] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Student_Leave_ID]       INT           NULL,
    [I_Student_Detail_ID]      INT           NULL,
    [S_Leave_Type]             VARCHAR (20)  NULL,
    [Dt_From_Date]             DATETIME      NULL,
    [Dt_To_Date]               DATETIME      NULL,
    [S_Reason]                 VARCHAR (500) NULL,
    [S_Comments]               VARCHAR (500) NULL,
    [I_Status]                 INT           NULL,
    [S_Crtd_By]                VARCHAR (20)  NULL,
    [S_Upd_By]                 VARCHAR (20)  NULL,
    [Dt_Crtd_On]               DATETIME      NULL,
    [Dt_Upd_On]                DATETIME      NULL,
    CONSTRAINT [PK_T_Student_Leave_Request_Audit] PRIMARY KEY CLUSTERED ([I_Student_Leave_Audit_ID] ASC),
    CONSTRAINT [FK_T_Student_Leave_Request_Audit_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Student_Leave_Request_Audit_T_Student_Leave_Request] FOREIGN KEY ([I_Student_Leave_ID]) REFERENCES [dbo].[T_Student_Leave_Request] ([I_Student_Leave_ID])
);

