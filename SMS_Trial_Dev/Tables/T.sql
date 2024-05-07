CREATE TABLE [dbo].[T] (
    [S_Batch_Schedule_ID_List] NVARCHAR (MAX) NULL,
    [I_Term_ID]                INT            NULL,
    [S_Term_Name]              VARCHAR (500)  NULL,
    [I_Module_ID]              INT            NULL,
    [S_Module_Name]            VARCHAR (500)  NULL,
    [I_Session_ID]             INT            NULL,
    [S_Session_Name]           VARCHAR (500)  NULL,
    [S_Session_Topic]          VARCHAR (1000) NULL,
    [Dt_Schedule_Date]         DATETIME       NULL,
    [Dt_Actual_Date]           DATETIME       NULL,
    [S_Faculty_Name]           VARCHAR (500)  NULL,
    [I_Employee_ID]            INT            NULL,
    [I_Is_Complete]            INT            NULL,
    [I_Batch_ID]               INT            NULL
);

