CREATE TABLE [dbo].[BKP_T_Session_Master_SEP] (
    [I_Session_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [I_Session_Type_ID]  INT            NULL,
    [I_Brand_ID]         INT            NULL,
    [S_Session_Code]     VARCHAR (50)   NOT NULL,
    [S_Session_Name]     VARCHAR (250)  NULL,
    [N_Session_Duration] NUMERIC (18)   NULL,
    [S_Crtd_By]          VARCHAR (20)   NULL,
    [S_Upd_By]           VARCHAR (20)   NULL,
    [S_Session_Topic]    VARCHAR (1000) NULL,
    [Dt_Crtd_On]         DATETIME       NULL,
    [Dt_Upd_On]          DATETIME       NULL,
    [I_Is_Editable]      INT            NULL,
    [I_Status]           INT            NULL,
    [I_Skill_ID]         INT            NULL
);

