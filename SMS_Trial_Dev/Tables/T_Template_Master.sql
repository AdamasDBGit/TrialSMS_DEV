CREATE TABLE [dbo].[T_Template_Master] (
    [I_Template_ID]          INT           IDENTITY (1, 1) NOT NULL,
    [S_Template_Code]        VARCHAR (20)  NOT NULL,
    [S_Template_Type]        SMALLINT      NOT NULL,
    [S_Template_Description] VARCHAR (100) NULL,
    [S_File_Location]        VARCHAR (200) NULL,
    [I_Status]               INT           NOT NULL,
    [S_Crtd_By]              VARCHAR (50)  NULL,
    [S_Upd_By]               VARCHAR (50)  NULL,
    [Dt_Crtd_On]             DATETIME      NULL,
    [Dt_Upd_On]              DATETIME      NULL,
    CONSTRAINT [PK_dbo.T_Template_Master] PRIMARY KEY CLUSTERED ([I_Template_ID] ASC)
);

