CREATE TABLE [dbo].[T_Corp_Student_Invoice_Map] (
    [I_Corp_Student_Invoice_Map] INT IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID]        INT NULL,
    [I_Invoice_Header_ID]        INT NULL,
    [I_Status]                   INT NULL,
    [I_Center_Corp_Plan_ID]      INT NULL,
    CONSTRAINT [PK_T_Corp_Student_Invoice_Map] PRIMARY KEY CLUSTERED ([I_Corp_Student_Invoice_Map] ASC),
    CONSTRAINT [FK_T_Corp_Student_Invoice_Map_T_Invoice_Parent] FOREIGN KEY ([I_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK_T_Corp_Student_Invoice_Map_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);

