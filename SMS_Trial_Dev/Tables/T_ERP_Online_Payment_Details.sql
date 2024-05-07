CREATE TABLE [dbo].[T_ERP_Online_Payment_Details] (
    [I_OnlineTrackingID]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [R_I_PaymentID]          INT           NULL,
    [S_Type]                 VARCHAR (10)  NULL,
    [S_Transaction_Ref_No]   VARCHAR (255) NULL,
    [S_External_Source_Name] VARCHAR (255) NULL,
    [S_Bank_Name]            VARCHAR (255) NULL,
    [Dtt_Created_At]         DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]        DATETIME      NULL,
    [I_Created_By]           INT           NULL,
    [I_Modified_By]          INT           NULL,
    [Is_Active]              BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_OnlineTrackingID] ASC)
);

