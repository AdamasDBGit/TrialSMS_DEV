CREATE TABLE [dbo].[T_Exam_Component_Master] (
    [I_Exam_Component_ID]   INT             IDENTITY (1, 1) NOT NULL,
    [I_Exam_Type_Master_ID] INT             NULL,
    [S_Component_Name]      VARCHAR (200)   NULL,
    [I_Status]              INT             NULL,
    [S_Component_Type]      VARCHAR (10)    NULL,
    [S_Crtd_By]             VARCHAR (20)    NULL,
    [S_Upd_By]              VARCHAR (20)    NULL,
    [Dt_Crtd_On]            DATETIME        NULL,
    [Dt_Upd_On]             DATETIME        NULL,
    [I_Brand_ID]            INT             NULL,
    [Dt_Admission_Test]     DATETIME        NULL,
    [I_Course_ID]           INT             NULL,
    [B_Is_Subject]          BIT             NULL,
    [N_CutOffPercentage]    DECIMAL (18, 2) NULL,
    [I_Weightage]           INT             NULL,
    [I_Sequence_No]         INT             NULL,
    [B_Exclude_In_Report]   BIT             NULL,
    CONSTRAINT [PK__T_Exam_Component__173876EA] PRIMARY KEY CLUSTERED ([I_Exam_Component_ID] ASC),
    CONSTRAINT [FK_T_Exam_Component_Master_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_Exam_Component_Master_T_Exam_Type_Master] FOREIGN KEY ([I_Exam_Type_Master_ID]) REFERENCES [dbo].[T_Exam_Type_Master] ([I_Exam_Type_Master_ID]),
    CONSTRAINT [FK_T_Exam_Component_Master_T_Exam_Type_Master1234] FOREIGN KEY ([I_Exam_Type_Master_ID]) REFERENCES [dbo].[T_Exam_Type_Master] ([I_Exam_Type_Master_ID])
);

