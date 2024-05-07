﻿CREATE TABLE [dbo].[T_Role_Master] (
    [I_Role_ID]             INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Role_Code]           VARCHAR (20)  NULL,
    [S_Role_Desc]           VARCHAR (100) NULL,
    [I_Status]              INT           NULL,
    [S_Role_Type]           VARCHAR (50)  NULL,
    [I_Hierarchy_Detail_ID] INT           NULL,
    [S_Crtd_By]             VARCHAR (20)  NULL,
    [S_Upd_By]              VARCHAR (20)  NULL,
    [Dt_Crtd_On]            DATETIME      NULL,
    [Dt_Upd_On]             DATETIME      NULL,
    [I_Brand_ID]            INT           NULL,
    CONSTRAINT [PK__T_Role_Master__1920BF5C] PRIMARY KEY CLUSTERED ([I_Role_ID] ASC)
);

