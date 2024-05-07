﻿CREATE TABLE [dbo].[T_Result_Exam_Schedule] (
    [I_Result_Exam_Schedule_ID]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [I_School_Session_ID]        INT            NOT NULL,
    [I_Course_ID]                INT            NOT NULL,
    [I_Term_ID]                  INT            NOT NULL,
    [Title]                      VARCHAR (MAX)  NULL,
    [I_School_Group_Class_ID]    INT            NULL,
    [I_Stream_ID]                INT            NULL,
    [Dt_Exam_Start_Date]         DATE           NULL,
    [Dt_Exam_End_Date]           DATE           NULL,
    [S_Class_Teacher_Name]       VARCHAR (MAX)  NULL,
    [S_Class_Teacher_Signature]  NVARCHAR (MAX) NULL,
    [S_Principal_Name]           VARCHAR (MAX)  NULL,
    [S_Principal_Signature]      NVARCHAR (MAX) NULL,
    [I_Result_Process_Status]    INT            NULL,
    [I_Result_Publish_Status]    INT            NULL,
    [Dt_Result_Publish_Date]     DATETIME       NULL,
    [I_Grade_Marks_View]         INT            NULL,
    [I_Is_Freezed]               INT            NULL,
    [Dt_CreatedAt]               DATETIME       NOT NULL,
    [I_Created_By]               INT            NOT NULL,
    [I_IsActive]                 INT            NULL,
    [I_Subject_Total_View]       INT            NULL,
    [I_Subject_Total_Grade_View] INT            NULL,
    [I_Is_Previous_Exam_Marks]   INT            NULL,
    [I_Is_Term_Exam]             INT            NULL,
    [I_Is_Attendance]            INT            NULL,
    [I_Is_Remarks]               INT            NULL
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230726-000352]
    ON [dbo].[T_Result_Exam_Schedule]([I_Course_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230726-000425]
    ON [dbo].[T_Result_Exam_Schedule]([I_Term_ID] ASC);

