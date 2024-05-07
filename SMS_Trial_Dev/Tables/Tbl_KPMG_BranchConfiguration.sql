CREATE TABLE [dbo].[Tbl_KPMG_BranchConfiguration] (
    [fld_kpmg_Id]               INT           IDENTITY (1, 1) NOT NULL,
    [fld_kpmg_BranchId]         INT           NOT NULL,
    [fld_kpmg_BranchName]       VARCHAR (255) NOT NULL,
    [fld_kpmg_OracleBranchName] VARCHAR (255) NOT NULL,
    [fld_kpmg_GenMoCount]       INT           NULL,
    CONSTRAINT [pk_Tbl_KPMG_BranchConfiguration_Fld_KPMG_Id] PRIMARY KEY CLUSTERED ([fld_kpmg_Id] ASC),
    CONSTRAINT [fk_Tbl_KPMG_BranchConfiguration_Fld_KPMG_Branch_Id] FOREIGN KEY ([fld_kpmg_BranchId]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

