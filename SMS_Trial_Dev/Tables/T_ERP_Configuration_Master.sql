CREATE TABLE [dbo].[T_ERP_Configuration_Master] (
    [I_Config_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]       INT           NULL,
    [I_Config_Type_ID] INT           NULL,
    [S_Screen]         VARCHAR (MAX) NULL,
    [S_config_code]    VARCHAR (MAX) NULL,
    [S_config_Value]   VARCHAR (200) NULL,
    [I_Status]         INT           NULL,
    [S_Created_By]     VARCHAR (MAX) NULL,
    [Dt_Created_At]    DATETIME      NULL,
    [S_Updated_By]     VARCHAR (MAX) NULL,
    [Dt_Updated_At]    DATETIME      NULL
);

