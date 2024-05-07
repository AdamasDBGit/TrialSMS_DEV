CREATE TABLE [dbo].[T_Residence_Area_Master] (
    [I_Residence_Area_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Residence_Area_Name] VARCHAR (50) NULL,
    [I_Status]              INT          NULL,
    [S_Crtd_By]             VARCHAR (50) NULL,
    [Dt_Crtd_On]            DATETIME     NULL,
    [S_Updt_By]             VARCHAR (50) NULL,
    [Dt_Updt_On]            DATETIME     NULL,
    CONSTRAINT [PK_T_Residence_Area_Master] PRIMARY KEY CLUSTERED ([I_Residence_Area_ID] ASC)
);

