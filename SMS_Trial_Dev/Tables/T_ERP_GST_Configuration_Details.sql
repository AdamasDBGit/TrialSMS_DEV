CREATE TABLE [dbo].[T_ERP_GST_Configuration_Details] (
    [I_GST_Configuration_ID]         INT             IDENTITY (1, 1) NOT NULL,
    [I_GST_FeeComponent_Catagory_ID] INT             NOT NULL,
    [N_Start_Amount]                 NUMERIC (18, 2) NULL,
    [N_End_Amount]                   NUMERIC (18, 2) NULL,
    [N_SGST]                         NUMERIC (18, 2) NULL,
    [N_CGST]                         NUMERIC (18, 2) NULL,
    [N_IGST]                         NUMERIC (18, 2) NULL,
    [Is_Active]                      BIT             NULL,
    [I_Created_By]                   INT             NULL,
    [Dt_Created_At]                  DATETIME        NULL,
    [I_Updated_By]                   INT             NULL,
    [Dt_Updated_At]                  DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([I_GST_Configuration_ID] ASC)
);

