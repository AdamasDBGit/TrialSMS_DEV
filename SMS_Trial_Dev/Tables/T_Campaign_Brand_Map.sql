﻿CREATE TABLE [ECOMMERCE].[T_Campaign_Brand_Map] (
    [ID]         INT IDENTITY (1, 1) NOT NULL,
    [CampaignID] INT NULL,
    [BrandID]    INT NULL,
    [StatusID]   INT CONSTRAINT [DF__T_Campaig__Statu__5556A215] DEFAULT ((1)) NULL,
    CONSTRAINT [PK__T_Campai__3214EC2711C3BF2D] PRIMARY KEY CLUSTERED ([ID] ASC)
);

