CREATE TABLE [dbo].[T_Tax_Country_ReceiptType] (
    [I_Country_ReceiptType_Tax_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Tax_ID]                     INT             NULL,
    [I_Country_ID]                 INT             NULL,
    [I_Receipt_Type]               INT             NULL,
    [N_Tax_Rate]                   NUMERIC (10, 6) NULL,
    [Dt_Valid_From]                DATETIME        NULL,
    [Dt_Valid_To]                  DATETIME        NULL,
    [I_Status]                     INT             NULL,
    [S_Crtd_By]                    VARCHAR (20)    NULL,
    [Dt_Crtd_On]                   DATETIME        NULL,
    [S_Upd_By]                     VARCHAR (20)    NULL,
    [Dt_Upd_On]                    DATETIME        NULL,
    CONSTRAINT [PK_T_Tax_Country_ReceiptType] PRIMARY KEY CLUSTERED ([I_Country_ReceiptType_Tax_ID] ASC),
    CONSTRAINT [FK_T_Tax_Country_ReceiptType_T_Country_Master] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK_T_Tax_Country_ReceiptType_T_Tax_Master] FOREIGN KEY ([I_Tax_ID]) REFERENCES [dbo].[T_Tax_Master] ([I_Tax_ID])
);

