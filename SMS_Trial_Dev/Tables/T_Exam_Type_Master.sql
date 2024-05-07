CREATE TABLE [dbo].[T_Exam_Type_Master] (
    [I_Exam_Type_Master_ID] INT           NOT NULL,
    [S_Exam_Type_Name]      VARCHAR (100) NULL,
    CONSTRAINT [PK_T_Exam_Type_Master] PRIMARY KEY CLUSTERED ([I_Exam_Type_Master_ID] ASC)
);

