CREATE TABLE [dbo].[T_Transport_History] (
    [I_Transport_History_ID] INT             IDENTITY (1, 1) NOT NULL,
    [I_PickupPoint_ID]       INT             NOT NULL,
    [I_Brand_ID]             INT             NULL,
    [S_PickupPoint_Name]     VARCHAR (2000)  NULL,
    [N_Fees]                 NUMERIC (18, 2) NULL,
    [I_Status]               INT             NULL,
    [S_Crtd_By]              VARCHAR (50)    NULL,
    [Dt_Crtd_On]             DATETIME        NULL,
    [S_Updt_By]              VARCHAR (50)    NULL,
    [Dt_Updt_On]             DATETIME        NULL,
    [S_Academic_Session]     VARCHAR (20)    NULL,
    CONSTRAINT [PK_T_Transport_History] PRIMARY KEY CLUSTERED ([I_Transport_History_ID] ASC),
    CONSTRAINT [FK_T_Transport_History_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);

