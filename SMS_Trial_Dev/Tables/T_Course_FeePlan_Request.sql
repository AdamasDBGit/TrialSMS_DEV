CREATE TABLE [dbo].[T_Course_FeePlan_Request] (
    [I_Course_FeePlan_Request_ID] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Currency_ID]               INT           NULL,
    [I_Course_Delivery_ID]        INT           NULL,
    [I_Course_Center_ID]          INT           NULL,
    [N_TotalLumpSum]              NUMERIC (18)  NULL,
    [N_TotalInstallment]          NUMERIC (18)  NULL,
    [S_Description]               VARCHAR (500) NULL,
    [S_Workflow_GUID_ID]          VARCHAR (50)  NULL,
    [S_Comments]                  VARCHAR (500) NULL,
    [I_Status]                    INT           NULL,
    [S_Crtd_By]                   VARCHAR (20)  NULL,
    [S_Upd_By]                    VARCHAR (20)  NULL,
    [Dt_Crtd_On]                  DATETIME      NULL,
    [Dt_Upd_On]                   DATETIME      NULL,
    CONSTRAINT [PK__T_Course_FeePlan__11EA7D3F] PRIMARY KEY CLUSTERED ([I_Course_FeePlan_Request_ID] ASC)
);

