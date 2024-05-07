﻿CREATE TABLE [dbo].[T_ERP_Exam_Component_Configuration] (
    [I_Comp_Conf_ID]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [R_I_Exam_Component_ID]       INT            NOT NULL,
    [R_I_Result_Exam_Schedule_ID] INT            NOT NULL,
    [R_I_Subject_ID]              INT            NOT NULL,
    [Attendence_Status]           BIT            NULL,
    [N_Total_Marks]               NUMERIC (6, 2) NULL,
    [N_Pass_Marks]                NUMERIC (6, 2) NULL,
    [N_Weightage]                 NUMERIC (6, 2) NULL,
    [Dtt_Created_At]              DATETIME       DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]             DATETIME       NULL,
    [I_Created_By]                INT            NULL,
    [I_Modified_By]               INT            NULL,
    [Is_Active]                   BIT            NULL,
    PRIMARY KEY CLUSTERED ([R_I_Exam_Component_ID] ASC, [R_I_Result_Exam_Schedule_ID] ASC, [R_I_Subject_ID] ASC)
);

