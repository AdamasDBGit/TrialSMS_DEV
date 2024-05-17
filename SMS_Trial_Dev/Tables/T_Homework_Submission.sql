CREATE TABLE [EXAMINATION].[T_Homework_Submission] (
    [I_Homework_Submission_ID]   INT             IDENTITY (1, 1) NOT NULL,
    [I_Homework_ID]              INT             NOT NULL,
    [I_Student_Detail_ID]        INT             NOT NULL,
    [Dt_Submission_Date]         DATETIME        NULL,
    [I_Status]                   INT             NULL,
    [S_Crtd_By]                  VARCHAR (20)    NULL,
    [Dt_Crtd_On]                 DATETIME        NULL,
    [S_Updt_By]                  VARCHAR (20)    NULL,
    [Dt_Updt_On]                 DATETIME        NULL,
    [Dt_Return_Date]             DATETIME        NULL,
    [I_Employee_ID]              INT             NULL,
    [S_Remarks]                  VARCHAR (100)   NULL,
    [Dt_CCO_Submission_Date]     DATETIME        NULL,
    [Dt_Faculty_Submission_Date] DATETIME        NULL,
    [S_Material_BarCode]         NVARCHAR (500)  NULL,
    [N_Marks]                    DECIMAL (14, 2) NULL,
    CONSTRAINT [PK_T_Homework_Submission] PRIMARY KEY CLUSTERED ([I_Homework_Submission_ID] ASC),
    CONSTRAINT [FK_T_Homework_Submission_T_Employee_Dtls] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK_T_Homework_Submission_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);


GO
ALTER TABLE [EXAMINATION].[T_Homework_Submission] NOCHECK CONSTRAINT [FK_T_Homework_Submission_T_Employee_Dtls];




GO
CREATE NONCLUSTERED INDEX [IndxHwID]
    ON [EXAMINATION].[T_Homework_Submission]([I_Homework_ID] ASC, [I_Student_Detail_ID] ASC);

