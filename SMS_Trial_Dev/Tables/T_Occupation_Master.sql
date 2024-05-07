CREATE TABLE [dbo].[T_Occupation_Master] (
    [I_Occupation_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Occupation_Name] VARCHAR (50) NULL,
    [I_Status]          INT          NULL,
    [S_Crtd_By]         VARCHAR (20) NULL,
    [S_Upd_By]          VARCHAR (20) NULL,
    [Dt_Crtd_On]        DATETIME     NULL,
    [Dt_Upd_On]         DATETIME     NULL,
    CONSTRAINT [PK__T_Occupation_Mas__525A080F] PRIMARY KEY CLUSTERED ([I_Occupation_ID] ASC)
);

