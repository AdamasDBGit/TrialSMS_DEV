CREATE TABLE [dbo].[Temp_Transport_For_Bulk_Import] (
    [S_PickupPoint_Name] VARCHAR (2000)  NULL,
    [I_Brand_ID]         INT             NULL,
    [Route_No]           VARCHAR (MAX)   NULL,
    [N_Fees]             NUMERIC (18, 2) NULL,
    [ActinStatus]        VARCHAR (200)   NULL,
    [CreationDate]       DATETIME        NULL
);

