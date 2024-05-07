CREATE TABLE [dbo].[T_ActivityEvalCriteria_Map] (
    [I_Activity_ID]   INT NOT NULL,
    [I_Evaluation_ID] INT NOT NULL,
    CONSTRAINT [PK_T_ActivityEvalCriteria_Master] PRIMARY KEY CLUSTERED ([I_Activity_ID] ASC, [I_Evaluation_ID] ASC),
    CONSTRAINT [FK_T_ActivityEvalCriteria_Master_T_Activity_Evaluation_Master] FOREIGN KEY ([I_Evaluation_ID]) REFERENCES [dbo].[T_Activity_Evaluation_Master] ([I_Evaluation_ID]),
    CONSTRAINT [FK_T_ActivityEvalCriteria_Master_T_Activity_Master] FOREIGN KEY ([I_Activity_ID]) REFERENCES [dbo].[T_Activity_Master] ([I_Activity_ID])
);

