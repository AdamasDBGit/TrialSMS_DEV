CREATE TABLE [dbo].[T_Invoice_OnAccount_Details_Tmp] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [Brand]              VARCHAR (200) NULL,
    [StateNameAndCode]   VARCHAR (100) NULL,
    [TaxType]            VARCHAR (50)  NULL,
    [ReceiptNo]          VARCHAR (50)  NULL,
    [OnAccountComponent] VARCHAR (100) NULL,
    [TaxableAmount]      VARCHAR (100) NULL,
    [Tax]                VARCHAR (100) NULL,
    [CreatedDate]        VARCHAR (100) NULL,
    [CancelledDate]      VARCHAR (100) NULL,
    [ReceiptStatus]      VARCHAR (50)  NULL,
    [Type]               VARCHAR (50)  NULL,
    [TAXINV]             VARCHAR (100) NULL,
    [CM]                 VARCHAR (100) NULL,
    [I_Brand_ID]         INT           NULL,
    CONSTRAINT [PK_T_Invoice_OnAccount_Details_Tmp] PRIMARY KEY CLUSTERED ([ID] ASC)
);

