CREATE TABLE [dbo].[Demo_T_Term_Course_Map] (
    [I_Term_Course_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Certificate_ID] INT          NULL,
    [I_Course_ID]      INT          NULL,
    [I_Term_ID]        INT          NULL,
    [I_Sequence]       INT          NULL,
    [C_Examinable]     CHAR (1)     NULL,
    [S_Crtd_By]        VARCHAR (20) NULL,
    [S_Upd_By]         VARCHAR (20) NULL,
    [Dt_Crtd_On]       DATETIME     NULL,
    [Dt_Upd_On]        DATETIME     NULL,
    [Dt_Valid_From]    DATETIME     NULL,
    [Dt_Valid_To]      DATETIME     NULL,
    [I_Status]         INT          NULL
);

