﻿CREATE TABLE [dbo].[T_Event_Back_05_02_2024] (
    [I_Event_ID]             INT            IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]             INT            NULL,
    [I_Event_Category_ID]    INT            NULL,
    [S_Event_Name]           NVARCHAR (200) NULL,
    [Dt_StartDate]           DATE           NULL,
    [Dt_StartTime]           TIME (0)       NULL,
    [Dt_EndDate]             DATE           NULL,
    [Dt_EndTime]             TIME (0)       NULL,
    [S_Address]              NVARCHAR (MAX) NULL,
    [S_Remarks]              NVARCHAR (200) NULL,
    [S_Is_Unplanned]         INT            NULL,
    [I_Status]               INT            NULL,
    [S_CreatedBy]            NVARCHAR (50)  NULL,
    [Dt_CreatedOn]           DATETIME       NULL,
    [Dt_UpdatedOn]           DATETIME       NULL,
    [S_Event_Desc]           VARCHAR (255)  NULL,
    [I_EventFor]             TINYINT        NULL,
    [Is_Through_Bulk_upload] BIT            NULL
);

