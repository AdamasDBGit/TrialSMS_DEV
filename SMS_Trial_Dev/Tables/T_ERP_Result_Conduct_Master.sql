CREATE TABLE [dbo].[T_ERP_Result_Conduct_Master] (
    [I_Result_Conduct_ID] INT          IDENTITY (1, 1) NOT NULL,
    [S_Conduct_Name]      VARCHAR (50) NULL,
    [Is_Active]           BIT          DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Result_Conduct_ID] ASC)
);

