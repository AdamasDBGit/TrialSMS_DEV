CREATE TABLE [ASSESSMENT].[T_Rule_Step_Map] (
    [I_Rule_ID]  INT NOT NULL,
    [I_Step_ID]  INT NOT NULL,
    [I_StatusID] INT NULL,
    CONSTRAINT [FK_T_Rule_Step_Map_T_Rule_Master] FOREIGN KEY ([I_Rule_ID]) REFERENCES [ASSESSMENT].[T_Rule_Master] ([I_Rule_ID]),
    CONSTRAINT [FK_T_Rule_Step_Map_T_Rule_Step_Details] FOREIGN KEY ([I_Step_ID]) REFERENCES [ASSESSMENT].[T_Step_Details] ([I_Step_ID])
);

