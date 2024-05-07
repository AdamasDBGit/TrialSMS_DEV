CREATE TABLE [dbo].[Tbl_KPMG_PoDetailItems] (
    [Fld_KPMG_PoDetail_Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Fld_KPMG_PoPr_Id]             INT           NOT NULL,
    [Fld_KPMG_Barcode]             VARCHAR (100) NULL,
    [Fld_KPMG_Status]              INT           CONSTRAINT [DF_Tbl_KPMG_PoDetailItems_Fld_KPMG_Status] DEFAULT ((0)) NOT NULL,
    [OracleLinieId]                VARCHAR (255) NULL,
    [Fld_KPMG_OracleTransactionId] VARCHAR (50)  NULL,
    CONSTRAINT [pk_Tbl_KPMG_PoDetailItems_Fld_KPMG_PoPr_Id] PRIMARY KEY CLUSTERED ([Fld_KPMG_PoDetail_Id] ASC),
    CONSTRAINT [fk_Tbl_KPMG_PoDetailItems_Fld_KPMG_PoPr_Id] FOREIGN KEY ([Fld_KPMG_PoPr_Id]) REFERENCES [dbo].[Tbl_KPMG_PoDetails] ([Fld_KPMG_PoPr_Id])
);

