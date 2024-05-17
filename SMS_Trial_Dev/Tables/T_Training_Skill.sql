CREATE TABLE [ACADEMICS].[T_Training_Skill] (
    [I_Training_Skill_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Skill_ID]          INT          NULL,
    [I_Training_ID]       INT          NULL,
    [S_Crtd_By]           VARCHAR (20) NULL,
    [S_Upd_By]            VARCHAR (20) NULL,
    [Dt_Crtd_On]          DATETIME     NULL,
    [Dt_Upd_On]           DATETIME     NULL,
    CONSTRAINT [PK__T_Training_Skill__6C6EDFCD] PRIMARY KEY CLUSTERED ([I_Training_Skill_ID] ASC),
    CONSTRAINT [FK__T_Trainin__I_Ski__32F66B4F] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID]),
    CONSTRAINT [FK__T_Trainin__I_Ski__33EA8F88] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID]),
    CONSTRAINT [FK__T_Trainin__I_Ski__34DEB3C1] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID]),
    CONSTRAINT [FK__T_Trainin__I_Ski__35D2D7FA] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID]),
    CONSTRAINT [FK__T_Trainin__I_Ski__36C6FC33] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID])
);


GO
ALTER TABLE [ACADEMICS].[T_Training_Skill] NOCHECK CONSTRAINT [FK__T_Trainin__I_Ski__32F66B4F];


GO
ALTER TABLE [ACADEMICS].[T_Training_Skill] NOCHECK CONSTRAINT [FK__T_Trainin__I_Ski__33EA8F88];


GO
ALTER TABLE [ACADEMICS].[T_Training_Skill] NOCHECK CONSTRAINT [FK__T_Trainin__I_Ski__34DEB3C1];


GO
ALTER TABLE [ACADEMICS].[T_Training_Skill] NOCHECK CONSTRAINT [FK__T_Trainin__I_Ski__35D2D7FA];


GO
ALTER TABLE [ACADEMICS].[T_Training_Skill] NOCHECK CONSTRAINT [FK__T_Trainin__I_Ski__36C6FC33];



