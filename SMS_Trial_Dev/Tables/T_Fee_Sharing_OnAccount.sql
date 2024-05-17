CREATE TABLE [dbo].[T_Fee_Sharing_OnAccount] (
    [I_Fee_Sharing_OnAccount_ID] INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]                 INT            NULL,
    [I_Country_ID]               INT            NULL,
    [I_Center_ID]                INT            NULL,
    [I_Receipt_Type]             INT            NULL,
    [N_Company_Share]            NUMERIC (8, 4) NULL,
    [Dt_Period_Start]            DATETIME       NULL,
    [Dt_Period_End]              DATETIME       NULL,
    [I_Status]                   INT            NULL,
    [S_Crtd_By]                  VARCHAR (20)   NULL,
    [S_Upd_By]                   VARCHAR (20)   NULL,
    [Dt_Crtd_On]                 DATETIME       NULL,
    [Dt_Upd_On]                  DATETIME       NULL,
    CONSTRAINT [PK_T_Fee_Sharing_OnAccount] PRIMARY KEY CLUSTERED ([I_Fee_Sharing_OnAccount_ID] ASC),
    CONSTRAINT [FK_T_Fee_Sharing_OnAccount_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Fee_Sharing_OnAccount_T_Centre_Master] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Fee_Sharing_OnAccount_T_Country_Master] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID])
);


GO
ALTER TABLE [dbo].[T_Fee_Sharing_OnAccount] NOCHECK CONSTRAINT [FK_T_Fee_Sharing_OnAccount_T_Brand_Master];



