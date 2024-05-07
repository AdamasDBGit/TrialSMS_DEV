CREATE TABLE [dbo].[T_ERP_Class] (
    [I_Class_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [S_Class_Code]    VARCHAR (20)  NULL,
    [S_Class_Name]    VARCHAR (255) NULL,
    [Dtt_Created_At]  DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At] DATETIME      NULL,
    [I_Created_By]    INT           NULL,
    [I_Modified_By]   INT           NULL,
    [Is_Active]       BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Class_ID] ASC)
);

