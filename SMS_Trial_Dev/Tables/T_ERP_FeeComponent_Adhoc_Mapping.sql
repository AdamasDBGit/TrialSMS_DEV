CREATE TABLE [dbo].[T_ERP_FeeComponent_Adhoc_Mapping] (
    [I_FeeComponent_Adhoc_ID] INT             IDENTITY (1, 1) NOT NULL,
    [I_Fee_Component_ID]      INT             NULL,
    [I_Brand_ID]              INT             NULL,
    [N_Amount]                NUMERIC (12, 2) NULL,
    [Is_Active]               BIT             DEFAULT ((1)) NULL,
    [Dt_Created_At]           DATETIME        DEFAULT (getdate()) NULL,
    [Dt_Modified_At]          DATETIME        NULL,
    [I_Created_By]            INT             NULL,
    [I_Modified_By]           INT             NULL
);

