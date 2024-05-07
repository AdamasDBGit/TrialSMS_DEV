CREATE TABLE [dbo].[T_ERP_Role_Menu_Permission] (
    [I_Role_Menu_PermissionID] INT      IDENTITY (1, 1) NOT NULL,
    [I_Role_ID]                INT      NULL,
    [I_Menu_ID]                INT      NULL,
    [Is_Grant_View]            BIT      NULL,
    [Is_Grant_Edit]            BIT      NULL,
    [I_CreatedBy]              INT      NULL,
    [Dt_CreatedAt]             DATETIME DEFAULT (getdate()) NULL,
    [Dt_ModifiedAt]            DATETIME NULL,
    [I_ModifiedBy]             INT      NULL,
    [Is_Active]                BIT      DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Role_Menu_PermissionID] ASC)
);

