CREATE TABLE [EXAMINATION].[T_Batch_Exam_Faculty_Map] (
    [I_Batch_Exam_ID] INT NOT NULL,
    [I_Employee_ID]   INT NOT NULL,
    CONSTRAINT [PK_T_Batch_Exam_Faculty_Map] PRIMARY KEY CLUSTERED ([I_Batch_Exam_ID] ASC, [I_Employee_ID] ASC),
    CONSTRAINT [FK_T_Batch_Exam_Faculty_Map_T_Batch_Exam_Faculty_Map] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID])
);


GO
ALTER TABLE [EXAMINATION].[T_Batch_Exam_Faculty_Map] NOCHECK CONSTRAINT [FK_T_Batch_Exam_Faculty_Map_T_Batch_Exam_Faculty_Map];



