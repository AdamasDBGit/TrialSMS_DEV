CREATE TABLE [PLACEMENT].[T_Placement_Registration] (
    [I_Job_Type_ID]              INT            NULL,
    [I_Country_ID]               INT            NULL,
    [I_Centre_ID]                INT            NULL,
    [I_Brand_ID]                 INT            NULL,
    [I_Student_Detail_ID]        INT            NOT NULL,
    [I_Enroll_No]                INT            NULL,
    [S_Preferred_Location]       VARCHAR (2000) NULL,
    [S_Job_Preference]           VARCHAR (2000) NULL,
    [Dt_Actual_Course_Comp_Date] DATETIME       NULL,
    [I_Document_ID]              INT            NULL,
    [S_Height]                   VARCHAR (20)   NULL,
    [S_Weight]                   VARCHAR (20)   NULL,
    [S_Age]                      VARCHAR (20)   NULL,
    [S_Crtd_By]                  VARCHAR (20)   NULL,
    [I_Acknowledgement_Count]    INT            NULL,
    [S_Upd_By]                   VARCHAR (20)   NULL,
    [Dt_Crtd_On]                 DATETIME       NULL,
    [Dt_Upd_On]                  DATETIME       NULL,
    [Dt_Expec_Course_Comp_Date]  DATETIME       NULL,
    [S_Cell_No]                  VARCHAR (50)   NULL,
    [S_Current_Organization]     VARCHAR (50)   NULL,
    [S_Designation]              VARCHAR (20)   NULL,
    [I_Status]                   INT            NOT NULL,
    [B_Profile_Viewed]           BIT            NULL,
    [B_Placement_Asistance]      BIT            NULL,
    CONSTRAINT [PK__T_Placement_Regi__31D829E4] PRIMARY KEY CLUSTERED ([I_Student_Detail_ID] ASC),
    CONSTRAINT [FK__T_Placeme__I_Bra__34B4968F] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_Placeme__I_Cen__33C07256] FOREIGN KEY ([I_Centre_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Placeme__I_Cou__32CC4E1D] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_Placeme__I_Stu__35A8BAC8] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);


GO
ALTER TABLE [PLACEMENT].[T_Placement_Registration] NOCHECK CONSTRAINT [FK__T_Placeme__I_Bra__34B4968F];


GO
ALTER TABLE [PLACEMENT].[T_Placement_Registration] NOCHECK CONSTRAINT [FK__T_Placeme__I_Cen__33C07256];


GO
ALTER TABLE [PLACEMENT].[T_Placement_Registration] NOCHECK CONSTRAINT [FK__T_Placeme__I_Cou__32CC4E1D];


GO
ALTER TABLE [PLACEMENT].[T_Placement_Registration] NOCHECK CONSTRAINT [FK__T_Placeme__I_Stu__35A8BAC8];



