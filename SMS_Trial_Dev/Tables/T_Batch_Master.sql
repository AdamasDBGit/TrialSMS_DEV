CREATE TABLE [dbo].[T_Batch_Master] (
    [I_Batch_Process_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_Batch_Process_Name] VARCHAR (100) NOT NULL,
    [S_Batch_Process_Desc] VARCHAR (500) NULL,
    [I_Interval_Days]      SMALLINT      NOT NULL,
    [I_Sequence_Number]    TINYINT       NOT NULL,
    [Dt_Last_Run_Date]     DATETIME      NULL,
    [S_Last_Run_Status]    VARCHAR (50)  NULL,
    [I_Status]             INT           NULL,
    CONSTRAINT [PK__T_Batch_M__40064DAA] PRIMARY KEY CLUSTERED ([I_Batch_Process_ID] ASC)
);

