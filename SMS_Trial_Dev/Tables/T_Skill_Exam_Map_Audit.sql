CREATE TABLE [EOS].[T_Skill_Exam_Map_Audit] (
    [I_Skill_Exam_Map_Audit_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Skill_Exam_ID]           INT          NULL,
    [I_Centre_ID]               INT          NULL,
    [I_Skill_ID]                INT          NULL,
    [I_Exam_Component_ID]       INT          NULL,
    [Is_Pass_Mandatory]         BIT          NULL,
    [I_Cut_Off]                 INT          NULL,
    [I_Exam_Stage]              INT          NULL,
    [I_Number_Of_Resits]        INT          NULL,
    [I_Status]                  INT          NULL,
    [S_Crtd_By]                 VARCHAR (20) NULL,
    [S_Upd_By]                  VARCHAR (20) NULL,
    [Dt_Crtd_On]                DATETIME     NULL,
    [Dt_Upd_On]                 DATETIME     NULL,
    [I_Total_Time]              INT          NULL,
    CONSTRAINT [PK__T_Skill_Exam_Map__4EF456D6] PRIMARY KEY CLUSTERED ([I_Skill_Exam_Map_Audit_ID] ASC),
    CONSTRAINT [FK__T_Skill_E__I_Cen__38D00B8D] FOREIGN KEY ([I_Centre_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Skill_E__I_Cen__678AFA76] FOREIGN KEY ([I_Centre_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Skill_E__I_Exa__3BAC7838] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK__T_Skill_E__I_Exa__697342E8] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK__T_Skill_E__I_Ski__3AB853FF] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID]),
    CONSTRAINT [FK__T_Skill_E__I_Ski__687F1EAF] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID])
);


GO
ALTER TABLE [EOS].[T_Skill_Exam_Map_Audit] NOCHECK CONSTRAINT [FK__T_Skill_E__I_Ski__3AB853FF];


GO
ALTER TABLE [EOS].[T_Skill_Exam_Map_Audit] NOCHECK CONSTRAINT [FK__T_Skill_E__I_Ski__687F1EAF];



