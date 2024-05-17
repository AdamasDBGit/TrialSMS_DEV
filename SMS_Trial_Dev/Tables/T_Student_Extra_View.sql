CREATE TABLE [dbo].[T_Student_Extra_View] (
    [I_Student_Detail_ID] INT NOT NULL,
    [I_Batch_ID]          INT NOT NULL,
    [I_Extra_View_Count]  INT NULL,
    CONSTRAINT [PK_T_Student_Extra_View] PRIMARY KEY CLUSTERED ([I_Student_Detail_ID] ASC, [I_Batch_ID] ASC),
    CONSTRAINT [FK_T_Student_Extra_View_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID]),
    CONSTRAINT [FK_T_Student_Extra_View_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);


GO
ALTER TABLE [dbo].[T_Student_Extra_View] NOCHECK CONSTRAINT [FK_T_Student_Extra_View_T_Student_Batch_Master];



