CREATE TABLE [CORPORATE].[T_CorporateReceipt_StudentReceipt_Map] (
    [I_Corporate_Receipt_Id] INT NULL,
    [I_Receipt_Header_ID]    INT NULL,
    CONSTRAINT [FK_T_CorporateReceipt_StudentReceipt_Map_T_Corporate_Receipt] FOREIGN KEY ([I_Corporate_Receipt_Id]) REFERENCES [CORPORATE].[T_Corporate_Receipt] ([I_Corporate_Receipt_Id])
);

