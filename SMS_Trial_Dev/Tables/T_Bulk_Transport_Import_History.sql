CREATE TABLE [dbo].[T_Bulk_Transport_Import_History] (
    [I_Bulk_Transport_ID] INT             IDENTITY (1, 1) NOT NULL,
    [I_PickupPoint_ID]    INT             NOT NULL,
    [I_Brand_ID]          INT             NULL,
    [S_PickupPoint_Name]  VARCHAR (2000)  NULL,
    [N_Fees]              NUMERIC (18, 2) NULL,
    [S_Crtd_By]           VARCHAR (50)    NULL,
    [Dt_Crtd_On]          DATETIME        NULL,
    [S_Academic_Session]  VARCHAR (20)    NULL,
    [ActionType]          VARCHAR (2000)  NULL,
    [ActionStatus]        VARCHAR (200)   NULL
);

