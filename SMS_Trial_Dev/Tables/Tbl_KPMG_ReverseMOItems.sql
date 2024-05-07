CREATE TABLE [dbo].[Tbl_KPMG_ReverseMOItems] (
    [FLd_KPMG_Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [Fld_KPMG_ItemCode]           VARCHAR (255) NOT NULL,
    [Fld_KPMG_BarCode]            VARCHAR (255) NOT NULL,
    [Fld_KPMG_MoId]               INT           NOT NULL,
    [Fld_KPMG_ParentMoId]         INT           NOT NULL,
    [Fld_KPMG_Status]             INT           NULL,
    [Fld_KPMG_IsLoadedFromBranch] CHAR (1)      CONSTRAINT [DF__Tbl_KPMG___Fld_K__063B3576] DEFAULT ('N') NULL,
    [Fld_KPMG_IsReceivedAtCCM]    CHAR (1)      CONSTRAINT [DF__Tbl_KPMG___Fld_K__3F73B2D2] DEFAULT ('N') NULL,
    CONSTRAINT [pk_Tbl_KPMG_ReverseMOItems_FLd_KPMG_Id] PRIMARY KEY CLUSTERED ([FLd_KPMG_Id] ASC),
    CONSTRAINT [fk_Tbl_KPMG_ReverseMOItems_Fld_KPMG_MoId] FOREIGN KEY ([Fld_KPMG_MoId]) REFERENCES [dbo].[Tbl_KPMG_MoMaster] ([Fld_KPMG_Mo_Id]),
    CONSTRAINT [fk_Tbl_KPMG_ReverseMOItems_Fld_KPMG_ParentMoId] FOREIGN KEY ([Fld_KPMG_ParentMoId]) REFERENCES [dbo].[Tbl_KPMG_MoMaster] ([Fld_KPMG_Mo_Id])
);

