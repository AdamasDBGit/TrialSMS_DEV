CREATE TABLE [dbo].[T_ERP_Exam_Students_Result_Details] (
    [I_Exam_Students_Result_Details_ID] BIGINT        NULL,
    [I_Exam_Result_Header_ID]           INT           NULL,
    [I_Student_Detail_ID]               BIGINT        NULL,
    [I_Roll_No]                         INT           NULL,
    [I_Student_obtain_Marks]            INT           NULL,
    [S_Remarks]                         VARCHAR (100) NULL,
    [Is_Present]                        BIT           NULL,
    [S_Conduct]                         VARCHAR (30)  NULL,
    [Is_Active]                         BIT           DEFAULT ((1)) NULL,
    [Dt_Created_At]                     DATETIME      DEFAULT (getdate()) NULL,
    [Dt_Modified_At]                    DATETIME      NULL,
    [I_Created_By]                      INT           NULL,
    [I_Modified_By]                     INT           NULL
);

