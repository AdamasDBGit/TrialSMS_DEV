﻿CREATE TABLE [dbo].[T_ERP_Role_Permission] (
    [I_Role_Permission_ID] INT      IDENTITY (1, 1) NOT NULL,
    [I_Role_ID]            INT      NOT NULL,
    [I_Menu_Permission_ID] INT      NOT NULL,
    [I_CreatedBy]          INT      NULL,
    [Dt_CreatedAt]         DATETIME DEFAULT (getdate()) NULL,
    [Dt_ModifiedAt]        DATETIME NULL,
    [I_ModifiedBy]         INT      NULL,
    [Is_Active]            BIT      DEFAULT ((1)) NULL
);

