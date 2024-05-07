CREATE TABLE [dbo].[T_Task_Master] (
    [I_Task_Master_Id] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Name]           VARCHAR (100) NOT NULL,
    [S_Description]    VARCHAR (500) NULL,
    [I_Type]           TINYINT       NULL,
    [S_URL]            VARCHAR (100) NULL,
    [I_IsActive]       INT           NULL,
    CONSTRAINT [PK_T_Task_Master] PRIMARY KEY CLUSTERED ([I_Task_Master_Id] ASC)
);

