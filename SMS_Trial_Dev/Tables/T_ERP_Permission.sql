﻿CREATE TABLE [dbo].[T_ERP_Permission] (
    [I_Permission_ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [Permission_Type]                 VARCHAR (100)  NULL,
    [RequestType]                     NCHAR (100)    NULL,
    [S_Name]                          NVARCHAR (150) NOT NULL,
    [I_Parent_Menu_ID]                INT            NULL,
    [I_Is_Leaf_Node]                  INT            NULL,
    [i_pageseq]                       INT            NULL,
    [S_Icon]                          NVARCHAR (150) NULL,
    [I_CreatedBy]                     INT            NULL,
    [Dt_CreatedAt]                    DATETIME       NULL,
    [I_Status]                        INT            NULL,
    [S_PageUrl]                       VARCHAR (MAX)  NULL,
    [S_Display_Component_Permissions] VARCHAR (MAX)  NULL,
    [S_Enable_Component_Permissions]  VARCHAR (MAX)  NULL,
    [Description]                     VARCHAR (100)  NULL
);

