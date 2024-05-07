CREATE TABLE [dbo].[T_Blood_Group] (
    [I_Blood_Group_ID] INT          IDENTITY (1, 1) NOT NULL,
    [S_Blood_Group]    VARCHAR (50) NULL,
    [I_Status]         INT          NULL,
    [S_Crtd_By]        VARCHAR (50) NULL,
    [Dt_Crtd_On]       DATETIME     NULL,
    [S_Updt_By]        VARCHAR (50) NULL,
    [Dt_Updt_On]       DATETIME     NULL,
    CONSTRAINT [PK_T_Blood_Group] PRIMARY KEY CLUSTERED ([I_Blood_Group_ID] ASC)
);

