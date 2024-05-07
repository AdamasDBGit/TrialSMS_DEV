CREATE TABLE [dbo].[T_ERP_Country_Master] (
    [I_Country_ID]    INT           IDENTITY (1, 1) NOT NULL,
    [S_Country_Code]  VARCHAR (20)  NULL,
    [S_Country_Name]  VARCHAR (100) NULL,
    [R_I_Currency_ID] INT           NULL,
    [Dtt_Created_At]  DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At] DATETIME      NULL,
    [I_Created_By]    INT           NULL,
    [I_Modified_By]   INT           NULL,
    [Is_Active]       BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Country_ID] ASC)
);

