CREATE TABLE [ACADEMICS].[T_Dropout_Dtls_Audit] (
    [I_Dropout_Dtls_Audit_ID] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Dropout_ID]            INT           NULL,
    [I_Student_ID]            INT           NULL,
    [I_Center_Id]             INT           NULL,
    [I_Dropout_Status]        INT           NULL,
    [I_Dropout_Type_ID]       INT           NULL,
    [Dt_Dropout_Date]         DATETIME      NULL,
    [S_Reason]                VARCHAR (500) NULL,
    [S_Crtd_By]               VARCHAR (20)  NULL,
    [S_Upd_By]                VARCHAR (20)  NULL,
    [Dt_Crtd_On]              DATETIME      NULL,
    [Dt_Upd_On]               DATETIME      NULL,
    CONSTRAINT [PK__T_Dropout_Dtls_A__756E3A22] PRIMARY KEY CLUSTERED ([I_Dropout_Dtls_Audit_ID] ASC),
    CONSTRAINT [FK__T_Dropout__I_Cen__2C146396] FOREIGN KEY ([I_Center_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Dropout__I_Dro__3AA27A0F] FOREIGN KEY ([I_Dropout_Type_ID]) REFERENCES [ACADEMICS].[T_Dropout_Type_Master] ([I_Dropout_Type_ID]),
    CONSTRAINT [FK__T_Dropout__I_Dro__5C8A822D] FOREIGN KEY ([I_Dropout_Type_ID]) REFERENCES [ACADEMICS].[T_Dropout_Type_Master] ([I_Dropout_Type_ID]),
    CONSTRAINT [FK__T_Dropout__I_Stu__542254F0] FOREIGN KEY ([I_Student_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);

