CREATE TABLE [dbo].[T_Login_PageAccess_Trail] (
    [I_Login_PageAccess_Trail_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Login_Trail_ID]            INT           NULL,
    [S_Page_Name]                 VARCHAR (100) NULL,
    [Dt_Starttime]                DATETIME      CONSTRAINT [DF_T_Login_PageAccess_Trail_Dt_Starttime] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_T_Login_PageAccess_Trail] PRIMARY KEY CLUSTERED ([I_Login_PageAccess_Trail_ID] ASC),
    CONSTRAINT [FK_T_Login_PageAccess_Trail_T_Login_Trail] FOREIGN KEY ([I_Login_Trail_ID]) REFERENCES [dbo].[T_Login_Trail] ([I_Login_Trail_ID])
);

