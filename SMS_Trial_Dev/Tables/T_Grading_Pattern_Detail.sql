CREATE TABLE [dbo].[T_Grading_Pattern_Detail] (
    [I_Grading_Pattern_Detail_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Grading_Pattern_ID]        INT          NULL,
    [S_Grade_Type]                VARCHAR (20) NULL,
    [S_Grade_Description]         VARCHAR (50) NULL,
    [I_MinMarks]                  INT          NULL,
    [I_MaxMarks]                  INT          NULL,
    CONSTRAINT [PK__T_Grading_Patter__625B65AE] PRIMARY KEY CLUSTERED ([I_Grading_Pattern_Detail_ID] ASC),
    CONSTRAINT [FK__T_Grading__I_Gra__0BE78B26] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__0CDBAF5F] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__0DCFD398] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__0EC3F7D1] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__0FB81C0A] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__10AC4043] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__11A0647C] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__129488B5] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__1388ACEE] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__147CD127] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__1570F560] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__16651999] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID]),
    CONSTRAINT [FK__T_Grading__I_Gra__17593DD2] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID])
);

