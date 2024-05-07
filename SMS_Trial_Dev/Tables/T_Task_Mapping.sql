CREATE TABLE [dbo].[T_Task_Mapping] (
    [I_Task_Mapping_Id] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Task_Details_Id] INT           NULL,
    [S_Key]             VARCHAR (50)  NULL,
    [S_Value]           VARCHAR (100) NULL,
    CONSTRAINT [PK_T_Task_Mapping] PRIMARY KEY CLUSTERED ([I_Task_Mapping_Id] ASC)
);

