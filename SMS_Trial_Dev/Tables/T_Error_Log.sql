CREATE TABLE [dbo].[T_Error_Log] (
    [I_Error_ID]          INT          IDENTITY (1, 1) NOT NULL,
    [S_Error_Number]      VARCHAR (50) NULL,
    [S_Login_ID]          VARCHAR (50) NULL,
    [S_Error_Description] TEXT         NULL,
    [Dt_Crtd_On]          DATETIME     NULL
);

