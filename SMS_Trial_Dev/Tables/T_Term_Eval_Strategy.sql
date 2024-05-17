CREATE TABLE [dbo].[T_Term_Eval_Strategy] (
    [I_Term_Strategy_ID]    INT            IDENTITY (1, 1) NOT NULL,
    [I_Course_ID]           INT            NULL,
    [I_Term_ID]             INT            NULL,
    [I_Exam_Component_ID]   INT            NULL,
    [I_Exam_Type_Master_ID] INT            NULL,
    [I_TotMarks]            INT            NULL,
    [N_Weightage]           NUMERIC (8, 2) NULL,
    [S_Remarks]             VARCHAR (200)  NULL,
    [I_IsPSDate]            BIT            NULL,
    [I_Template_ID]         INT            NULL,
    [I_Status]              INT            NULL,
    [S_Crtd_By]             VARCHAR (20)   NULL,
    [S_Upd_By]              VARCHAR (20)   NULL,
    [Dt_Crtd_On]            DATETIME       NULL,
    [Dt_Upd_On]             DATETIME       NULL,
    [I_Exam_Duration]       INT            NULL,
    CONSTRAINT [PK__T_Term_Eval_Stra__3D5E1FD2] PRIMARY KEY CLUSTERED ([I_Term_Strategy_ID] ASC),
    CONSTRAINT [FK__T_Term_Ev__I_Cou__6A7188C2] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Term_Ev__I_Exa__787EE5A0] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK__T_Term_Ev__I_Ter__697D6489] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID]),
    CONSTRAINT [FK_T_Term_Eval_Strategy_T_Exam_Type_Master] FOREIGN KEY ([I_Exam_Type_Master_ID]) REFERENCES [dbo].[T_Exam_Type_Master] ([I_Exam_Type_Master_ID]),
    CONSTRAINT [FK_T_Term_Eval_Strategy_T_Template_Master] FOREIGN KEY ([I_Template_ID]) REFERENCES [dbo].[T_Template_Master] ([I_Template_ID])
);


GO
ALTER TABLE [dbo].[T_Term_Eval_Strategy] NOCHECK CONSTRAINT [FK__T_Term_Ev__I_Cou__6A7188C2];


GO
ALTER TABLE [dbo].[T_Term_Eval_Strategy] NOCHECK CONSTRAINT [FK__T_Term_Ev__I_Exa__787EE5A0];


GO
ALTER TABLE [dbo].[T_Term_Eval_Strategy] NOCHECK CONSTRAINT [FK__T_Term_Ev__I_Ter__697D6489];


GO
ALTER TABLE [dbo].[T_Term_Eval_Strategy] NOCHECK CONSTRAINT [FK_T_Term_Eval_Strategy_T_Exam_Type_Master];


GO
ALTER TABLE [dbo].[T_Term_Eval_Strategy] NOCHECK CONSTRAINT [FK_T_Term_Eval_Strategy_T_Template_Master];



