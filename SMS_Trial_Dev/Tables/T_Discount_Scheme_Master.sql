CREATE TABLE [dbo].[T_Discount_Scheme_Master] (
    [I_Discount_Scheme_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_Discount_Scheme_Name] VARCHAR (250) NULL,
    [Dt_Valid_From]          DATETIME      NULL,
    [Dt_Valid_To]            DATETIME      NULL,
    [I_Status]               INT           NULL,
    [S_Crtd_By]              VARCHAR (20)  NULL,
    [S_Upd_By]               VARCHAR (20)  NULL,
    [Dt_Crtd_On]             DATETIME      NULL,
    [Dt_Upd_On]              DATETIME      NULL
);

