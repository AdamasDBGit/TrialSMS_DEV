CREATE TABLE [dbo].[T_Course_Center_Detail] (
    [I_Course_Center_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Centre_Id]        INT          NULL,
    [I_Course_ID]        INT          NULL,
    [S_Crtd_By]          VARCHAR (20) NULL,
    [S_Upd_By]           VARCHAR (20) NULL,
    [Dt_Valid_From]      DATETIME     NULL,
    [Dt_Crtd_On]         DATETIME     NULL,
    [Dt_Valid_To]        DATETIME     NULL,
    [Dt_Upd_On]          DATETIME     NULL,
    [I_Status]           INT          NULL,
    CONSTRAINT [PK__T_Course_Center___558B7A75] PRIMARY KEY CLUSTERED ([I_Course_Center_ID] ASC),
    CONSTRAINT [FK__T_Course___I_Cen__123EB7A3] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Course___I_Cou__74EF1735] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_Course_Center_Detail_T_Course_Center_Detail] FOREIGN KEY ([I_Course_Center_ID]) REFERENCES [dbo].[T_Course_Center_Detail] ([I_Course_Center_ID])
);


GO
ALTER TABLE [dbo].[T_Course_Center_Detail] NOCHECK CONSTRAINT [FK__T_Course___I_Cou__74EF1735];



