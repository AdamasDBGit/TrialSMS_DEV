CREATE TABLE [dbo].[T_ERP_Prev_Class] (
    [I_Prev_Class_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Class_Name]    VARCHAR (100) NULL,
    [Is_Active]       BIT           DEFAULT ((1)) NULL,
    [Dtt_Created_At]  DATETIME      NULL,
    [Dtt_Modified_At] DATETIME      NULL,
    [I_Created_By]    INT           NULL,
    [I_Modified_By]   INT           NULL,
    PRIMARY KEY CLUSTERED ([I_Prev_Class_ID] ASC)
);

