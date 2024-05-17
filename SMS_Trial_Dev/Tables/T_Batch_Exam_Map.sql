CREATE TABLE [EXAMINATION].[T_Batch_Exam_Map] (
    [I_Batch_Exam_ID]     INT          IDENTITY (1, 1) NOT NULL,
    [I_Batch_ID]          INT          NOT NULL,
    [I_Term_ID]           INT          NOT NULL,
    [I_Module_ID]         INT          NULL,
    [I_Exam_Component_ID] INT          NOT NULL,
    [I_Status]            INT          NULL,
    [S_Crtd_By]           VARCHAR (20) NULL,
    [Dt_Crtd_On]          DATETIME     NULL,
    [S_Updt_By]           VARCHAR (20) NULL,
    [Dt_Updt_On]          DATETIME     NULL,
    [B_Optional]          BIT          NULL,
    CONSTRAINT [PK_T_Batch_Exam_Map] PRIMARY KEY CLUSTERED ([I_Batch_Exam_ID] ASC),
    CONSTRAINT [FK_T_Batch_Exam_Map_T_Exam_Component_Master] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK_T_Batch_Exam_Map_T_Module_Master] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK_T_Batch_Exam_Map_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID]),
    CONSTRAINT [FK_T_Batch_Exam_Map_T_Term_Master] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID])
);


GO
ALTER TABLE [EXAMINATION].[T_Batch_Exam_Map] NOCHECK CONSTRAINT [FK_T_Batch_Exam_Map_T_Exam_Component_Master];


GO
ALTER TABLE [EXAMINATION].[T_Batch_Exam_Map] NOCHECK CONSTRAINT [FK_T_Batch_Exam_Map_T_Module_Master];


GO
ALTER TABLE [EXAMINATION].[T_Batch_Exam_Map] NOCHECK CONSTRAINT [FK_T_Batch_Exam_Map_T_Student_Batch_Master];


GO
ALTER TABLE [EXAMINATION].[T_Batch_Exam_Map] NOCHECK CONSTRAINT [FK_T_Batch_Exam_Map_T_Term_Master];




GO
CREATE NONCLUSTERED INDEX [NCI_I_Batch_ID]
    ON [EXAMINATION].[T_Batch_Exam_Map]([I_Batch_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [NCI_I_Term_ID]
    ON [EXAMINATION].[T_Batch_Exam_Map]([I_Term_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [NCI_I_Exam_Component_ID]
    ON [EXAMINATION].[T_Batch_Exam_Map]([I_Exam_Component_ID] ASC);

