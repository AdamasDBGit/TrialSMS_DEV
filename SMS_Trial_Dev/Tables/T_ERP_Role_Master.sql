CREATE TABLE [dbo].[T_ERP_Role_Master] (
    [I_Role_ID]   INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Role_Code] VARCHAR (200) NULL,
    [S_Role_Desc] VARCHAR (400) NULL,
    [I_Status]    INT           NULL,
    [S_Crtd_By]   INT           NULL,
    [S_Upd_By]    INT           NULL,
    [Dt_Crtd_On]  DATETIME      NULL,
    [Dt_Upd_On]   DATETIME      NULL,
    [I_Brand_ID]  INT           NULL,
    CONSTRAINT [PK__T_ERP_Role_Master__1920BF5C] PRIMARY KEY CLUSTERED ([I_Role_ID] ASC)
);

