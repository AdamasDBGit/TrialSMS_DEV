﻿CREATE TABLE [dbo].[Demo_T_Module_Master] (
    [I_Module_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [I_Skill_ID]      INT           NULL,
    [I_Brand_ID]      INT           NULL,
    [S_Module_Code]   VARCHAR (50)  NULL,
    [S_Module_Name]   VARCHAR (250) NULL,
    [I_No_Of_Session] INT           NULL,
    [S_Crtd_By]       VARCHAR (20)  NULL,
    [S_Upd_By]        VARCHAR (20)  NULL,
    [Dt_Crtd_On]      DATETIME      NULL,
    [Dt_Upd_On]       DATETIME      NULL,
    [I_Is_Editable]   INT           NULL,
    [I_Status]        INT           NULL,
    [S_Display_Name]  VARCHAR (MAX) NULL
);

