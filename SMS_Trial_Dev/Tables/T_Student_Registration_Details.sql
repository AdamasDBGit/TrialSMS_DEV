CREATE TABLE [dbo].[T_Student_Registration_Details] (
    [I_Registration_ID]       INT             IDENTITY (1, 1) NOT NULL,
    [I_Enquiry_Regn_ID]       INT             NULL,
    [I_Batch_ID]              INT             NULL,
    [I_Origin_Center_Id]      INT             NULL,
    [I_Receipt_Header_ID]     INT             NULL,
    [I_Status]                INT             NULL,
    [Crtd_By]                 VARCHAR (50)    NULL,
    [Crtd_On]                 DATETIME        NULL,
    [Updt_By]                 VARCHAR (50)    NULL,
    [Updt_On]                 DATETIME        NULL,
    [I_Destination_Center_ID] INT             NULL,
    [I_Fee_Plan_ID]           INT             NULL,
    [N_Referral_Amount]       DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_T_Student_Registration_Details] PRIMARY KEY CLUSTERED ([I_Registration_ID] ASC),
    CONSTRAINT [FK_T_Student_Registration_Details_T_Centre_Master] FOREIGN KEY ([I_Origin_Center_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Student_Registration_Details_T_Enquiry_Regn_Detail] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Student_Registration_Details_T_Receipt_Header] FOREIGN KEY ([I_Receipt_Header_ID]) REFERENCES [dbo].[T_Receipt_Header] ([I_Receipt_Header_ID]),
    CONSTRAINT [FK_T_Student_Registration_Details_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);


GO
ALTER TABLE [dbo].[T_Student_Registration_Details] NOCHECK CONSTRAINT [FK_T_Student_Registration_Details_T_Student_Batch_Master];



