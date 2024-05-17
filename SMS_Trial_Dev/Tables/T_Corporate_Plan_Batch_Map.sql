CREATE TABLE [CORPORATE].[T_Corporate_Plan_Batch_Map] (
    [I_Corporate_Plan_ID] INT NOT NULL,
    [I_Batch_ID]          INT NOT NULL,
    CONSTRAINT [PK_T_CorporatePlan_Batch_Map] PRIMARY KEY CLUSTERED ([I_Corporate_Plan_ID] ASC, [I_Batch_ID] ASC),
    CONSTRAINT [FK_T_Corporate_Plan_Batch_Map_T_Corporate_Plan] FOREIGN KEY ([I_Corporate_Plan_ID]) REFERENCES [CORPORATE].[T_Corporate_Plan] ([I_Corporate_Plan_ID]),
    CONSTRAINT [FK_T_Corporate_Plan_Batch_Map_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);


GO
ALTER TABLE [CORPORATE].[T_Corporate_Plan_Batch_Map] NOCHECK CONSTRAINT [FK_T_Corporate_Plan_Batch_Map_T_Student_Batch_Master];



