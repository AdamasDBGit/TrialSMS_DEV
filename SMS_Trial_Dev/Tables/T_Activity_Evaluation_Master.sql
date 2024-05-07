CREATE TABLE [dbo].[T_Activity_Evaluation_Master] (
    [I_Evaluation_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]        INT          NULL,
    [S_Evaluation_Name] VARCHAR (50) NULL,
    [I_Status]          INT          NULL,
    [S_Crtd_By]         VARCHAR (20) NULL,
    [S_Upd_By]          VARCHAR (20) NULL,
    [Dt_Crtd_On]        DATETIME     NULL,
    [Dt_Upd_On]         DATETIME     NULL,
    CONSTRAINT [PK_T_Evaluation_Master_1] PRIMARY KEY CLUSTERED ([I_Evaluation_ID] ASC)
);

