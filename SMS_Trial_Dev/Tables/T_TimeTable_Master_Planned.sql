﻿CREATE TABLE [dbo].[T_TimeTable_Master_Planned] (
    [I_TimeTable_Planned_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_TimeTable_ID]         INT           NOT NULL,
    [I_Center_ID]            INT           NOT NULL,
    [Dt_Schedule_Date]       DATETIME      NOT NULL,
    [I_TimeSlot_ID]          INT           NOT NULL,
    [I_Batch_ID]             INT           NULL,
    [I_Room_ID]              INT           NOT NULL,
    [I_Skill_ID]             INT           NULL,
    [I_Status]               INT           NOT NULL,
    [S_Crtd_By]              VARCHAR (20)  NOT NULL,
    [Dt_Crtd_On]             DATETIME      NOT NULL,
    [S_Updt_By]              VARCHAR (20)  NULL,
    [Dt_Updt_On]             DATETIME      NULL,
    [S_Remarks]              VARCHAR (500) NULL,
    [I_Session_ID]           INT           NULL,
    [I_Term_ID]              INT           NULL,
    [I_Module_ID]            INT           NULL,
    [S_Session_Name]         VARCHAR (500) NULL,
    [S_Session_Topic]        VARCHAR (500) NULL,
    [Dt_Actual_Date]         DATETIME      NULL,
    [I_Is_Complete]          INT           NULL,
    [I_Employee_ID]          INT           NOT NULL,
    [B_Is_Actual]            BIT           NOT NULL,
    CONSTRAINT [PK__T_TimeTa__7B6B2868728A0DDB] PRIMARY KEY CLUSTERED ([I_TimeTable_Planned_ID] ASC)
);

