CREATE TABLE [dbo].[T_Send_Attendance_Data] (
    [id]            BIGINT       IDENTITY (1, 1) NOT NULL,
    [StdID]         VARCHAR (50) NULL,
    [AttnDate]      VARCHAR (50) NULL,
    [ArrivalTime]   VARCHAR (50) NOT NULL,
    [DepartureTime] VARCHAR (50) NULL,
    [Attendance]    VARCHAR (50) NULL,
    [TrnNo]         INT          NULL,
    [Centercode]    VARCHAR (50) NULL,
    CONSTRAINT [PK_T_Send_Attendance_Data] PRIMARY KEY CLUSTERED ([id] ASC)
);

