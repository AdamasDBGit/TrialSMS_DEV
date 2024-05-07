﻿CREATE TABLE [AUDIT].[T_Audit_Schedule_Details] (
    [I_Audit_Schedule_Detail_ID] INT  IDENTITY (1, 1) NOT NULL,
    [I_Audit_Schedule_ID]        INT  NULL,
    [Dt_Audit_Date]              DATE NULL,
    CONSTRAINT [PK_T_Audit_Schedule_Details] PRIMARY KEY CLUSTERED ([I_Audit_Schedule_Detail_ID] ASC),
    CONSTRAINT [FK_T_Audit_Schedule_Details_T_Audit_Schedule] FOREIGN KEY ([I_Audit_Schedule_ID]) REFERENCES [AUDIT].[T_Audit_Schedule] ([I_Audit_Schedule_ID])
);

