CREATE TABLE [dbo].[T_ERP_Exam_Component_Mapping] (
    [I_Exam_Comp_Map_ID]     INT      IDENTITY (1, 1) NOT NULL,
    [I_Exam_Comp_Header_ID]  INT      NULL,
    [I_Subject_ID]           INT      NULL,
    [I_Subject_Component_ID] INT      NULL,
    [N_Total_Marks]          INT      NULL,
    [N_Pass_Marks]           INT      NULL,
    [Is_PassMandatory]       BIT      NULL,
    [S_Weightage]            INT      NULL,
    [Is_Active]              BIT      DEFAULT ((1)) NULL,
    [Dt_Created_At]          DATETIME DEFAULT (getdate()) NULL,
    [Dt_Modified_At]         DATETIME NULL,
    [I_Created_By]           INT      NULL,
    [I_Modified_By]          INT      NULL,
    PRIMARY KEY CLUSTERED ([I_Exam_Comp_Map_ID] ASC)
);

