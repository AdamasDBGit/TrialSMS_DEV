CREATE TABLE [CORPORATE].[T_Corporate_Invoice_Receipt_Map] (
    [I_Corporate_Invoice_Id] INT NOT NULL,
    [I_Receipt_Header_ID]    INT NOT NULL,
    CONSTRAINT [FK_T_Corporate_Invoice_Receipt_T_Corporate_Invoice] FOREIGN KEY ([I_Corporate_Invoice_Id]) REFERENCES [CORPORATE].[T_Corporate_Invoice] ([I_Corporate_Invoice_Id]),
    CONSTRAINT [FK_T_Corporate_Invoice_Receipt_T_Receipt_Header] FOREIGN KEY ([I_Receipt_Header_ID]) REFERENCES [dbo].[T_Receipt_Header] ([I_Receipt_Header_ID])
);

