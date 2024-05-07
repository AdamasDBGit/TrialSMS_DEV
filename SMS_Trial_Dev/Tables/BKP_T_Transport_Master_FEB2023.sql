﻿CREATE TABLE [dbo].[BKP_T_Transport_Master_FEB2023] (
    [I_PickupPoint_ID]   INT             IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]         INT             NULL,
    [S_PickupPoint_Name] VARCHAR (2000)  NULL,
    [N_Fees]             NUMERIC (18, 2) NULL,
    [I_Status]           INT             NULL,
    [S_Crtd_By]          VARCHAR (50)    NULL,
    [Dt_Crtd_On]         DATETIME        NULL,
    [S_Updt_By]          VARCHAR (50)    NULL,
    [Dt_Updt_On]         DATETIME        NULL
);

