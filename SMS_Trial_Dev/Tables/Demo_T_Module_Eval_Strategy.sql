﻿CREATE TABLE [dbo].[Demo_T_Module_Eval_Strategy] (
    [I_Module_Strategy_ID] INT            IDENTITY (1, 1) NOT NULL,
    [I_Course_ID]          INT            NULL,
    [I_Term_ID]            INT            NULL,
    [I_Module_ID]          INT            NULL,
    [I_Exam_Component_ID]  INT            NULL,
    [I_TotMarks]           INT            NULL,
    [N_Weightage]          NUMERIC (8, 2) NULL,
    [S_Remarks]            VARCHAR (200)  NULL,
    [I_Status]             INT            NULL,
    [S_Crtd_By]            VARCHAR (20)   NULL,
    [S_Upd_By]             VARCHAR (20)   NULL,
    [Dt_Crtd_On]           DATETIME       NULL,
    [Dt_Upd_On]            DATETIME       NULL,
    [I_Exam_Duration]      INT            NULL
);

