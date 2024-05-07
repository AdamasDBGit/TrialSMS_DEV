CREATE TABLE [dbo].[T_Center_Category_Master] (
    [I_Center_Category_ID]   INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Center_Category_Name] VARCHAR (50) NULL,
    [I_Status]               INT          NULL,
    [S_Crtd_By]              VARCHAR (20) NULL,
    [S_Upd_By]               VARCHAR (20) NULL,
    [Dt_Crtd_On]             DATETIME     NULL,
    [Dt_Upd_On]              DATETIME     NULL,
    CONSTRAINT [PK_T_Center_Category_Master] PRIMARY KEY CLUSTERED ([I_Center_Category_ID] ASC)
);

