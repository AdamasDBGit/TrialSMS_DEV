CREATE TABLE [dbo].[T_ERP_Exam_Schedule_Details] (
    [I_ScheduleDetail_ID]         BIGINT   IDENTITY (1, 1) NOT NULL,
    [R_I_Result_Exam_Schedule_ID] INT      NULL,
    [Dt_Exam_Start_Date]          DATE     NULL,
    [Dt_Exam_End_Date]            DATE     NULL,
    [R_I_Slot_ID]                 INT      NULL,
    [I_Exam_Comp_Header_ID]       INT      NULL,
    [I_Exam_Comp_Map_ID]          INT      NULL,
    [I_Faculty_Master_ID]         INT      NULL,
    [Dtt_Created_At]              DATETIME DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]             DATETIME NULL,
    [I_Created_By]                INT      NULL,
    [I_Modified_By]               INT      NULL,
    [Is_Active]                   BIT      DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_ScheduleDetail_ID] ASC)
);

