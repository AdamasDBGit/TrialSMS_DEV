CREATE TABLE [dbo].[T_ERP_Exam_Students_Result_Header] (
    [I_Exam_Result_Header_ID]   BIGINT   NULL,
    [I_Result_Exam_Schedule_ID] INT      NULL,
    [I_ScheduleDetail_ID]       INT      NULL,
    [I_School_Group_id]         INT      NULL,
    [I_Class_ID]                INT      NULL,
    [I_Exam_Comp_Header_ID]     INT      NULL,
    [Is_Active]                 BIT      DEFAULT ((1)) NULL,
    [Dt_Created_At]             DATETIME DEFAULT (getdate()) NULL,
    [Dt_Modified_At]            DATETIME NULL,
    [I_Created_By]              INT      NULL,
    [I_Modified_By]             INT      NULL
);

