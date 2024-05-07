CREATE TABLE [dbo].[T_Student_Status_Master] (
    [I_Student_Status_ID] INT          IDENTITY (1, 1) NOT NULL,
    [S_Student_Status]    VARCHAR (50) NULL,
    [I_Status]            INT          NULL,
    [Dt_Crtd_On]          DATETIME     NULL,
    [S_Crtd_By]           VARCHAR (50) NULL,
    [Dt_Upd_On]           DATETIME     NULL,
    [S_Upd_By]            VARCHAR (50) NULL
);

