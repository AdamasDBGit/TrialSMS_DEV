CREATE TABLE [dbo].[AuditTable] (
    [TableID]           INT          IDENTITY (1, 1) NOT NULL,
    [TableName]         VARCHAR (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [IsDeleted]         BIT          CONSTRAINT [DF_AuditTable_IsDeleted] DEFAULT ((0)) NOT NULL,
    [IsUpdateAuditReqd] BIT          CONSTRAINT [DF_AuditTable_IsUpdateAuditReqd] DEFAULT ((1)) NOT NULL,
    [IsInsertAuditReqd] BIT          CONSTRAINT [DF_AuditTable_IsInsertAuditReqd] DEFAULT ((1)) NOT NULL,
    [IsDeleteAuditReqd] BIT          CONSTRAINT [DF_AuditTable_IsDeleteAuditReqd] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_AuditTable] PRIMARY KEY CLUSTERED ([TableID] ASC)
);

