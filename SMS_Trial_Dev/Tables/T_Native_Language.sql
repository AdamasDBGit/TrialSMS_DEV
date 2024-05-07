﻿CREATE TABLE [dbo].[T_Native_Language] (
    [I_Native_Language_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_Native_Language_Name] VARCHAR (200) NULL,
    [I_Status]               INT           NULL,
    [S_Crtd_By]              VARCHAR (50)  NULL,
    [Dt_Crtd_On]             DATETIME      NULL,
    [S_Updt_By]              VARCHAR (50)  NULL,
    [Dt_Updt_On]             DATETIME      NULL,
    CONSTRAINT [PK_T_Native_Language] PRIMARY KEY CLUSTERED ([I_Native_Language_ID] ASC)
);

