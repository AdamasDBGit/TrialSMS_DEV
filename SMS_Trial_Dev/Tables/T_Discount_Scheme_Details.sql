CREATE TABLE [dbo].[T_Discount_Scheme_Details] (
    [I_Discount_Scheme_Detail_ID] INT             IDENTITY (1, 1) NOT NULL,
    [I_Discount_Scheme_ID]        INT             NOT NULL,
    [N_Discount_Rate]             NUMERIC (18)    NULL,
    [N_Discount_Amount]           DECIMAL (14, 2) NULL,
    [I_IsApplicableOn]            INT             NULL,
    [S_FromInstalment]            VARCHAR (5)     NULL,
    [S_FeeComponents]             VARCHAR (MAX)   NULL
);

