﻿CREATE TABLE [dbo].[T_ERP_Saas_Pattern_Child_Header] (
    [I_Saas_Pattern_Child_Header_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Pattern_HeaderID]             INT           NULL,
    [I_Increment_ID]                 BIGINT        NULL,
    [Pattern1]                       VARCHAR (255) NULL,
    [Is_Active]                      BIT           NULL,
    [N_Value]                        VARCHAR (255) NULL,
    [Pattern2]                       INT           NULL,
    [Pattern3]                       VARCHAR (255) NULL,
    CONSTRAINT [PK__T_ERP_Sa__25BD323AF0098D1A] PRIMARY KEY CLUSTERED ([I_Saas_Pattern_Child_Header_ID] ASC)
);

