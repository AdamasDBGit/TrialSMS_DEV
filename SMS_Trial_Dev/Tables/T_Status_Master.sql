CREATE TABLE [dbo].[T_Status_Master] (
    [I_Status_Id]        INT             IDENTITY (1, 1) NOT NULL,
    [S_Status_Type]      VARCHAR (20)    NULL,
    [S_Status_Desc]      VARCHAR (100)   NULL,
    [I_Status_Value]     INT             NULL,
    [I_Brand_ID]         INT             NULL,
    [S_Status_Desc_SMS]  VARCHAR (MAX)   NULL,
    [S_Invoice_Required] CHAR (1)        NULL,
    [N_Amount]           NUMERIC (18, 2) NULL,
    [FormShell_Status]   INT             NULL,
    [I_ConFig_ID]        INT             NULL,
    CONSTRAINT [PK_T_Status_Master] PRIMARY KEY CLUSTERED ([I_Status_Id] ASC),
    CONSTRAINT [FK_T_Status_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [dbo].[T_Status_Master] NOCHECK CONSTRAINT [FK_T_Status_Master_T_Brand_Master];



