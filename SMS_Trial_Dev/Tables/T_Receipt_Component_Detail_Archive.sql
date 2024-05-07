CREATE TABLE [dbo].[T_Receipt_Component_Detail_Archive] (
    [I_Receipt_Comp_Detail_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Invoice_Detail_ID]      INT             NULL,
    [I_Receipt_Detail_ID]      INT             NULL,
    [N_Amount_Paid]            NUMERIC (18, 2) NULL,
    [N_Comp_Amount_Rff]        NUMERIC (18, 2) NULL,
    CONSTRAINT [PK_T_Receipt_Component_Detail_Archive] PRIMARY KEY CLUSTERED ([I_Receipt_Comp_Detail_ID] ASC),
    CONSTRAINT [FK_T_Receipt_Component_Detail_Archive_T_Invoice_Child_Detail] FOREIGN KEY ([I_Invoice_Detail_ID]) REFERENCES [dbo].[T_Invoice_Child_Detail] ([I_Invoice_Detail_ID]),
    CONSTRAINT [FK_T_Receipt_Component_Detail_Archive_T_Receipt_Header_Archive] FOREIGN KEY ([I_Receipt_Detail_ID]) REFERENCES [dbo].[T_Receipt_Header_Archive] ([I_Receipt_Header_ID])
);

