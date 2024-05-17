CREATE TABLE [dbo].[T_Invoice_Detail_Tax] (
    [I_Tax_ID]              INT             NOT NULL,
    [I_Invoice_Detail_ID]   INT             NOT NULL,
    [N_Tax_Value]           NUMERIC (18, 2) NULL,
    [N_Tax_Value_Scheduled] NUMERIC (18, 2) DEFAULT ((0)) NULL,
    [N_Tax_Value_Tmp]       NUMERIC (18, 2) CONSTRAINT [DF__T_Invoice__N_Tax__26CCC4A3] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__T_Invoice_Detail__65F6EC68] PRIMARY KEY CLUSTERED ([I_Tax_ID] ASC, [I_Invoice_Detail_ID] ASC),
    CONSTRAINT [FK__T_Invoice__I_Tax__22FFFAA8] FOREIGN KEY ([I_Tax_ID]) REFERENCES [dbo].[T_Tax_Master] ([I_Tax_ID])
);



