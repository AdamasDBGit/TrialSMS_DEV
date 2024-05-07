CREATE TABLE [dbo].[T_ERP_Exam_Grade_Master] (
    [I_Exam_Grade_Master_ID]        INT           IDENTITY (1, 1) NOT NULL,
    [I_Exam_Grade_Master_Header_ID] INT           NULL,
    [S_Symbol]                      VARCHAR (100) NOT NULL,
    [S_Name]                        VARCHAR (100) NULL,
    [I_Lower_Limit]                 INT           NOT NULL,
    [I_Upper_Limit]                 INT           NOT NULL,
    [S_Remarks]                     VARCHAR (100) NULL,
    [Dt_CreatedBy]                  INT           NULL,
    [Dt_CreatedAt]                  DATETIME      CONSTRAINT [DF__T_ERP_Exa__Dt_Cr__0DB0D528] DEFAULT (getdate()) NULL,
    [Dt_Modified_At]                DATETIME      NULL,
    [I_Modified_By]                 INT           NULL,
    [Is_Active]                     BIT           NULL,
    CONSTRAINT [PK__T_ERP_Ex__E6D5CB4B8C6C2EC2] PRIMARY KEY CLUSTERED ([I_Exam_Grade_Master_ID] ASC)
);

