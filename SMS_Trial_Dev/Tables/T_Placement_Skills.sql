﻿CREATE TABLE [PLACEMENT].[T_Placement_Skills] (
    [I_Skills_ID]          INT          NOT NULL,
    [S_Skill_Proficiency]  VARCHAR (50) NULL,
    [B_Soft_Skill]         BIT          NOT NULL,
    [B_Technical_Skill]    BIT          NOT NULL,
    [I_Student_Detail_ID]  INT          NULL,
    [S_Crtd_By]            VARCHAR (20) NULL,
    [S_Upd_By]             VARCHAR (20) NULL,
    [Dt_Crtd_on]           DATETIME     NULL,
    [Dt_Upd_On]            DATETIME     NULL,
    [I_Status]             INT          NOT NULL,
    [I_Placement_Skill_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    CONSTRAINT [PK__T_Placement_Skil__3E3E00C9] PRIMARY KEY CLUSTERED ([I_Placement_Skill_ID] ASC),
    CONSTRAINT [FK__T_Placeme__I_Ski__4026493B] FOREIGN KEY ([I_Skills_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID]),
    CONSTRAINT [FK__T_Placeme__I_Stu__3F322502] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [PLACEMENT].[T_Placement_Registration] ([I_Student_Detail_ID])
);


GO
ALTER TABLE [PLACEMENT].[T_Placement_Skills] NOCHECK CONSTRAINT [FK__T_Placeme__I_Ski__4026493B];



