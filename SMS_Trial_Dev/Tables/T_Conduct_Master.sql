CREATE TABLE [dbo].[T_Conduct_Master] (
    [I_Conduct_Id]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Conduct_Code] VARCHAR (20) NULL,
    [S_Crtd_By]      VARCHAR (20) NULL,
    [S_Upd_By]       VARCHAR (20) NULL,
    [Dt_Crtd_On]     DATETIME     NULL,
    [Dt_Upd_On]      DATETIME     NULL,
    [I_Status]       INT          NULL,
    CONSTRAINT [PK_T_Conduct_Master] PRIMARY KEY CLUSTERED ([I_Conduct_Id] ASC)
);

