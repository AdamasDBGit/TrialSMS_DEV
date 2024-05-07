CREATE TABLE [dbo].[T_User_Sex] (
    [I_Sex_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Sex_Name] VARCHAR (50) NULL,
    [I_Status]   INT          NULL,
    [S_Crtd_By]  VARCHAR (50) NULL,
    [Dt_Crtd_On] DATETIME     NULL,
    [S_Updt_By]  VARCHAR (50) NULL,
    [Dt_Updt_On] DATETIME     NULL,
    CONSTRAINT [PK_T_User_Sex] PRIMARY KEY CLUSTERED ([I_Sex_ID] ASC)
);

