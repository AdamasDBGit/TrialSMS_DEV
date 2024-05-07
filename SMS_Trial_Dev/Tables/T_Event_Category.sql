﻿CREATE TABLE [dbo].[T_Event_Category] (
    [I_Event_Category_ID] INT            IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]          INT            NULL,
    [S_Event_Category]    NVARCHAR (100) NOT NULL,
    [I_Status]            INT            NOT NULL,
    [S_CreatedBy]         NVARCHAR (50)  NULL,
    [Dt_CreatedOn]        DATETIME       NULL,
    [Dt_UpdatedOn]        DATETIME       NULL
);

