CREATE TABLE [dbo].[T_Aim] (
    [I_Aim_ID]          INT           IDENTITY (1, 1) NOT NULL,
    [S_Aim_Description] VARCHAR (MAX) NULL,
    [I_Status]          INT           NULL,
    [S_Crtd_By]         VARCHAR (MAX) NULL,
    [S_Upd_By]          VARCHAR (MAX) NULL,
    [Dt_Crtd_On]        DATETIME      NULL,
    [Dt_Upd_On]         DATETIME      NULL,
    [I_Brand_ID]        INT           NULL
);

