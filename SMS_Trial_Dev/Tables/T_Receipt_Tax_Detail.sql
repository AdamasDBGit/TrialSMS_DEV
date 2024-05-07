CREATE TABLE [dbo].[T_Receipt_Tax_Detail] (
    [I_Receipt_Comp_Detail_ID] INT             NOT NULL,
    [I_Tax_ID]                 INT             NOT NULL,
    [I_Invoice_Detail_ID]      INT             NOT NULL,
    [N_Tax_Paid]               NUMERIC (18, 2) NULL,
    [N_Tax_Rff]                NUMERIC (18, 2) NULL,
    CONSTRAINT [PK__T_Receipt_Tax_De__3BC0BB7A] PRIMARY KEY CLUSTERED ([I_Receipt_Comp_Detail_ID] ASC, [I_Tax_ID] ASC, [I_Invoice_Detail_ID] ASC),
    CONSTRAINT [FK__T_Receipt__I_Rec__1976906E] FOREIGN KEY ([I_Receipt_Comp_Detail_ID]) REFERENCES [dbo].[T_Receipt_Component_Detail] ([I_Receipt_Comp_Detail_ID])
);

