CREATE TABLE [dbo].[T_Task_Details] (
    [I_Task_Details_Id]     INT           IDENTITY (1, 1) NOT NULL,
    [I_Task_Master_Id]      INT           NOT NULL,
    [S_Task_Description]    VARCHAR (500) NOT NULL,
    [S_Querystring]         VARCHAR (100) NULL,
    [I_Hierarchy_Master_ID] INT           NOT NULL,
    [S_Hierarchy_Chain]     VARCHAR (100) NOT NULL,
    [I_Status]              INT           NOT NULL,
    [S_Wf_Instanceid]       VARCHAR (500) NULL,
    [Dt_Due_date]           DATETIME      NULL,
    [Dt_Created_Date]       DATETIME      NULL,
    [Dt_Updated_Date]       DATETIME      NULL,
    CONSTRAINT [PK_T_Task_Details] PRIMARY KEY CLUSTERED ([I_Task_Details_Id] ASC)
);

