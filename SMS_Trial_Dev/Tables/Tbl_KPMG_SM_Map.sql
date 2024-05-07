CREATE TABLE [dbo].[Tbl_KPMG_SM_Map] (
    [Fld_KPMG_Map_Id]     INT           IDENTITY (1, 1) NOT NULL,
    [Fld_KPMG_ItemCode]   VARCHAR (50)  NOT NULL,
    [Fld_KPMG_Barcode]    VARCHAR (50)  NOT NULL,
    [Fld_KPMG_CourseName] VARCHAR (300) NOT NULL,
    [Fld_KPMG_PR]         VARCHAR (50)  NOT NULL,
    [Fld_KPMG_PO]         VARCHAR (50)  NULL,
    [Fld_KPMG_GrnNunber]  VARCHAR (50)  NOT NULL
);

