CREATE TABLE [dbo].[T_Employee_Dtls] (
    [I_Employee_ID]         INT            IDENTITY (1, 1) NOT NULL,
    [I_Centre_Id]           INT            NULL,
    [S_Emp_ID]              VARCHAR (20)   NULL,
    [S_Title]               VARCHAR (10)   NULL,
    [S_First_Name]          VARCHAR (50)   NULL,
    [S_Middle_Name]         VARCHAR (50)   NULL,
    [S_Last_Name]           VARCHAR (50)   NULL,
    [S_Basic_Address]       VARCHAR (1000) NULL,
    [Dt_DOB]                DATETIME       NULL,
    [S_Phone_No]            VARCHAR (20)   NULL,
    [S_Email_ID]            VARCHAR (100)  NULL,
    [Dt_Joining_Date]       DATETIME       NULL,
    [Dt_Resignation_Date]   DATETIME       NULL,
    [I_Job_Type_ID]         INT            NULL,
    [I_Experience_Type_ID]  INT            NULL,
    [I_Document_ID]         INT            NULL,
    [I_Status]              INT            NULL,
    [Dt_Start_Date]         DATETIME       NULL,
    [Dt_End_Date]           DATETIME       NULL,
    [Dt_Activation_Date]    DATETIME       NULL,
    [Dt_DeactivationDate]   DATETIME       NULL,
    [S_Crtd_By]             VARCHAR (20)   NULL,
    [S_Upd_By]              VARCHAR (20)   NULL,
    [Dt_Crtd_On]            DATETIME       NULL,
    [Dt_Upd_On]             DATETIME       NULL,
    [Is_Interview_Cleared]  INT            NULL,
    [Dt_Registration_Date]  DATETIME       NULL,
    [S_Remarks]             VARCHAR (1000) NULL,
    [B_IsRoamingFaculty]    BIT            NULL,
    [S_LeaveDay]            VARCHAR (MAX)  NULL,
    [S_TeacherAvailability] NVARCHAR (MAX) NULL,
    [S_CenterAvailability]  NVARCHAR (MAX) NULL,
    CONSTRAINT [PK__T_Employee_Dtls__79F2F81D] PRIMARY KEY CLUSTERED ([I_Employee_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Cen__06448BC0] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Employe__I_Cen__4441BE39] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Employe__I_Cen__6B909584] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);


GO
CREATE NONCLUSTERED INDEX [NCI_I_Status]
    ON [dbo].[T_Employee_Dtls]([I_Status] ASC);

