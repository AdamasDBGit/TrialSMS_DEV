CREATE TABLE [dbo].[T_Upload_Document] (
    [I_Document_ID]   INT            IDENTITY (1, 1) NOT NULL,
    [S_Document_Name] VARCHAR (1000) NULL,
    [S_Document_Type] VARCHAR (50)   NULL,
    [S_Document_Path] VARCHAR (5000) NULL,
    [S_Document_URL]  VARCHAR (5000) NULL,
    [I_Status]        INT            NULL,
    [S_Crtd_By]       VARCHAR (50)   NULL,
    [Dt_Crtd_On]      DATETIME       NULL,
    [S_Upd_By]        VARCHAR (50)   NULL,
    [Dt_Upd_On]       DATETIME       NULL,
    CONSTRAINT [PK_T_Upload_Document] PRIMARY KEY CLUSTERED ([I_Document_ID] ASC)
);

