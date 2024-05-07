CREATE TABLE [dbo].[T_Online_Payment_Audit] (
    [ID]                INT             IDENTITY (1, 1) NOT NULL,
    [BrandName]         VARCHAR (MAX)   NULL,
    [StudentID]         VARCHAR (MAX)   NULL,
    [ReceiptDate]       DATETIME        NULL,
    [CentreID]          INT             NULL,
    [PaymentDetailsXML] XML             NULL,
    [ReceiptAmount]     NUMERIC (18, 2) NULL,
    [ReceiptTaxAmount]  NUMERIC (18, 2) NULL,
    [ReceiptType]       INT             NULL,
    [TransactionCode]   VARCHAR (MAX)   NULL,
    [ExtReceiptNo]      VARCHAR (MAX)   NULL,
    [SourceName]        VARCHAR (MAX)   NULL,
    [CreatedOn]         DATETIME        NULL
);

