CREATE TABLE [dbo].[T_Session_Master] (
    [I_Session_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [I_Session_Type_ID]  INT            NULL,
    [I_Brand_ID]         INT            NULL,
    [S_Session_Code]     VARCHAR (50)   NOT NULL,
    [S_Session_Name]     VARCHAR (250)  NULL,
    [N_Session_Duration] NUMERIC (18)   NULL,
    [S_Crtd_By]          VARCHAR (20)   NULL,
    [S_Upd_By]           VARCHAR (20)   NULL,
    [S_Session_Topic]    VARCHAR (1000) NULL,
    [Dt_Crtd_On]         DATETIME       NULL,
    [Dt_Upd_On]          DATETIME       NULL,
    [I_Is_Editable]      INT            NULL,
    [I_Status]           INT            NULL,
    [I_Skill_ID]         INT            NULL,
    CONSTRAINT [PK__T_Session_Master__407B4EF6] PRIMARY KEY CLUSTERED ([I_Session_ID] ASC),
    CONSTRAINT [FK__T_Session__I_Bra__7212AA8A] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_Session__I_Ses__711E8651] FOREIGN KEY ([I_Session_Type_ID]) REFERENCES [dbo].[T_Session_Type_Master] ([I_Session_Type_ID]),
    CONSTRAINT [FK_T_Session_Master_T_EOS_Skill_Master] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID])
);


GO
ALTER TABLE [dbo].[T_Session_Master] NOCHECK CONSTRAINT [FK__T_Session__I_Bra__7212AA8A];


GO
ALTER TABLE [dbo].[T_Session_Master] NOCHECK CONSTRAINT [FK_T_Session_Master_T_EOS_Skill_Master];



