﻿CREATE TABLE [dbo].[T_Temp_Attdn_Table_copy] (
    [StdID]         NVARCHAR (21) NULL,
    [AttnDate]      DATETIME      NULL,
    [ArrivalTime]   DATETIME      NULL,
    [DepartureTime] DATETIME      NULL,
    [Attendance]    NVARCHAR (10) NULL,
    [TrnNo]         INT           NULL,
    [centercode]    VARCHAR (2)   NOT NULL
);

