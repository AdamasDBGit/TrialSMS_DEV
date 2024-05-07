CREATE TABLE [dbo].[T_PaymentMode_Master] (
    [I_PaymentMode_ID]   INT          NOT NULL,
    [S_PaymentMode_Name] VARCHAR (50) NULL,
    [I_Status]           INT          NULL,
    [S_Crtd_By]          VARCHAR (20) NULL,
    [S_Uptd_By]          VARCHAR (20) NULL,
    [Dt_Crtd_On]         DATETIME     NULL,
    [Dt_Uptd_By]         DATETIME     NULL,
    [I_Brand_ID]         INT          NULL,
    CONSTRAINT [PK__T_PaymentMode_Ma__62906FD8] PRIMARY KEY CLUSTERED ([I_PaymentMode_ID] ASC),
    CONSTRAINT [FK_T_PaymentMode_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);

