CREATE TABLE [ACADEMICS].[T_Concern_Areas] (
    [I_Concern_Areas_ID]   INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Academics_Visit_ID] INT            NULL,
    [S_Description]        VARCHAR (2000) NULL,
    [I_Assigned_EmpID]     INT            NULL,
    [Dt_Target_Date]       DATETIME       NULL,
    [Dt_Actual_Date]       DATETIME       NULL,
    [I_Is_Notified]        BIT            CONSTRAINT [DF_T_Concern_Areas_I_Is_Notified] DEFAULT ((0)) NULL,
    [S_Crtd_By]            VARCHAR (20)   NULL,
    [S_Upd_By]             VARCHAR (20)   NULL,
    [Dt_Crtd_On]           DATETIME       NULL,
    [Dt_Upd_On]            DATETIME       NULL,
    CONSTRAINT [PK__T_Concern_Areas__22C00386] PRIMARY KEY CLUSTERED ([I_Concern_Areas_ID] ASC),
    CONSTRAINT [FK__T_Concern__I_Aca__7F0CB2F5] FOREIGN KEY ([I_Academics_Visit_ID]) REFERENCES [ACADEMICS].[T_Academics_Visit] ([I_Academics_Visit_ID])
);

