CREATE TABLE [dbo].[T_Batch_Log] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [I_Process_ID]         INT            NOT NULL,
    [I_Batch_Process_ID]   INT            NULL,
    [S_Batch_Process_Name] VARCHAR (100)  NULL,
    [S_Comments]           VARCHAR (2000) NULL,
    [Dt_Run_Date_Time]     DATETIME       NULL,
    [S_Status]             VARCHAR (20)   NULL
);

