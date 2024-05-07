CREATE TABLE [CORPORATE].[T_CorporateInvoice_StudentInvoice_Map] (
    [I_Corporate_Invoice_Id] INT NOT NULL,
    [I_Invoice_Header_ID]    INT NULL,
    CONSTRAINT [FK_T_CorporateInvoice_StudentInvoice_Map_T_Corporate_Invoice] FOREIGN KEY ([I_Corporate_Invoice_Id]) REFERENCES [CORPORATE].[T_Corporate_Invoice] ([I_Corporate_Invoice_Id]),
    CONSTRAINT [FK_T_CorporateInvoice_StudentInvoice_Map_T_Invoice_Parent] FOREIGN KEY ([I_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID])
);

