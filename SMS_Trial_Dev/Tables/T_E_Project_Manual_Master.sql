CREATE TABLE [ACADEMICS].[T_E_Project_Manual_Master] (
    [I_E_Proj_Manual_ID]        INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Center_ID]               INT          NULL,
    [Dt_Crtd_On]                DATETIME     NULL,
    [Dt_Upd_On]                 DATETIME     NULL,
    [S_Crtd_By]                 VARCHAR (20) NULL,
    [S_Upd_By]                  VARCHAR (20) NULL,
    [I_Course_ID]               INT          NULL,
    [I_Term_ID]                 INT          NULL,
    [I_Module_ID]               INT          NULL,
    [I_Is_Manual_No_Compulsory] INT          NULL,
    CONSTRAINT [PK__T_E_Project_Manu__4278A601] PRIMARY KEY CLUSTERED ([I_E_Proj_Manual_ID] ASC),
    CONSTRAINT [FK__T_E_Proje__I_Cen__05B9B084] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_E_Proje__I_Cen__06ADD4BD] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_E_Proje__I_Cen__07A1F8F6] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_E_Proje__I_Cou__30274DA1] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_E_Proje__I_Cou__7279C34C] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_E_Proje__I_Mod__311B71DA] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK__T_E_Proje__I_Mod__736DE785] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK__T_E_Proje__I_Ter__320F9613] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID]),
    CONSTRAINT [FK__T_E_Proje__I_Ter__74620BBE] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID])
);

