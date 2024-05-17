CREATE TABLE [dbo].[T_Tax_Country_Fee_Component] (
    [I_Country_FeeComponent_Tax_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Tax_ID]                      INT             NULL,
    [I_Country_ID]                  INT             NULL,
    [I_Fee_Component_ID]            INT             NULL,
    [N_Tax_Rate]                    NUMERIC (10, 6) NULL,
    [Dt_Valid_From]                 DATETIME        NULL,
    [Dt_Valid_To]                   DATETIME        NULL,
    [I_Status]                      INT             NULL,
    [S_Crtd_By]                     VARCHAR (20)    NULL,
    [S_Upd_By]                      VARCHAR (20)    NULL,
    [Dt_Crtd_On]                    DATETIME        NULL,
    [Dt_Upd_On]                     DATETIME        NULL,
    CONSTRAINT [PK_T_Tax_Country_Fee_Component] PRIMARY KEY CLUSTERED ([I_Country_FeeComponent_Tax_ID] ASC),
    CONSTRAINT [FK_T_Tax_Country_Fee_Component_T_Country_Master] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK_T_Tax_Country_Fee_Component_T_Fee_Component_Master] FOREIGN KEY ([I_Fee_Component_ID]) REFERENCES [dbo].[T_Fee_Component_Master] ([I_Fee_Component_ID]),
    CONSTRAINT [FK_T_Tax_Country_Fee_Component_T_Tax_Master] FOREIGN KEY ([I_Tax_ID]) REFERENCES [dbo].[T_Tax_Master] ([I_Tax_ID])
);


GO
ALTER TABLE [dbo].[T_Tax_Country_Fee_Component] NOCHECK CONSTRAINT [FK_T_Tax_Country_Fee_Component_T_Fee_Component_Master];



