CREATE TABLE [EOS].[T_Role_Skill_Map_Audit] (
    [I_Role_Skill_Map_Audit_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Role_Skill_ID]           INT          NOT NULL,
    [I_Centre_ID]               INT          NULL,
    [I_Role_ID]                 INT          NULL,
    [I_Skill_ID]                INT          NULL,
    [I_Status]                  INT          NULL,
    [S_Crtd_By]                 VARCHAR (20) NULL,
    [S_Upd_By]                  VARCHAR (20) NULL,
    [Dt_Crtd_On]                DATETIME     NULL,
    [Dt_Upd_On]                 DATETIME     NULL,
    [I_Brand_ID]                INT          NULL,
    CONSTRAINT [PK__T_Role_Skill_Map__59911583] PRIMARY KEY CLUSTERED ([I_Role_Skill_Map_Audit_ID] ASC),
    CONSTRAINT [FK__T_Role_Sk__I_Cen__220CA1C6] FOREIGN KEY ([I_Centre_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Role_Sk__I_Rol__2300C5FF] FOREIGN KEY ([I_Role_ID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID]),
    CONSTRAINT [FK__T_Role_Sk__I_Ski__5EAAD05B] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID])
);

