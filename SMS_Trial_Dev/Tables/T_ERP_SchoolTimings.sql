﻿CREATE TABLE [dbo].[T_ERP_SchoolTimings] (
    [I_SchoolTiming_ID]   INT      IDENTITY (1, 1) NOT NULL,
    [R_I_Brand_ID]        INT      NULL,
    [R_I_School_Group_ID] INT      NULL,
    [T_School_St_Time]    TIME (0) NULL,
    [T_School_End_Time]   TIME (0) NULL,
    [Dtt_Created_At]      DATETIME DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]     DATETIME NULL,
    [I_Created_By]        INT      NULL,
    [I_Modified_By]       INT      NULL,
    [Is_Active]           BIT      DEFAULT ((1)) NULL
);

