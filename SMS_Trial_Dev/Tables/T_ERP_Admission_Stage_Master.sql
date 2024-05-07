CREATE TABLE [dbo].[T_ERP_Admission_Stage_Master] (
    [I_Admission_Stage_ID]           INT           IDENTITY (1, 1) NOT NULL,
    [S_Admission_Current_Stage]      NVARCHAR (30) NULL,
    [S_Admission_Current_Stage_Desc] VARCHAR (100) NULL,
    [I_Sequence]                     INT           NULL,
    [Is_Final_Stage]                 BIT           NULL,
    [I_Brand_ID]                     INT           NULL,
    [S_Created_By]                   VARCHAR (100) NULL,
    [Dt_Created_At]                  DATETIME      NULL,
    [S_Updated_By]                   VARCHAR (100) NULL,
    [Dt_Updated_At]                  DATETIME      NULL,
    [S_Admission_Next_Stage_Desc]    VARCHAR (100) NULL,
    [S_Admission_Next_Stage]         VARCHAR (30)  NULL
);

