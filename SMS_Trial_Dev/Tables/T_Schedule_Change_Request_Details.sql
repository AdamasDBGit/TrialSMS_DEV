﻿CREATE TABLE [AUDIT].[T_Schedule_Change_Request_Details] (
    [I_Schedule_CR_Detail_ID]      INT  IDENTITY (1, 1) NOT NULL,
    [I_Schedule_Change_Request_ID] INT  NOT NULL,
    [Dt_Audit_Date]                DATE NOT NULL,
    CONSTRAINT [PK_T_Schedule_Change_Request_Details] PRIMARY KEY CLUSTERED ([I_Schedule_CR_Detail_ID] ASC),
    CONSTRAINT [FK_T_Schedule_Change_Request_Details_T_Schedule_Change_Request] FOREIGN KEY ([I_Schedule_Change_Request_ID]) REFERENCES [AUDIT].[T_Schedule_Change_Request] ([I_Schedule_Change_Request_ID])
);

