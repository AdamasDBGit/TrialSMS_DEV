CREATE TABLE [dbo].[tbl_KPMG_Notifications] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [NotificationMessage] VARCHAR (MAX) NULL,
    [TaskMessage]         VARCHAR (MAX) NULL,
    [UniqueKey]           VARCHAR (100) NULL,
    [BranchId]            INT           NULL,
    [ItemAmount]          VARCHAR (100) NULL
);

