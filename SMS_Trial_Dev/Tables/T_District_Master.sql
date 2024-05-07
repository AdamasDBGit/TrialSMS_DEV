CREATE TABLE [dbo].[T_District_Master] (
    [I_District_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_District_Code] VARCHAR (10) NULL,
    [S_District_Name] VARCHAR (50) NULL,
    [I_Country_ID]    INT          NULL,
    [I_State_ID]      INT          NULL,
    [I_Status]        INT          NULL,
    [S_Crtd_By]       VARCHAR (20) NULL,
    [S_Upd_By]        VARCHAR (20) NULL,
    [Dt_Crtd_On]      DATETIME     NULL,
    [Dt_Upd_On]       DATETIME     NULL,
    CONSTRAINT [PK_T_District_Master] PRIMARY KEY CLUSTERED ([I_District_ID] ASC)
);

