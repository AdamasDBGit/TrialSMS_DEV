CREATE TABLE [PLACEMENT].[T_Shortlisted_Students] (
    [I_Shortlisted_Student_ID]  INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Student_Detail_ID]       INT             NULL,
    [I_Vacancy_ID]              INT             NULL,
    [Dt_Scheduled_Interview]    DATETIME        NULL,
    [C_Company_Invitation]      CHAR (1)        NULL,
    [C_Student_Acknowledgement] CHAR (1)        NULL,
    [C_Interview_Status]        CHAR (1)        NULL,
    [Dt_Actual_Interview]       DATETIME        NULL,
    [Dt_Placement]              DATETIME        NULL,
    [S_Placement_Executive]     VARCHAR (50)    NULL,
    [S_Failure_Reason]          VARCHAR (200)   NULL,
    [S_Designation]             VARCHAR (50)    NULL,
    [N_Annual_Salary]           NUMERIC (18, 2) NULL,
    [S_Crtd_By]                 VARCHAR (20)    NULL,
    [S_Upd_By]                  VARCHAR (20)    NULL,
    [Dt_Crtd_On]                DATETIME        NULL,
    [Dt_Upd_On]                 DATETIME        NULL,
    [I_Status]                  INT             NOT NULL,
    CONSTRAINT [PK__T_Shortlisted_St__3791033A] PRIMARY KEY CLUSTERED ([I_Shortlisted_Student_ID] ASC),
    CONSTRAINT [FK__T_Shortli__I_Stu__38852773] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [PLACEMENT].[T_Placement_Registration] ([I_Student_Detail_ID]),
    CONSTRAINT [FK__T_Shortli__I_Vac__39794BAC] FOREIGN KEY ([I_Vacancy_ID]) REFERENCES [PLACEMENT].[T_Vacancy_Detail] ([I_Vacancy_ID])
);

