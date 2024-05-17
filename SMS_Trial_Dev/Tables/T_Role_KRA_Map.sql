CREATE TABLE [EOS].[T_Role_KRA_Map] (
    [I_Role_KRA_Mapping_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]            INT          NOT NULL,
    [I_Role_ID]             INT          NOT NULL,
    [I_KRA_ID]              INT          NOT NULL,
    [I_KRA_Index_ID]        INT          NOT NULL,
    [I_Status]              INT          NULL,
    [S_Crtd_By]             VARCHAR (20) NULL,
    [S_Upd_By]              VARCHAR (20) NULL,
    [Dt_Crtd_On]            DATETIME     NULL,
    [Dt_Upd_On]             DATETIME     NULL,
    CONSTRAINT [PK_T_Role_KRA_Map] PRIMARY KEY CLUSTERED ([I_Role_KRA_Mapping_ID] ASC),
    CONSTRAINT [FK__T_Role_KR__I_Rol__303AC58C] FOREIGN KEY ([I_KRA_ID]) REFERENCES [EOS].[T_KRA_Master] ([I_KRA_ID]),
    CONSTRAINT [FK_T_Role_KRA_Map_T_KRA_Index_Master] FOREIGN KEY ([I_KRA_Index_ID]) REFERENCES [EOS].[T_KRA_Index_Master] ([I_KRA_Index_ID]),
    CONSTRAINT [FK_T_Role_KRA_Map_T_Role_Master] FOREIGN KEY ([I_Role_ID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID])
);


GO
ALTER TABLE [EOS].[T_Role_KRA_Map] NOCHECK CONSTRAINT [FK_T_Role_KRA_Map_T_Role_Master];



