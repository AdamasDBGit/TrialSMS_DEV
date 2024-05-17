CREATE TABLE [EXAMINATION].[T_Student_Marks] (
    [I_Student_Marks_ID]  INT            IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID] INT            NULL,
    [I_Exam_ID]           INT            NULL,
    [I_Exam_Total]        NUMERIC (8, 2) NULL,
    [S_Crtd_By]           VARCHAR (20)   NULL,
    [S_Upd_By]            VARCHAR (20)   NULL,
    [Dt_Crtd_On]          DATETIME       NULL,
    [Dt_Upd_On]           DATETIME       NULL,
    [Dt_Exam_Date]        DATETIME       NULL,
    [I_Batch_Exam_ID]     INT            NULL,
    [S_Remarks]           VARCHAR (1000) NULL,
    [I_Center_ID]         INT            NULL,
    CONSTRAINT [PK__T_Student_Marks__120A78D0] PRIMARY KEY CLUSTERED ([I_Student_Marks_ID] ASC),
    CONSTRAINT [FK__T_Student__I_Stu__1C680BB2] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Student_Marks_T_Batch_Exam_Map] FOREIGN KEY ([I_Batch_Exam_ID]) REFERENCES [EXAMINATION].[T_Batch_Exam_Map] ([I_Batch_Exam_ID]),
    CONSTRAINT [FK_T_Student_Marks_T_Examination_Detail] FOREIGN KEY ([I_Exam_ID]) REFERENCES [EXAMINATION].[T_Examination_Detail] ([I_Exam_ID])
);


GO
ALTER TABLE [EXAMINATION].[T_Student_Marks] NOCHECK CONSTRAINT [FK_T_Student_Marks_T_Batch_Exam_Map];




GO
CREATE NONCLUSTERED INDEX [index_Student_ID_Student_Marks]
    ON [EXAMINATION].[T_Student_Marks]([I_Student_Detail_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [NCI_I_Batch_Exam_ID]
    ON [EXAMINATION].[T_Student_Marks]([I_Batch_Exam_ID] ASC);

