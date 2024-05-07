CREATE TABLE [dbo].[T_Brand_Master] (
    [I_Brand_ID]   INT           NOT NULL,
    [S_Brand_Code] VARCHAR (20)  NULL,
    [S_Brand_Name] VARCHAR (100) NULL,
    [S_Crtd_By]    VARCHAR (20)  NULL,
    [S_Upd_By]     VARCHAR (20)  NULL,
    [Dt_Crtd_On]   DATETIME      NULL,
    [Dt_Upd_On]    DATETIME      NULL,
    [I_Status]     INT           NULL,
    [S_Short_Code] VARCHAR (32)  NULL,
    [S_CIN]        VARCHAR (MAX) NULL,
    [S_PAN]        VARCHAR (MAX) NULL,
    CONSTRAINT [PK__T_Brand_Master__6B25B5D9] PRIMARY KEY CLUSTERED ([I_Brand_ID] ASC)
);

