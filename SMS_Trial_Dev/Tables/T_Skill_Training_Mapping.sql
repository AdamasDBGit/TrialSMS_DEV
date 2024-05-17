CREATE TABLE [EOS].[T_Skill_Training_Mapping] (
    [I_Skill_Training_Mapping_ID] INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Center_ID]                 INT NULL,
    [I_Skill_ID]                  INT NULL,
    [I_Training_ID]               INT NULL,
    [I_Training_Stage]            INT NULL,
    [I_Status]                    INT NULL,
    CONSTRAINT [PK__T_Employee_Train__62520F64] PRIMARY KEY CLUSTERED ([I_Skill_Training_Mapping_ID] ASC),
    CONSTRAINT [FK_T_Employee_Training_Mapping_T_Employee_Training_Master] FOREIGN KEY ([I_Training_ID]) REFERENCES [EOS].[T_Employee_Training_Master] ([I_Training_ID]),
    CONSTRAINT [FK_T_Skill_Training_Mapping_T_Centre_Master] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Skill_Training_Mapping_T_EOS_Skill_Master] FOREIGN KEY ([I_Skill_ID]) REFERENCES [dbo].[T_EOS_Skill_Master] ([I_Skill_ID])
);


GO
ALTER TABLE [EOS].[T_Skill_Training_Mapping] NOCHECK CONSTRAINT [FK_T_Skill_Training_Mapping_T_EOS_Skill_Master];



