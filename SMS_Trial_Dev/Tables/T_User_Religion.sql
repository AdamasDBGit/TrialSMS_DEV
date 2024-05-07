﻿CREATE TABLE [dbo].[T_User_Religion] (
    [I_Religion_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_Religion_Name] VARCHAR (200) NULL,
    [I_Status]        INT           NULL,
    [S_Crtd_By]       VARCHAR (50)  NULL,
    [Dt_Crtd_On]      DATETIME      NULL,
    [S_Updt_By]       VARCHAR (50)  NULL,
    [Dt_Updt_On]      DATETIME      NULL,
    CONSTRAINT [PK_T_User_Religion] PRIMARY KEY CLUSTERED ([I_Religion_ID] ASC)
);

