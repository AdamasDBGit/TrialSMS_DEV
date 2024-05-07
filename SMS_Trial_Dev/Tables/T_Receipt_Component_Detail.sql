CREATE TABLE [dbo].[T_Receipt_Component_Detail] (
    [I_Receipt_Comp_Detail_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Invoice_Detail_ID]      INT             NULL,
    [I_Receipt_Detail_ID]      INT             NULL,
    [N_Amount_Paid]            NUMERIC (18, 2) NULL,
    [N_Comp_Amount_Rff]        NUMERIC (18, 2) NULL,
    [N_CGST]                   NUMERIC (18, 2) NULL,
    [N_SGST]                   NUMERIC (18, 2) NULL,
    [N_IGST]                   NUMERIC (18, 2) NULL,
    CONSTRAINT [PK__T_Receipt_Compon__5E55CAA0] PRIMARY KEY CLUSTERED ([I_Receipt_Comp_Detail_ID] ASC),
    CONSTRAINT [FK__T_Receipt__I_Inv__1B5ED8E0] FOREIGN KEY ([I_Invoice_Detail_ID]) REFERENCES [dbo].[T_Invoice_Child_Detail] ([I_Invoice_Detail_ID]),
    CONSTRAINT [FK__T_Receipt__I_Rec__1A6AB4A7] FOREIGN KEY ([I_Receipt_Detail_ID]) REFERENCES [dbo].[T_Receipt_Header] ([I_Receipt_Header_ID])
);


GO
CREATE NONCLUSTERED INDEX [NCI_I_Invoice_Detail_ID]
    ON [dbo].[T_Receipt_Component_Detail]([I_Invoice_Detail_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [NCI_I_Receipt_Detail_ID]
    ON [dbo].[T_Receipt_Component_Detail]([I_Receipt_Detail_ID] ASC);

