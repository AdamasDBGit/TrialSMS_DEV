CREATE TABLE [dbo].[T_Currency_Rate] (
    [I_Currency_Rate_ID]      INT             IDENTITY (1, 1) NOT NULL,
    [I_Currency_ID]           INT             NULL,
    [Dt_Effective_Start_Date] DATETIME        NULL,
    [N_Conversion_Rate]       NUMERIC (18, 2) NULL,
    [Dt_Effective_End_Date]   DATETIME        NULL,
    [I_Status]                INT             NULL,
    [Dt_Crtd_On]              DATETIME        NULL,
    [Dt_Upd_On]               DATETIME        NULL,
    [S_Crtd_By]               VARCHAR (20)    NULL,
    [S_Upd_By]                VARCHAR (20)    NULL,
    CONSTRAINT [PK__T_Currency_Rate__7350E786] PRIMARY KEY CLUSTERED ([I_Currency_Rate_ID] ASC),
    CONSTRAINT [FK__T_Currenc__I_Cur__18D771F0] FOREIGN KEY ([I_Currency_ID]) REFERENCES [dbo].[T_Currency_Master] ([I_Currency_ID])
);

