CREATE TABLE [dbo].[T_ERP_Exam_Grade_Master_Header] (
    [I_Exam_Grade_Master_Header_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Grade_Name]                  VARCHAR (100) NULL,
    [Dt_CreatedAt]                  DATETIME      CONSTRAINT [DF__T_ERP_Exa__Dt_Cr__09E04444] DEFAULT (getdate()) NULL,
    [I_CreatedBy]                   INT           NULL,
    [Is_Active]                     BIT           CONSTRAINT [DF__T_ERP_Exa__Is_Ac__0AD4687D] DEFAULT ((1)) NULL,
    [Dt_Modified_At]                DATETIME      NULL,
    [I_Modified_By]                 INT           NULL,
    CONSTRAINT [PK__T_ERP_Ex__EE84DB2CCBA654AF] PRIMARY KEY CLUSTERED ([I_Exam_Grade_Master_Header_ID] ASC)
);

