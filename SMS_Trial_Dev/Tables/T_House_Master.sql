CREATE TABLE [dbo].[T_House_Master] (
    [I_House_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]   INT           NOT NULL,
    [S_House_Name] VARCHAR (100) NOT NULL,
    [I_Status]     INT           NOT NULL,
    [S_Crtd_By]    VARCHAR (20)  NULL,
    [Dt_Crtd_On]   DATETIME      NULL,
    [S_Updt_By]    VARCHAR (20)  NULL,
    [Dt_Updt_On]   DATETIME      NULL,
    CONSTRAINT [PK_T_House_Master] PRIMARY KEY CLUSTERED ([I_House_ID] ASC),
    CONSTRAINT [FK_T_House_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);

