﻿CREATE TABLE [NETWORK].[T_Center_Payment_Details] (
    [I_Center_Payment_Details_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Centre_Id]                 INT             NULL,
    [I_Payment_Charges_ID]        INT             NULL,
    [I_PaymentMode_ID]            INT             NULL,
    [Dt_Cheque_Date]              DATETIME        NULL,
    [Dt_Payment_Date]             DATETIME        NULL,
    [S_Cheque_Number]             VARCHAR (20)    NULL,
    [S_Bank_Name]                 VARCHAR (100)   NULL,
    [S_CreditCard_No]             VARCHAR (20)    NULL,
    [S_Credit_Card_Issuer]        VARCHAR (100)   NULL,
    [I_Status]                    INT             NOT NULL,
    [S_Credit_Card_Expiry]        VARCHAR (20)    NULL,
    [D_Total_Amount]              DECIMAL (18, 2) NULL,
    [I_Transfer_To_SAP]           BIT             NULL,
    [S_Remarks]                   VARCHAR (200)   NULL,
    [S_Reason]                    VARCHAR (1000)  NULL,
    [I_Payment_Type]              INT             NULL,
    [S_Crtd_By]                   VARCHAR (20)    NULL,
    [S_Upd_By]                    VARCHAR (20)    NULL,
    [Dt_Crtd_On]                  DATETIME        NULL,
    [Dt_Upd_On]                   DATETIME        NULL,
    CONSTRAINT [PK__T_Center_Payment__5C2E5663] PRIMARY KEY CLUSTERED ([I_Center_Payment_Details_ID] ASC),
    CONSTRAINT [FK__T_Center___I_Cen__0253FF4B] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Center___I_Pay__015FDB12] FOREIGN KEY ([I_PaymentMode_ID]) REFERENCES [dbo].[T_PaymentMode_Master] ([I_PaymentMode_ID])
);

