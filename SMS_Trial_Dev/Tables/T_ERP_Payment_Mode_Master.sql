CREATE TABLE [dbo].[T_ERP_Payment_Mode_Master] (
    [I_PaymentMode_ID]  INT          IDENTITY (1, 1) NOT NULL,
    [S_PaymentTypeName] VARCHAR (20) NULL,
    [Dtt_Created_At]    DATETIME     DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]   DATETIME     NULL,
    [I_Created_By]      INT          NULL,
    [I_Modified_By]     INT          NULL,
    [Is_Active]         BIT          DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_PaymentMode_ID] ASC)
);

