CREATE TABLE [dbo].[T_CourseFamily_Master] (
    [I_CourseFamily_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_CourseFamily_Name] VARCHAR (50) NULL,
    [S_Crtd_By]           VARCHAR (20) NULL,
    [I_Brand_ID]          INT          NULL,
    [S_Upd_By]            VARCHAR (20) NULL,
    [Dt_Crtd_On]          DATETIME     NULL,
    [Dt_Upd_On]           DATETIME     NULL,
    [I_Status]            INT          NULL,
    [I_IsMTech]           INT          NULL,
    CONSTRAINT [PK__T_CourseFamily_M__251D4D44] PRIMARY KEY CLUSTERED ([I_CourseFamily_ID] ASC),
    CONSTRAINT [FK__T_CourseF__I_Bra__0ABE5CC3] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_CourseF__I_Bra__68BB4EE8] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_CourseF__I_Bra__7DDAF99F] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [dbo].[T_CourseFamily_Master] NOCHECK CONSTRAINT [FK__T_CourseF__I_Bra__0ABE5CC3];


GO
ALTER TABLE [dbo].[T_CourseFamily_Master] NOCHECK CONSTRAINT [FK__T_CourseF__I_Bra__68BB4EE8];


GO
ALTER TABLE [dbo].[T_CourseFamily_Master] NOCHECK CONSTRAINT [FK__T_CourseF__I_Bra__7DDAF99F];



