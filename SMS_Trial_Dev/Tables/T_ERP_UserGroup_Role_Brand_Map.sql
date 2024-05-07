CREATE TABLE [dbo].[T_ERP_UserGroup_Role_Brand_Map] (
    [I_UserGroup_Role_Map_ID] INT  IDENTITY (1, 1) NOT NULL,
    [I_User_Group_Master_ID]  INT  NOT NULL,
    [I_Role_ID]               INT  NOT NULL,
    [I_Brand_ID]              INT  NOT NULL,
    [Is_Active]               BIT  NULL,
    [Dt_created_Dt]           DATE DEFAULT (getdate()) NULL,
    [I_Created_By]            INT  NULL,
    PRIMARY KEY CLUSTERED ([I_User_Group_Master_ID] ASC, [I_Role_ID] ASC, [I_Brand_ID] ASC)
);

