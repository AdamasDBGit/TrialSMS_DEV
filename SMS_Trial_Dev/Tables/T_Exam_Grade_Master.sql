CREATE TABLE [dbo].[T_Exam_Grade_Master] (
    [I_Exam_Grade_Master_ID]        INT           IDENTITY (1, 1) NOT NULL,
    [I_Exam_Grade_Master_Header_ID] INT           NULL,
    [S_Symbol]                      VARCHAR (100) NOT NULL,
    [S_Name]                        VARCHAR (255) NULL,
    [I_Lower_Limit]                 INT           NOT NULL,
    [I_Upper_Limit]                 INT           NOT NULL,
    [Dt_CreatedBy]                  INT           NULL,
    [Dt_CreatedAt]                  DATETIME      NULL
);

