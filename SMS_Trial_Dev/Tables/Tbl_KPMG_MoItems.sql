CREATE TABLE [dbo].[Tbl_KPMG_MoItems] (
    [Fld_KPMG_MoItem_Id]        INT          IDENTITY (1, 1) NOT NULL,
    [Fld_KPMG_Mo_Id]            INT          NOT NULL,
    [Fld_KPMG_Itemcode]         VARCHAR (50) NOT NULL,
    [Fld_KPMG_Quantity]         INT          NOT NULL,
    [Fld_KPMG_OracleLineNumber] INT          NULL,
    CONSTRAINT [PK_T_MoItems] PRIMARY KEY CLUSTERED ([Fld_KPMG_MoItem_Id] ASC),
    CONSTRAINT [fk_Tbl_KPMG_MoItems_Fld_KPMG_Mo_Id] FOREIGN KEY ([Fld_KPMG_Mo_Id]) REFERENCES [dbo].[Tbl_KPMG_MoMaster] ([Fld_KPMG_Mo_Id])
);

