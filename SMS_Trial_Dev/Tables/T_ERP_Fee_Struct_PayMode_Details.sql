CREATE TABLE [dbo].[T_ERP_Fee_Struct_PayMode_Details] (
    [I_Inv_PaymentModeD_ID]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [R_I_Fee_Struct_Payment_ID] BIGINT        NULL,
    [R_I_PaymentMode_ID]        INT           NULL,
    [S_Tran_Ref_Number]         VARCHAR (255) NULL,
    [S_Bank_Name]               VARCHAR (20)  NULL,
    [S_IFSC_Code]               VARCHAR (20)  NULL,
    [S_Branch_Name]             VARCHAR (100) NULL,
    [S_MICR_Code]               VARCHAR (50)  NULL,
    [Is_Settlement]             BIT           DEFAULT ((0)) NULL,
    [Dt_Settlement_Dt]          DATE          NULL,
    [S_Settlement_Bank]         VARCHAR (100) NULL,
    [S_Settlement_Branch]       VARCHAR (50)  NULL,
    [Dtt_Created_At]            DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]           DATETIME      NULL,
    [I_Created_By]              INT           NULL,
    [I_Modified_By]             INT           NULL,
    [Is_Active]                 BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Inv_PaymentModeD_ID] ASC)
);

