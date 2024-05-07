CREATE TABLE [dbo].[T_ERP_Saas_Pattern_Header] (
    [I_Pattern_HeaderID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]         INT           NULL,
    [I_Session_ID]       INT           NULL,
    [S_Property_Type]    VARCHAR (100) NULL,
    [S_Property_Name]    VARCHAR (200) NULL,
    [Dt_Create_Dt]       DATETIME      DEFAULT (getdate()) NULL,
    [I_Created_By]       INT           NULL,
    [Dt_Update_Dt]       DATETIME      NULL,
    [I_Updated_By]       INT           NULL,
    [Is_Active]          BIT           NULL,
    [N_help]             VARCHAR (MAX) NULL,
    [N_iExpession]       VARCHAR (255) NULL,
    [S_Screen]           VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([I_Pattern_HeaderID] ASC)
);

