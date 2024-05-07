CREATE TABLE [dbo].[T_Send_Attendance_Data_Audit] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [StdID]         VARCHAR (200) NULL,
    [AttnDate]      VARCHAR (200) NULL,
    [ArrivalTime]   VARCHAR (200) NULL,
    [DepartureTime] VARCHAR (200) NULL,
    [Attendance]    VARCHAR (200) NULL,
    [TrnNo]         INT           NULL,
    [Centercode]    VARCHAR (200) NULL
);

