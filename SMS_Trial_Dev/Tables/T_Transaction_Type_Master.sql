CREATE TABLE [ERP].[T_Transaction_Type_Master] (
    [I_Transaction_Type_ID]   INT           NOT NULL,
    [I_Fee_Component_ID]      INT           NULL,
    [I_Tax_ID]                INT           NULL,
    [I_Transaction_Nature_ID] INT           NOT NULL,
    [S_Transaction_Code]      VARCHAR (100) NULL,
    [S_Transaction_Type]      VARCHAR (250) NULL,
    [I_Status]                INT           NOT NULL,
    [I_Brand_ID]              INT           NULL,
    [I_Status_ID]             INT           NULL,
    [I_Payment_Mode_ID]       INT           NULL,
    CONSTRAINT [PK_T_Transaction_Type_Master] PRIMARY KEY CLUSTERED ([I_Transaction_Type_ID] ASC),
    CONSTRAINT [FK_T_Transaction_Type_Master_T_Fee_Component_Master] FOREIGN KEY ([I_Fee_Component_ID]) REFERENCES [dbo].[T_Fee_Component_Master] ([I_Fee_Component_ID]),
    CONSTRAINT [FK_T_Transaction_Type_Master_T_PaymentMode_Master] FOREIGN KEY ([I_Payment_Mode_ID]) REFERENCES [dbo].[T_PaymentMode_Master] ([I_PaymentMode_ID]),
    CONSTRAINT [FK_T_Transaction_Type_Master_T_Transaction_Nature_Master] FOREIGN KEY ([I_Transaction_Nature_ID]) REFERENCES [ERP].[T_Transaction_Nature_Master] ([I_Transaction_Nature_ID])
);

