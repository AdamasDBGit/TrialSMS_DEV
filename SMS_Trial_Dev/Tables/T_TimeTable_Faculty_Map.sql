CREATE TABLE [dbo].[T_TimeTable_Faculty_Map] (
    [I_TimeTable_ID] INT NOT NULL,
    [I_Employee_ID]  INT NOT NULL,
    [B_Is_Actual]    BIT NOT NULL,
    CONSTRAINT [PK_T_TimeTable_Faculty_Map] PRIMARY KEY CLUSTERED ([I_TimeTable_ID] ASC, [I_Employee_ID] ASC, [B_Is_Actual] ASC),
    CONSTRAINT [FK_T_TimeTable_Faculty_Map_T_Employee_Dtls] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK_T_TimeTable_Faculty_Map_T_TimeTable_Master] FOREIGN KEY ([I_TimeTable_ID]) REFERENCES [dbo].[T_TimeTable_Master] ([I_TimeTable_ID])
);


GO
ALTER TABLE [dbo].[T_TimeTable_Faculty_Map] NOCHECK CONSTRAINT [FK_T_TimeTable_Faculty_Map_T_Employee_Dtls];




GO
CREATE TRIGGER [dbo].[trgAfterInsertTimetableFacultyMap] ON [dbo].[T_TimeTable_Faculty_Map]
    AFTER INSERT
AS

DECLARE @timetableid INT;
DECLARE @facultyid INT;
DECLARE @isactual BIT;


SELECT @timetableid=i.I_TimeTable_ID FROM INSERTED i;
SELECT @facultyid=i.I_Employee_ID FROM INSERTED i;
SELECT @isactual=i.B_Is_Actual FROM INSERTED i;


IF (EXISTS(SELECT * FROM dbo.T_TimeTable_Master_Planned WHERE I_TimeTable_ID=@timetableid))
BEGIN

IF ((SELECT top 1 I_Employee_ID FROM dbo.T_TimeTable_Master_Planned WHERE I_TimeTable_ID=@timetableid order by i_timetable_planned_id desc)=0)
BEGIN

UPDATE dbo.T_TimeTable_Master_Planned SET I_Employee_ID=@facultyid,B_Is_Actual=@isactual WHERE I_TimeTable_ID=@timetableid

END
END
