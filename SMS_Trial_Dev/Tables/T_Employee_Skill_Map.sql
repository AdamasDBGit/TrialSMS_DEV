CREATE TABLE [EOS].[T_Employee_Skill_Map] (
    [I_Emp_Skill_Dtl_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Skill_ID]         INT          NULL,
    [I_Employee_ID]      INT          NULL,
    [I_Status]           INT          NULL,
    [S_Crtd_By]          VARCHAR (20) NULL,
    [S_Upd_By]           VARCHAR (20) NULL,
    [Dt_Crtd_On]         DATETIME     NULL,
    [Dt_Upd_On]          DATETIME     NULL,
    CONSTRAINT [PK__T_Employee_Skill__703F70B1] PRIMARY KEY CLUSTERED ([I_Emp_Skill_Dtl_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Emp__1B3FA8A6] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK_T_Employee_Skill_Map_T_EOS_Skill_Master] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID])
);


GO
ALTER TABLE [EOS].[T_Employee_Skill_Map] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__1B3FA8A6];


GO
ALTER TABLE [EOS].[T_Employee_Skill_Map] NOCHECK CONSTRAINT [FK_T_Employee_Skill_Map_T_EOS_Skill_Master];



