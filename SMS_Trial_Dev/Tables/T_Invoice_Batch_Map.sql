CREATE TABLE [dbo].[T_Invoice_Batch_Map] (
    [I_Invoice_Child_Header_ID] INT          NOT NULL,
    [I_Batch_ID]                INT          NOT NULL,
    [I_Status]                  INT          NULL,
    [S_Crtd_By]                 VARCHAR (20) NULL,
    [S_Updt_By]                 VARCHAR (20) NULL,
    [Dt_Crtd_On]                DATETIME     NULL,
    [Dt_Updt_On]                DATETIME     NULL,
    CONSTRAINT [PK_T_Invoice_Batch_Map] PRIMARY KEY CLUSTERED ([I_Invoice_Child_Header_ID] ASC, [I_Batch_ID] ASC),
    CONSTRAINT [FK_T_Invoice_Batch_Map_T_Invoice_Batch_Map] FOREIGN KEY ([I_Invoice_Child_Header_ID]) REFERENCES [dbo].[T_Invoice_Child_Header] ([I_Invoice_Child_Header_ID]),
    CONSTRAINT [FK_T_Invoice_Batch_Map_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);


GO
ALTER TABLE [dbo].[T_Invoice_Batch_Map] NOCHECK CONSTRAINT [FK_T_Invoice_Batch_Map_T_Student_Batch_Master];



