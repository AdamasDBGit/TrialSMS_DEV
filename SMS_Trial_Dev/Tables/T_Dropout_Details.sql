CREATE TABLE [ACADEMICS].[T_Dropout_Details] (
    [I_Dropout_ID]        INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Dropout_Status]    INT            NULL,
    [I_Student_Detail_ID] INT            NULL,
    [I_Center_Id]         INT            NULL,
    [Dt_Dropout_Date]     DATETIME       NULL,
    [I_Dropout_Type_ID]   INT            NULL,
    [S_Crtd_By]           VARCHAR (20)   NULL,
    [S_Upd_By]            VARCHAR (20)   NULL,
    [S_Reason]            VARCHAR (2000) NULL,
    [Dt_Crtd_On]          DATETIME       NULL,
    [Dt_Upd_On]           DATETIME       NULL,
    [I_Invoice_Header_ID] INT            NULL,
    [I_Batch_ID]          INT            NULL,
    CONSTRAINT [PK__T_Dropout_Detail__7385F1B0] PRIMARY KEY CLUSTERED ([I_Dropout_ID] ASC),
    CONSTRAINT [FK__T_Dropout__I_Cen__03124E03] FOREIGN KEY ([I_Center_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Dropout__I_Stu__2196D523] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Dropout_Details_T_Dropout_Type_Master] FOREIGN KEY ([I_Dropout_Type_ID]) REFERENCES [ACADEMICS].[T_Dropout_Type_Master] ([I_Dropout_Type_ID]),
    CONSTRAINT [FK_T_Dropout_Details_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);


GO
ALTER TABLE [ACADEMICS].[T_Dropout_Details] NOCHECK CONSTRAINT [FK__T_Dropout__I_Cen__03124E03];


GO
ALTER TABLE [ACADEMICS].[T_Dropout_Details] NOCHECK CONSTRAINT [FK__T_Dropout__I_Stu__2196D523];


GO
ALTER TABLE [ACADEMICS].[T_Dropout_Details] NOCHECK CONSTRAINT [FK_T_Dropout_Details_T_Dropout_Type_Master];


GO
ALTER TABLE [ACADEMICS].[T_Dropout_Details] NOCHECK CONSTRAINT [FK_T_Dropout_Details_T_Student_Batch_Master];



