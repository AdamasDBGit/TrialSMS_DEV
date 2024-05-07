CREATE TABLE [dbo].[T_Registration_Batch] (
    [I_Registration_Batch_ID] INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Enquiry_Regn_ID]       INT NULL,
    [I_Batch_ID]              INT NULL,
    [B_IsEnrolled]            BIT NULL,
    CONSTRAINT [PK_T_Registration_Batch] PRIMARY KEY CLUSTERED ([I_Registration_Batch_ID] ASC),
    CONSTRAINT [FK_T_Registration_Batch_T_Enquiry_Regn_Detail] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Registration_Batch_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);

