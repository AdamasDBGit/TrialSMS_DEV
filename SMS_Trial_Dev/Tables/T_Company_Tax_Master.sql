CREATE TABLE [dbo].[T_Company_Tax_Master] (
    [I_Company_Tax_Master_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]              INT          NULL,
    [I_Country_ID]            INT          NULL,
    [S_Tax_Name]              VARCHAR (50) NULL,
    [S_Tax_Desc]              VARCHAR (50) NULL,
    [I_Status]                INT          NULL,
    [S_Crtd_By]               VARCHAR (20) NULL,
    [Dt_Crtd_On]              DATETIME     NULL,
    [S_Upd_By]                VARCHAR (20) NULL,
    [Dt_Upd_On]               DATETIME     NULL,
    CONSTRAINT [PK_T_Company_Tax_Master] PRIMARY KEY CLUSTERED ([I_Company_Tax_Master_ID] ASC),
    CONSTRAINT [FK_T_Company_Tax_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Company_Tax_Master_T_Country_Master] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID])
);


GO
ALTER TABLE [dbo].[T_Company_Tax_Master] NOCHECK CONSTRAINT [FK_T_Company_Tax_Master_T_Brand_Master];



