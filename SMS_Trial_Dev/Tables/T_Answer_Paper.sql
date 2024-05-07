CREATE TABLE [EXAMINATION].[T_Answer_Paper] (
    [I_Answer_Paper_ID]    INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Student_Detail_ID]  INT            NULL,
    [I_Question_Paper_ID]  INT            NULL,
    [I_Question_ID]        INT            NULL,
    [I_Question_Choice_ID] INT            NULL,
    [N_Marks]              NUMERIC (8, 2) NULL,
    [S_Crtd_By]            VARCHAR (20)   NULL,
    [S_Upd_By]             VARCHAR (20)   NULL,
    [Dt_Crtd_On]           DATETIME       NULL,
    [Dt_Upd_On]            DATETIME       NULL,
    CONSTRAINT [PK__T_Answer_Paper__48668981] PRIMARY KEY CLUSTERED ([I_Answer_Paper_ID] ASC),
    CONSTRAINT [FK__T_Answer___I_Que__00BFF13D] FOREIGN KEY ([I_Question_ID]) REFERENCES [EXAMINATION].[T_Question_Pool] ([I_Question_ID]),
    CONSTRAINT [FK__T_Answer___I_Que__01B41576] FOREIGN KEY ([I_Question_Choice_ID]) REFERENCES [EXAMINATION].[T_Question_Choices] ([I_Question_Choice_ID]),
    CONSTRAINT [FK__T_Answer___I_Que__3A6D6FE5] FOREIGN KEY ([I_Question_Paper_ID]) REFERENCES [EXAMINATION].[T_Question_Paper] ([I_Question_Paper_ID]),
    CONSTRAINT [FK__T_Answer___I_Que__7ED7A8CB] FOREIGN KEY ([I_Question_ID]) REFERENCES [EXAMINATION].[T_Question_Pool] ([I_Question_ID]),
    CONSTRAINT [FK__T_Answer___I_Que__7FCBCD04] FOREIGN KEY ([I_Question_ID]) REFERENCES [EXAMINATION].[T_Question_Pool] ([I_Question_ID]),
    CONSTRAINT [FK__T_Answer___I_Stu__039C5DE8] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK__T_Answer___I_Stu__04908221] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);

