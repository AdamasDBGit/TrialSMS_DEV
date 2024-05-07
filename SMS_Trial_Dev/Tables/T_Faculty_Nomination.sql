CREATE TABLE [ACADEMICS].[T_Faculty_Nomination] (
    [I_Faculty_Nomination_ID] INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Centre_Id]             INT            NULL,
    [I_Training_ID]           INT            NULL,
    [I_Employee_ID]           INT            NULL,
    [C_Attended]              CHAR (1)       NULL,
    [C_Approved]              CHAR (1)       NULL,
    [N_Marks_Obtd]            NUMERIC (8, 2) NULL,
    [S_Crtd_By]               VARCHAR (20)   NULL,
    [S_Upd_By]                VARCHAR (20)   NULL,
    [Dt_Crtd_On]              DATETIME       NULL,
    [Dt_Upd_On]               DATETIME       NULL,
    [C_Feedback_Provided]     CHAR (1)       NULL,
    [C_Feedback_Received]     CHAR (1)       NULL,
    CONSTRAINT [PK__T_Faculty_Nomina__55CB7197] PRIMARY KEY CLUSTERED ([I_Faculty_Nomination_ID] ASC),
    CONSTRAINT [FK__T_Faculty__I_Cen__4EB45FB4] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Faculty__I_Tra__5655817C] FOREIGN KEY ([I_Training_ID]) REFERENCES [ACADEMICS].[T_Training_Calendar] ([I_Training_ID]),
    CONSTRAINT [FK_T_Faculty_Nomination_T_Employee_Dtls] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID])
);

