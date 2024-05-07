CREATE TABLE [dbo].[T_ModuleGroup_Master] (
    [I_ModuleGroup_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_ModuleGroup_Code] VARCHAR (25) NULL,
    [S_ModuleGroup_Name] VARCHAR (50) NULL,
    [I_Brand_ID]         INT          NULL,
    [I_Status]           INT          NULL,
    [I_Sequence]         INT          NULL,
    [S_Crtd_By]          VARCHAR (20) NULL,
    [Dt_Crtd_On]         DATETIME     NULL,
    [S_Upd_By]           VARCHAR (20) NULL,
    [Dt_Upd_On]          DATETIME     NULL,
    CONSTRAINT [PK_T_ModuleGroup_Master] PRIMARY KEY CLUSTERED ([I_ModuleGroup_ID] ASC),
    CONSTRAINT [FK_T_ModuleGroup_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);

