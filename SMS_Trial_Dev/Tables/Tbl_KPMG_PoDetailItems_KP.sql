CREATE TABLE [dbo].[Tbl_KPMG_PoDetailItems_KP] (
    [Fld_KPMG_PoDetail_Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Fld_KPMG_PoPr_Id]             INT           NOT NULL,
    [Fld_KPMG_Barcode]             VARCHAR (100) NULL,
    [Fld_KPMG_Status]              INT           NOT NULL,
    [OracleLinieId]                VARCHAR (255) NULL,
    [Fld_KPMG_OracleTransactionId] VARCHAR (50)  NULL
);

