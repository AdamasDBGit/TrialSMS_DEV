CREATE TABLE [dbo].[T_Unrestricted_EmailId_List] (
    [I_Unrestricted_Email_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Email_Id]              VARCHAR (200) NULL,
    [S_Crtd_By]               VARCHAR (20)  NULL,
    [Dt_Crtd_On]              DATETIME      NULL,
    CONSTRAINT [PK_T_Unrestricted_EmailId_List] PRIMARY KEY CLUSTERED ([I_Unrestricted_Email_ID] ASC)
);

