CREATE TABLE [dbo].[T_ERP_Fee_FineRangeDetails] (
    [I_FineRangeTagID]  INT             IDENTITY (1, 1) NOT NULL,
    [Dt_FineStartRange] DATE            NULL,
    [Dt_FineEndrange]   DATE            NULL,
    [N_FineAmount]      NUMERIC (12, 2) NULL,
    [Dtt_Created_At]    DATETIME        DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]   DATETIME        NULL,
    [I_Created_By]      INT             NULL,
    [I_Modified_By]     INT             NULL,
    [Is_Active]         BIT             DEFAULT ((1)) NULL,
    [S_Fine_Range_Code] VARCHAR (20)    NULL,
    PRIMARY KEY CLUSTERED ([I_FineRangeTagID] ASC)
);

