CREATE TABLE [dbo].[T_Fee_Component_Type] (
    [I_Fee_Component_Type_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Fee_Component_Type_Name] VARCHAR (50) NULL,
    [I_Status]                  INT          NULL,
    [S_Crtd_By]                 VARCHAR (50) NULL,
    [Dt_Crtd_on]                DATETIME     NULL,
    [S_Updt_by]                 VARCHAR (50) NULL,
    [Dt_Updt_On]                DATETIME     NULL,
    CONSTRAINT [PK_T_Fee_Component_Type] PRIMARY KEY CLUSTERED ([I_Fee_Component_Type_ID] ASC)
);

