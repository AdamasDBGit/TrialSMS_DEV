CREATE TABLE [dbo].[T_Center_Configuration] (
    [I_Config_ID]    INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Center_Id]    INT          NULL,
    [S_Config_Code]  VARCHAR (50) NOT NULL,
    [S_Config_Value] VARCHAR (50) NOT NULL,
    [I_Status]       INT          NOT NULL,
    [Dt_Valid_From]  DATETIME     NOT NULL,
    [Dt_Valid_To]    DATETIME     NULL,
    [S_Crtd_By]      VARCHAR (20) NOT NULL,
    [S_Upd_by]       VARCHAR (20) NULL,
    [Dt_Crtd_On]     DATETIME     NOT NULL,
    [Dt_Upd_On]      DATETIME     NULL,
    [I_Brand_ID]     INT          NULL,
    CONSTRAINT [PK__T_Center_Configu__3BEBA403] PRIMARY KEY CLUSTERED ([I_Config_ID] ASC),
    CONSTRAINT [FK__T_Center___I_Cen__3CDFC83C] FOREIGN KEY ([I_Center_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

