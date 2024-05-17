CREATE TABLE [dbo].[T_Fee_Sharing_Master] (
    [I_Fee_Sharing_ID]   INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]         INT            NULL,
    [I_Country_ID]       INT            NULL,
    [I_Center_ID]        INT            NULL,
    [I_Course_ID]        INT            NULL,
    [I_Fee_Component_ID] INT            NULL,
    [N_Company_Share]    NUMERIC (8, 4) NULL,
    [Dt_Period_Start]    DATETIME       NULL,
    [Dt_Period_End]      DATETIME       NULL,
    [I_Status]           INT            NULL,
    [S_Crtd_By]          VARCHAR (20)   NULL,
    [S_Upd_By]           VARCHAR (20)   NULL,
    [Dt_Crtd_On]         DATETIME       NULL,
    [Dt_Upd_On]          DATETIME       NULL,
    CONSTRAINT [PK_I_Fee_Sharing_Master] PRIMARY KEY CLUSTERED ([I_Fee_Sharing_ID] ASC),
    CONSTRAINT [FK_T_Fee_Sharing_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Fee_Sharing_Master_T_Centre_Master] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Fee_Sharing_Master_T_Country_Master] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK_T_Fee_Sharing_Master_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_Fee_Sharing_Master_T_Fee_Component_Master] FOREIGN KEY ([I_Fee_Component_ID]) REFERENCES [dbo].[T_Fee_Component_Master] ([I_Fee_Component_ID])
);


GO
ALTER TABLE [dbo].[T_Fee_Sharing_Master] NOCHECK CONSTRAINT [FK_T_Fee_Sharing_Master_T_Brand_Master];


GO
ALTER TABLE [dbo].[T_Fee_Sharing_Master] NOCHECK CONSTRAINT [FK_T_Fee_Sharing_Master_T_Course_Master];


GO
ALTER TABLE [dbo].[T_Fee_Sharing_Master] NOCHECK CONSTRAINT [FK_T_Fee_Sharing_Master_T_Fee_Component_Master];



