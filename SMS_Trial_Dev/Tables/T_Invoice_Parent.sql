CREATE TABLE [dbo].[T_Invoice_Parent] (
    [I_Invoice_Header_ID]   INT             IDENTITY (1, 1) NOT NULL,
    [S_Invoice_No]          VARCHAR (50)    NULL,
    [I_Student_Detail_ID]   INT             NULL,
    [I_Centre_Id]           INT             NULL,
    [N_Invoice_Amount]      NUMERIC (18, 2) NULL,
    [N_Discount_Amount]     NUMERIC (18, 2) NULL,
    [N_Tax_Amount]          NUMERIC (18, 2) NULL,
    [Dt_Invoice_Date]       DATETIME        NULL,
    [I_Status]              INT             NULL,
    [I_Discount_Scheme_ID]  INT             NULL,
    [I_Discount_Applied_At] INT             NULL,
    [S_Crtd_By]             VARCHAR (20)    NULL,
    [S_Upd_By]              VARCHAR (20)    NULL,
    [Dt_Crtd_On]            DATETIME        NULL,
    [Dt_Upd_On]             DATETIME        NULL,
    [I_Coupon_Discount]     INT             NULL,
    [I_Parent_Invoice_ID]   INT             NULL,
    [S_Cancel_Type]         VARCHAR (10)    NULL,
    [S_Narration]           VARCHAR (MAX)   NULL,
    [IsAdmissionInvoice]    BIT             NULL,
    [Is_NewGSTEnvironment]  BIT             NULL,
    [I_Currency_Id]         INT             NULL,
    CONSTRAINT [PK__T_Invoice_Parent__6BAFC5BE] PRIMARY KEY CLUSTERED ([I_Invoice_Header_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [index_Student_ID_Invoice_Parent]
    ON [dbo].[T_Invoice_Parent]([I_Student_Detail_ID] ASC);

