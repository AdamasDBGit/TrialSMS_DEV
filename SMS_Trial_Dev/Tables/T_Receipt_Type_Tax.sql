﻿CREATE TABLE [dbo].[T_Receipt_Type_Tax] (
    [I_Center_ReceiptType_Tax_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Centre_Id]                 INT             NOT NULL,
    [I_Receipt_Type]              INT             NOT NULL,
    [I_Tax_ID]                    INT             NOT NULL,
    [N_Tax_Rate]                  NUMERIC (18, 2) NULL,
    [I_Status]                    INT             NULL,
    [Dt_Valid_From]               DATETIME        NULL,
    [Dt_Valid_To]                 DATETIME        NULL,
    [S_Crtd_By]                   VARCHAR (20)    NULL,
    [S_Upd_By]                    VARCHAR (20)    NULL,
    [Dt_Crtd_On]                  DATETIME        NULL,
    [Dt_Upd_On]                   DATETIME        NULL,
    CONSTRAINT [PK_T_Receipt_Type_Tax] PRIMARY KEY CLUSTERED ([I_Center_ReceiptType_Tax_ID] ASC),
    CONSTRAINT [FK_T_Receipt_Type_Tax_T_Centre_Master] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Receipt_Type_Tax_T_Tax_Master] FOREIGN KEY ([I_Tax_ID]) REFERENCES [dbo].[T_Tax_Master] ([I_Tax_ID])
);

