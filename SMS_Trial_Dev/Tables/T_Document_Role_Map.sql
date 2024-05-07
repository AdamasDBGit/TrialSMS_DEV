CREATE TABLE [DOCUMENT].[T_Document_Role_Map] (
    [I_DocumentID] INT NOT NULL,
    [I_RoleID]     INT NOT NULL,
    [I_Status]     INT NULL,
    CONSTRAINT [FK_T_Document_Role_Map_T_Role_Master] FOREIGN KEY ([I_RoleID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID]),
    CONSTRAINT [FK_T_Document_Role_Map_T_User_Documents] FOREIGN KEY ([I_DocumentID]) REFERENCES [DOCUMENT].[T_User_Documents] ([I_Document_ID])
);

