﻿CREATE TABLE [dbo].[T_Hierarchy_Details] (
    [I_Hierarchy_Detail_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Hierarchy_Level_Id]  INT           NULL,
    [I_Hierarchy_Master_ID] INT           NULL,
    [S_Hierarchy_Name]      VARCHAR (100) NULL,
    [I_Status]              INT           NULL,
    [Dt_Crtd_On]            DATETIME      NULL,
    [Dt_Upd_On]             DATETIME      NULL,
    [S_Crtd_By]             VARCHAR (20)  NULL,
    [S_Upd_By]              VARCHAR (20)  NULL,
    CONSTRAINT [PK__T_Hierarchy_Deta__10573A88] PRIMARY KEY CLUSTERED ([I_Hierarchy_Detail_ID] ASC)
);

