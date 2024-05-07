CREATE TABLE [dbo].[T_Caste_Master] (
    [I_Caste_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Caste_Name] VARCHAR (50) NULL,
    [I_Status]     INT          NULL,
    [S_Crtd_By]    VARCHAR (20) NULL,
    [S_Upd_By]     VARCHAR (20) NULL,
    [Dt_Crtd_On]   DATETIME     NULL,
    [Dt_Upd_On]    DATETIME     NULL,
    CONSTRAINT [PK_T_Caste_Master] PRIMARY KEY CLUSTERED ([I_Caste_ID] ASC)
);

