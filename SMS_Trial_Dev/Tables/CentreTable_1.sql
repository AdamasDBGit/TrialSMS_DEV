﻿CREATE TABLE [dbo].[CentreTable_1] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [CentreID] INT           NOT NULL,
    [cname]    VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_CentreTable_1] PRIMARY KEY CLUSTERED ([id] ASC)
);

