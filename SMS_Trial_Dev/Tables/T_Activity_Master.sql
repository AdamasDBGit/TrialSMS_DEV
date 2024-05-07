﻿CREATE TABLE [dbo].[T_Activity_Master] (
    [I_Activity_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Activity_Name] VARCHAR (50) NULL,
    [I_Brand_ID]      INT          NULL,
    [I_Status]        INT          NULL,
    [S_Crtd_By]       VARCHAR (20) NULL,
    [S_Upd_By]        VARCHAR (20) NULL,
    [Dt_Crtd_On]      DATETIME     NULL,
    [Dt_Upd_On]       DATETIME     NULL,
    CONSTRAINT [PK_T_Activity_Master_1] PRIMARY KEY CLUSTERED ([I_Activity_ID] ASC)
);

