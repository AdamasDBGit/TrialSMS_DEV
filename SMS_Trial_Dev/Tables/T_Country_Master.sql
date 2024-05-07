CREATE TABLE [dbo].[T_Country_Master] (
    [I_Country_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_Country_Code] VARCHAR (20)  NULL,
    [S_Country_Name] VARCHAR (100) NULL,
    [I_Currency_ID]  INT           NULL,
    [S_Crtd_By]      VARCHAR (20)  NULL,
    [S_Upd_By]       VARCHAR (20)  NULL,
    [Dt_Crtd_On]     DATETIME      NULL,
    [Dt_Upd_On]      DATETIME      NULL,
    [I_Status]       INT           NULL,
    CONSTRAINT [PK__T_Country_Master__7F60ED59] PRIMARY KEY CLUSTERED ([I_Country_ID] ASC)
);

