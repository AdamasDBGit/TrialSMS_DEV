﻿CREATE TABLE [dbo].[Tbl_KPMG_StockMaster] (
    [Fld_KPMG_Stock_Id]       INT            IDENTITY (1, 1) NOT NULL,
    [Fld_KPMG_Branch_Id]      INT            NOT NULL,
    [Fld_KPMG_FromBranch_Id]  INT            NOT NULL,
    [Fld_KPMG_ItemCode]       VARCHAR (50)   NOT NULL,
    [Fld_KPMG_LastRecvDate]   DATETIME       NOT NULL,
    [Fld_KPMG_Mo_Id]          INT            NOT NULL,
    [Fld_KPMG_IsMo]           INT            NOT NULL,
    [Fld_KPMG_OracleMoNumber] NVARCHAR (255) CONSTRAINT [DF__Tbl_KPMG___Fld_K__2C95E888] DEFAULT ('') NULL,
    CONSTRAINT [PK_Tbl_KPMG_StockMaster] PRIMARY KEY CLUSTERED ([Fld_KPMG_Stock_Id] ASC)
);

