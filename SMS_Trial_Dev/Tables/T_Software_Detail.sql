CREATE TABLE [NETWORK].[T_Software_Detail] (
    [I_Software_Detail_ID] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Software_ID]        INT           NULL,
    [I_Centre_Id]          INT           NULL,
    [S_Act_Version]        VARCHAR (200) NULL,
    [S_Act_License_No]     VARCHAR (50)  NULL,
    [S_Crtd_By]            VARCHAR (20)  NULL,
    [S_Upd_By]             VARCHAR (20)  NULL,
    [Dt_Crtd_On]           DATETIME      NULL,
    [Dt_Upd_On]            DATETIME      NULL,
    [I_Status]             INT           NULL,
    CONSTRAINT [PK__T_Software_Detai__6B7099F3] PRIMARY KEY CLUSTERED ([I_Software_Detail_ID] ASC),
    CONSTRAINT [FK__T_Softwar__I_Cen__0AE9454C] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Softwar__I_Sof__0BDD6985] FOREIGN KEY ([I_Software_ID]) REFERENCES [NETWORK].[T_Software_Master] ([I_Software_ID])
);

