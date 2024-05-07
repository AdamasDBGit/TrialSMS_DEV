CREATE TABLE [dbo].[T_Student_Activity_Details] (
    [I_Student_Activity_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID]   INT          NOT NULL,
    [I_Batch_ID]            INT          NOT NULL,
    [I_Activity_ID]         INT          NOT NULL,
    [I_Status]              INT          NULL,
    [S_Crtd_By]             VARCHAR (20) NULL,
    [Dt_Crtd_On]            DATETIME     NULL,
    [S_Updt_By]             VARCHAR (20) NULL,
    [Dt_Updt_On]            DATETIME     NULL,
    [I_Employee_ID]         INT          NULL,
    CONSTRAINT [PK_T_Student_Activity_Details] PRIMARY KEY CLUSTERED ([I_Student_Activity_ID] ASC),
    CONSTRAINT [FK_T_Student_Activity_Details_T_Activity_Master] FOREIGN KEY ([I_Activity_ID]) REFERENCES [dbo].[T_Activity_Master] ([I_Activity_ID]),
    CONSTRAINT [FK_T_Student_Activity_Details_T_Employee_Dtls] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK_T_Student_Activity_Details_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);

