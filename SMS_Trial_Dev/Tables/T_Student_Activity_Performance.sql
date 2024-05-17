CREATE TABLE [dbo].[T_Student_Activity_Performance] (
    [I_Student_Activity_Performance_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Student_Activity_ID]             INT          NOT NULL,
    [I_Term_ID]                         INT          NOT NULL,
    [I_Evaluation_ID]                   INT          NOT NULL,
    [S_Student_Grade]                   VARCHAR (50) NULL,
    [I_Status]                          INT          NOT NULL,
    [S_Crtd_By]                         VARCHAR (20) NOT NULL,
    [Dt_Crtd_On]                        DATETIME     NOT NULL,
    [S_Updt_By]                         VARCHAR (20) NULL,
    [Dt_Updt_On]                        DATETIME     NULL,
    CONSTRAINT [PK_T_Student_Activity_Performance] PRIMARY KEY CLUSTERED ([I_Student_Activity_Performance_ID] ASC),
    CONSTRAINT [FK_T_Student_Activity_Performance_T_Activity_Evaluation_Master] FOREIGN KEY ([I_Evaluation_ID]) REFERENCES [dbo].[T_Activity_Evaluation_Master] ([I_Evaluation_ID]),
    CONSTRAINT [FK_T_Student_Activity_Performance_T_Student_Activity_Details] FOREIGN KEY ([I_Student_Activity_ID]) REFERENCES [dbo].[T_Student_Activity_Details] ([I_Student_Activity_ID]),
    CONSTRAINT [FK_T_Student_Activity_Performance_T_Term_Master] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID])
);


GO
ALTER TABLE [dbo].[T_Student_Activity_Performance] NOCHECK CONSTRAINT [FK_T_Student_Activity_Performance_T_Activity_Evaluation_Master];


GO
ALTER TABLE [dbo].[T_Student_Activity_Performance] NOCHECK CONSTRAINT [FK_T_Student_Activity_Performance_T_Student_Activity_Details];


GO
ALTER TABLE [dbo].[T_Student_Activity_Performance] NOCHECK CONSTRAINT [FK_T_Student_Activity_Performance_T_Term_Master];



