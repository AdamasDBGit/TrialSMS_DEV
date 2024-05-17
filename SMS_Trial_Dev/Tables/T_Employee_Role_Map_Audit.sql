CREATE TABLE [EOS].[T_Employee_Role_Map_Audit] (
    [I_Employee_Role_Map_Audit_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Status_ID]                  INT          NULL,
    [I_Employee_Role_Map_ID]       INT          NULL,
    [I_Employee_ID]                INT          NULL,
    [I_Role_ID]                    INT          NULL,
    [Dt_Valid_From]                DATETIME     NULL,
    [Dt_Valid_To]                  DATETIME     NULL,
    [S_Crtd_By]                    VARCHAR (20) NULL,
    [S_Upd_By]                     VARCHAR (20) NULL,
    [Dt_Crtd_On]                   DATETIME     NULL,
    [Dt_Upd_On]                    DATETIME     NULL,
    CONSTRAINT [PK__T_Employee_Role___5D61A667] PRIMARY KEY CLUSTERED ([I_Employee_Role_Map_Audit_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Emp__18633BFB] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__54782602] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__636F8578] FOREIGN KEY ([I_Employee_Role_Map_ID]) REFERENCES [EOS].[T_Employee_Role_Map] ([I_Employee_Role_Map_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__6557CDEA] FOREIGN KEY ([I_Employee_Role_Map_ID]) REFERENCES [EOS].[T_Employee_Role_Map] ([I_Employee_Role_Map_ID]),
    CONSTRAINT [FK__T_Employe__I_Rol__176F17C2] FOREIGN KEY ([I_Role_ID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID]),
    CONSTRAINT [FK__T_Employe__I_Rol__538401C9] FOREIGN KEY ([I_Role_ID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID])
);


GO
ALTER TABLE [EOS].[T_Employee_Role_Map_Audit] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__18633BFB];


GO
ALTER TABLE [EOS].[T_Employee_Role_Map_Audit] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__54782602];


GO
ALTER TABLE [EOS].[T_Employee_Role_Map_Audit] NOCHECK CONSTRAINT [FK__T_Employe__I_Rol__176F17C2];


GO
ALTER TABLE [EOS].[T_Employee_Role_Map_Audit] NOCHECK CONSTRAINT [FK__T_Employe__I_Rol__538401C9];



