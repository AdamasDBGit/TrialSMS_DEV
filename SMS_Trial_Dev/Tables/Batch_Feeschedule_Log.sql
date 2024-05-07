CREATE TABLE [dbo].[Batch_Feeschedule_Log] (
    [LogID]                   INT           IDENTITY (1, 1) NOT NULL,
    [BrandID]                 INT           NULL,
    [ActionDate]              DATETIME      NULL,
    [ApproveDate]             DATETIME      NULL,
    [BatchID]                 INT           NULL,
    [CourseFeePlanID]         INT           NULL,
    [BatchFeePlanDetailJson]  VARCHAR (MAX) NULL,
    [Actionstatus]            VARCHAR (MAX) NULL,
    [BatchFeePlanCreatedBy]   VARCHAR (MAX) NULL,
    [BatchFeePlanCreatedOn]   DATETIME      NULL,
    [BatchFeePlanUpdatedBy]   VARCHAR (MAX) NULL,
    [BatchFeePlanUpdatedOn]   DATETIME      NULL,
    [CauseOfModify]           VARCHAR (MAX) NULL,
    [PreviousCourseFeePlanID] INT           NULL
);

