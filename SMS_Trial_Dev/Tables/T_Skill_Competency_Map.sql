CREATE TABLE [ASSESSMENT].[T_Skill_Competency_Map] (
    [I_Competency_ID] INT          NOT NULL,
    [I_Skill_ID]      INT          NOT NULL,
    [S_Ctrd_by]       VARCHAR (20) NULL,
    [S_Updt_by]       VARCHAR (20) NULL,
    [Dt_Crtd_On]      DATETIME     NULL,
    [Dt_Updt_On]      DATETIME     NULL,
    CONSTRAINT [PK_T_Skill_Competency_Map] PRIMARY KEY CLUSTERED ([I_Competency_ID] ASC, [I_Skill_ID] ASC),
    CONSTRAINT [FK_T_Skill_Competency_Map_T_Competency_Details] FOREIGN KEY ([I_Competency_ID]) REFERENCES [ASSESSMENT].[T_Competency_Details] ([I_Competency_ID]),
    CONSTRAINT [FK_T_Skill_Competency_Map_T_EOS_Skill_Master] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID])
);

