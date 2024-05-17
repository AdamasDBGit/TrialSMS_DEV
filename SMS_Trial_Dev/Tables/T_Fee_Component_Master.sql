CREATE TABLE [dbo].[T_Fee_Component_Master] (
    [I_Fee_Component_ID]        INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Component_Code]          VARCHAR (20)  NULL,
    [S_Component_Name]          VARCHAR (50)  NULL,
    [I_Status]                  INT           NULL,
    [S_Crtd_By]                 VARCHAR (20)  NULL,
    [S_Upd_By]                  VARCHAR (20)  NULL,
    [Dt_Crtd_On]                DATETIME      NULL,
    [Dt_Upd_On]                 DATETIME      NULL,
    [Is_Discount_Applicable]    INT           NULL,
    [Is_Invoice_Receipt]        INT           NULL,
    [I_Fee_Component_Type_ID]   INT           NULL,
    [I_Brand_ID]                INT           NULL,
    [S_FeeComponentForSMS]      VARCHAR (100) NULL,
    [S_Type_Of_Component]       VARCHAR (10)  NULL,
    [Is_individual]             BIT           NULL,
    [I_Extracomponent_Ref_Type] INT           NULL,
    [Is_GST_Applicable]         BIT           NULL,
    CONSTRAINT [PK__T_Fee_Component___0C86A9A4] PRIMARY KEY CLUSTERED ([I_Fee_Component_ID] ASC),
    CONSTRAINT [FK_T_Fee_Component_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Fee_Component_Master_T_Fee_Component_Type] FOREIGN KEY ([I_Fee_Component_Type_ID]) REFERENCES [dbo].[T_Fee_Component_Type] ([I_Fee_Component_Type_ID])
);


GO
ALTER TABLE [dbo].[T_Fee_Component_Master] NOCHECK CONSTRAINT [FK_T_Fee_Component_Master_T_Brand_Master];



