CREATE TABLE [dbo].[T_Qualification_Type_Master] (
    [I_Qualification_Type_ID] INT          IDENTITY (1, 1) NOT NULL,
    [S_Qualification_Type]    VARCHAR (50) NULL,
    [S_Crtd_By]               VARCHAR (20) NULL,
    [I_Status]                INT          NULL,
    [S_Upd_By]                VARCHAR (20) NULL,
    [Dt_Crtd_On]              DATETIME     NULL,
    [Dt_Upd_On]               DATETIME     NULL,
    CONSTRAINT [PK__T_Qualification___1CC7330E] PRIMARY KEY CLUSTERED ([I_Qualification_Type_ID] ASC)
);

