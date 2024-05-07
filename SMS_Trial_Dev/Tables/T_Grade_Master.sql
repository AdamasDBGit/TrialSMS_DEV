CREATE TABLE [dbo].[T_Grade_Master] (
    [I_Grade_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Grade_Name] VARCHAR (50) NULL,
    [I_Grade_Code] INT          NULL,
    [I_Status]     INT          NULL,
    [S_Crtd_By]    VARCHAR (20) NULL,
    [S_Upd_By]     VARCHAR (20) NULL,
    [Dt_Crtd_On]   DATETIME     NULL,
    [Dt_Upd_On]    DATETIME     NULL,
    CONSTRAINT [PK_dbo.T_Grade_Master] PRIMARY KEY CLUSTERED ([I_Grade_ID] ASC)
);

