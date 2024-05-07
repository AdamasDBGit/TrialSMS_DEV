CREATE TABLE [dbo].[T_Stream_Master] (
    [I_Stream_ID]             INT          IDENTITY (1, 1) NOT NULL,
    [S_Stream_Name]           VARCHAR (50) NULL,
    [I_Status]                INT          NULL,
    [S_Crtd_By]               VARCHAR (20) NULL,
    [S_Upd_By]                VARCHAR (20) NULL,
    [Dt_Crtd_On]              DATETIME     NULL,
    [Dt_Upd_On]               DATETIME     NULL,
    [I_Qualification_Name_ID] INT          NULL,
    CONSTRAINT [PK__T_Stream_Master__5CA28C58] PRIMARY KEY CLUSTERED ([I_Stream_ID] ASC)
);

