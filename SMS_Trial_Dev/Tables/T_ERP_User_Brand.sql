﻿CREATE TABLE [dbo].[T_ERP_User_Brand] (
    [I_User_Brand_ID] INT      IDENTITY (1, 1) NOT NULL,
    [I_User_ID]       INT      NOT NULL,
    [I_Brand_ID]      INT      NOT NULL,
    [I_CreatedBy]     INT      NULL,
    [Dt_CreatedAt]    DATETIME NULL,
    [Is_Active]       BIT      DEFAULT ((1)) NULL
);

