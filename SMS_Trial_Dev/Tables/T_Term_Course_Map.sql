CREATE TABLE [dbo].[T_Term_Course_Map] (
    [I_Term_Course_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Certificate_ID] INT          NULL,
    [I_Course_ID]      INT          NULL,
    [I_Term_ID]        INT          NULL,
    [I_Sequence]       INT          NULL,
    [C_Examinable]     CHAR (1)     NULL,
    [S_Crtd_By]        VARCHAR (20) NULL,
    [S_Upd_By]         VARCHAR (20) NULL,
    [Dt_Crtd_On]       DATETIME     NULL,
    [Dt_Upd_On]        DATETIME     NULL,
    [Dt_Valid_From]    DATETIME     NULL,
    [Dt_Valid_To]      DATETIME     NULL,
    [I_Status]         INT          NULL,
    CONSTRAINT [PK__T_Term_Course_Ma__6ABBA185] PRIMARY KEY CLUSTERED ([I_Term_Course_ID] ASC),
    CONSTRAINT [FK__T_Term_Co__I_Cer__0B7D76D2] FOREIGN KEY ([I_Certificate_ID]) REFERENCES [dbo].[T_Certificate_Master] ([I_Certificate_ID]),
    CONSTRAINT [FK__T_Term_Co__I_Cou__77CB83E0] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Term_Co__I_Ter__78BFA819] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID])
);


GO
ALTER TABLE [dbo].[T_Term_Course_Map] NOCHECK CONSTRAINT [FK__T_Term_Co__I_Cer__0B7D76D2];


GO
ALTER TABLE [dbo].[T_Term_Course_Map] NOCHECK CONSTRAINT [FK__T_Term_Co__I_Cou__77CB83E0];


GO
ALTER TABLE [dbo].[T_Term_Course_Map] NOCHECK CONSTRAINT [FK__T_Term_Co__I_Ter__78BFA819];



