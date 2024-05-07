CREATE TABLE [dbo].[T_Student_Term_Detail] (
    [I_Student_Term_Detail_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Term_ID]                INT          NOT NULL,
    [I_Course_ID]              INT          NOT NULL,
    [I_Student_Detail_ID]      INT          NOT NULL,
    [I_Is_Completed]           BIT          NULL,
    [S_Crtd_By]                VARCHAR (20) NULL,
    [S_Upd_By]                 VARCHAR (20) NULL,
    [Dt_Crtd_On]               DATETIME     NULL,
    [Dt_Upd_On]                DATETIME     NULL,
    [I_Student_PS_ID]          INT          NULL,
    [I_Student_Certificate_ID] INT          NULL,
    [S_Term_Grade]             VARCHAR (20) NULL,
    [S_Term_Status]            VARCHAR (10) NULL,
    [S_Term_Final_Marks]       INT          NULL,
    [I_Batch_ID]               INT          NULL,
    [D_Attendance]             DECIMAL (18) NULL,
    [I_Conduct_Id]             INT          NULL,
    CONSTRAINT [PK_T_Student_Term_Detail] PRIMARY KEY CLUSTERED ([I_Student_Term_Detail_ID] ASC),
    CONSTRAINT [FK__T_Student__I_Cou__426DB909] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Student__I_Stu__4634284C] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK__T_Student__I_Ter__4456017B] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID]),
    CONSTRAINT [FK_T_Student_Term_Detail_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);


GO
CREATE NONCLUSTERED INDEX [index_Student_ID_Term_Details]
    ON [dbo].[T_Student_Term_Detail]([I_Student_Detail_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [index_Term_ID_Term_Details]
    ON [dbo].[T_Student_Term_Detail]([I_Term_ID] ASC);

