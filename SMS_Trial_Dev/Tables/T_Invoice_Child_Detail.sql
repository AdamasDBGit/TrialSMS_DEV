CREATE TABLE [dbo].[T_Invoice_Child_Detail] (
    [I_Invoice_Detail_ID]            INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Fee_Component_ID]             INT             NULL,
    [I_Invoice_Child_Header_ID]      INT             NULL,
    [I_Installment_No]               INT             NULL,
    [Dt_Installment_Date]            DATETIME        NULL,
    [N_Amount_Due]                   NUMERIC (18, 2) NULL,
    [I_Display_Fee_Component_ID]     INT             NULL,
    [I_Sequence]                     INT             NULL,
    [N_Amount_Adv_Coln]              NUMERIC (18, 2) DEFAULT ((0)) NULL,
    [Flag_IsAdvanceTax]              VARCHAR (1)     DEFAULT ('N') NULL,
    [I_Receipt_Header_ID]            INT             NULL,
    [S_Invoice_Number]               VARCHAR (256)   NULL,
    [Tmp_AutoIdTag]                  INT             NULL,
    [N_Discount_Amount]              DECIMAL (14, 2) NULL,
    [N_Due]                          DECIMAL (14, 2) NULL,
    [I_Payment_Status]               INT             CONSTRAINT [DF_T_Invoice_Child_Detail_I_Payment_Status] DEFAULT ((0)) NULL,
    [N_CGST]                         NUMERIC (18, 2) NULL,
    [N_SGST]                         NUMERIC (18, 2) NULL,
    [N_IGST]                         NUMERIC (18, 2) NULL,
    [I_GST_FeeComponent_Catagory_ID] INT             NULL,
    CONSTRAINT [PK__T_Invoice_Child___67DF34DA] PRIMARY KEY CLUSTERED ([I_Invoice_Detail_ID] ASC),
    CONSTRAINT [FK__T_Invoice__I_Fee__24E8431A] FOREIGN KEY ([I_Fee_Component_ID]) REFERENCES [dbo].[T_Fee_Component_Master] ([I_Fee_Component_ID]),
    CONSTRAINT [FK__T_Invoice__I_Inv__23F41EE1] FOREIGN KEY ([I_Invoice_Child_Header_ID]) REFERENCES [dbo].[T_Invoice_Child_Header] ([I_Invoice_Child_Header_ID])
);


GO
CREATE NONCLUSTERED INDEX [index_Header_ID_Invoice_Detail]
    ON [dbo].[T_Invoice_Child_Detail]([I_Invoice_Child_Header_ID] ASC);

