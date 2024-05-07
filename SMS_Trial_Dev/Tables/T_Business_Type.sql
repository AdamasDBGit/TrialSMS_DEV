CREATE TABLE [dbo].[T_Business_Type] (
    [I_Business_Type_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Business_Type]    VARCHAR (500) NULL,
    [I_Status]           INT           NULL,
    [S_Crtd_By]          VARCHAR (50)  NULL,
    [Dt_Crtd_On]         DATETIME      NULL,
    [S_Updt_By]          VARCHAR (50)  NULL,
    [Dt_Updt_On]         DATETIME      NULL,
    CONSTRAINT [PK_T_Business_Type] PRIMARY KEY CLUSTERED ([I_Business_Type_ID] ASC)
);

