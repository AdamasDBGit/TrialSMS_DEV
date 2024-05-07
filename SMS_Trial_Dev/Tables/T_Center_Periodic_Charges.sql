CREATE TABLE [NETWORK].[T_Center_Periodic_Charges] (
    [I_Center_Periodic_Charges_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Centre_Id]                  INT             NULL,
    [I_Payment_Charges_ID]         INT             NULL,
    [Dt_From_Date]                 DATETIME        NULL,
    [Dt_To_Date]                   DATETIME        NULL,
    [Dt_Due_Date]                  DATETIME        NULL,
    [I_Total_Amount]               DECIMAL (18, 2) NULL,
    [I_Transfer_To_SAP]            BIT             NULL,
    [I_Status]                     INT             NULL,
    [S_Crtd_By]                    VARCHAR (20)    NULL,
    [S_Upd_By]                     VARCHAR (20)    NULL,
    [Dt_Crtd_On]                   DATETIME        NULL,
    [Dt_Upd_On]                    DATETIME        NULL,
    [I_Currency_ID]                INT             NULL,
    CONSTRAINT [PK__T_Center_Periodi__3EA8151D] PRIMARY KEY CLUSTERED ([I_Center_Periodic_Charges_ID] ASC),
    CONSTRAINT [FK__T_Center___I_Cen__043C47BD] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Center_Periodic_Charges_T_Currency_Master] FOREIGN KEY ([I_Currency_ID]) REFERENCES [dbo].[T_Currency_Master] ([I_Currency_ID])
);

