CREATE TABLE [ERP].[T_Student_Transaction_Details] (
    [I_Student_Transaction_Detail_ID] INT             IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]                      INT             NOT NULL,
    [I_Transaction_Type_ID]           INT             NOT NULL,
    [I_Student_ID]                    INT             NULL,
    [I_Enquiry_Regn_ID]               INT             NULL,
    [S_Cost_Center]                   VARCHAR (50)    NOT NULL,
    [N_Amount]                        NUMERIC (24, 2) NOT NULL,
    [Transaction_Date]                DATETIME        NOT NULL,
    [Instrument_Number]               VARCHAR (50)    NULL,
    [Bank_Account_Name]               VARCHAR (50)    NULL,
    [Will_Restrict]                   BIT             NULL,
    CONSTRAINT [PK_T_Student_Transaction_Details] PRIMARY KEY CLUSTERED ([I_Student_Transaction_Detail_ID] ASC),
    CONSTRAINT [FK_T_Student_Transaction_Details_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Student_Transaction_Details_T_Student_Detail] FOREIGN KEY ([I_Student_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Student_Transaction_Details_T_Student_Transaction_Details] FOREIGN KEY ([I_Transaction_Type_ID]) REFERENCES [ERP].[T_Transaction_Type_Master] ([I_Transaction_Type_ID]),
    CONSTRAINT [FK_T_Student_Transaction_Details_T_Transaction_Type_Master] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID])
);


GO
ALTER TABLE [ERP].[T_Student_Transaction_Details] NOCHECK CONSTRAINT [FK_T_Student_Transaction_Details_T_Brand_Master];


GO
ALTER TABLE [ERP].[T_Student_Transaction_Details] NOCHECK CONSTRAINT [FK_T_Student_Transaction_Details_T_Student_Detail];


GO
ALTER TABLE [ERP].[T_Student_Transaction_Details] NOCHECK CONSTRAINT [FK_T_Student_Transaction_Details_T_Student_Transaction_Details];


GO
ALTER TABLE [ERP].[T_Student_Transaction_Details] NOCHECK CONSTRAINT [FK_T_Student_Transaction_Details_T_Transaction_Type_Master];



