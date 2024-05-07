﻿CREATE TABLE [dbo].[T_Invoice_Number_For_Advance_Temp] (
    [ID]                  INT           IDENTITY (1, 1) NOT NULL,
    [I_Invoice_Detail_ID] INT           NULL,
    [I_Installment_No]    INT           NULL,
    [S_Invoice_Type]      VARCHAR (10)  NULL,
    [S_Invoice_No]        VARCHAR (100) NULL,
    [I_Receipt_Header_ID] INT           NULL,
    CONSTRAINT [PK_T_Invoice_Number_For_Advance_Temp] PRIMARY KEY CLUSTERED ([ID] ASC)
);

