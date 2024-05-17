CREATE TABLE [dbo].[T_Student_Attendance] (
    [I_Attendance_Detail_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID]    INT          NULL,
    [S_Crtd_By]              VARCHAR (20) NULL,
    [Dt_Crtd_On]             DATETIME     NULL,
    [I_TimeTable_ID]         INT          NULL,
    CONSTRAINT [PK__T_Student_Attend__7CDA51C0] PRIMARY KEY CLUSTERED ([I_Attendance_Detail_ID] ASC),
    CONSTRAINT [FK__T_Student__I_Stu__39E36000] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Student_Attendance_T_TimeTable_Master] FOREIGN KEY ([I_TimeTable_ID]) REFERENCES [dbo].[T_TimeTable_Master] ([I_TimeTable_ID])
);


GO
ALTER TABLE [dbo].[T_Student_Attendance] NOCHECK CONSTRAINT [FK__T_Student__I_Stu__39E36000];


GO
ALTER TABLE [dbo].[T_Student_Attendance] NOCHECK CONSTRAINT [FK_T_Student_Attendance_T_TimeTable_Master];




GO
CREATE NONCLUSTERED INDEX [index_Student_ID_Attendance]
    ON [dbo].[T_Student_Attendance]([I_Student_Detail_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [TimeTableIDStudentID]
    ON [dbo].[T_Student_Attendance]([I_TimeTable_ID] ASC)
    INCLUDE([I_Student_Detail_ID]);

