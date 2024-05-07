CREATE TABLE [dbo].[BulkUploadEventTable] (
    [ID]                    INT           IDENTITY (1, 1) NOT NULL,
    [S_Event_Name]          VARCHAR (500) NULL,
    [S_Event_For]           VARCHAR (500) NULL,
    [S_Event_Desc]          VARCHAR (500) NULL,
    [S_CreatedBy]           VARCHAR (500) NULL,
    [S_Event_Category_Name] VARCHAR (500) NULL,
    [S_Address]             VARCHAR (500) NULL,
    [S_School_Group_Name]   VARCHAR (500) NULL,
    [S_Class]               VARCHAR (500) NULL,
    [S_Faculty_Name]        VARCHAR (500) NULL,
    [Dt_StartDate]          DATETIME      NULL,
    [Dt_EndDate]            DATETIME      NULL
);

