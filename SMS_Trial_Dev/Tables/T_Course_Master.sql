CREATE TABLE [dbo].[T_Course_Master] (
    [I_Course_ID]              INT           IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]               INT           NULL,
    [I_CourseFamily_ID]        INT           NULL,
    [S_Course_Code]            VARCHAR (50)  NULL,
    [S_Course_Name]            VARCHAR (250) NULL,
    [S_Course_Desc]            VARCHAR (500) NULL,
    [I_Grading_Pattern_ID]     INT           NULL,
    [I_No_Of_Session]          INT           NULL,
    [I_Certificate_ID]         INT           NULL,
    [I_Document_ID]            INT           NULL,
    [C_AptitudeTestReqd]       CHAR (1)      NULL,
    [C_IsCareerCourse]         CHAR (1)      NULL,
    [C_IsShortTermCourse]      CHAR (1)      NULL,
    [C_IsPlacementApplicable]  CHAR (1)      NULL,
    [I_Is_Editable]            INT           NULL,
    [I_Status]                 INT           NULL,
    [S_Crtd_By]                VARCHAR (20)  NULL,
    [S_Upd_By]                 VARCHAR (20)  NULL,
    [Dt_Crtd_On]               DATETIME      NULL,
    [Dt_Upd_On]                DATETIME      NULL,
    [I_Is_Upgrade_Course]      INT           NULL,
    [I_Is_Dropout_Allowed]     CHAR (1)      NULL,
    [I_No_Of_Days]             INT           NULL,
    [I_Is_ST_Applicable]       CHAR (1)      NULL,
    [I_Min_Week_For_Placement] INT           NULL,
    [I_Max_Week_For_Placement] INT           NULL,
    [S_Course_Category]        VARCHAR (MAX) NULL,
    [B_IsAdmissionCourse]      BIT           NULL,
    [I_Language_ID]            INT           NULL,
    [I_Language_Name]          VARCHAR (200) NULL,
    CONSTRAINT [PK__T_Course_Master__4DD54A14] PRIMARY KEY CLUSTERED ([I_Course_ID] ASC),
    CONSTRAINT [FK__T_Course___I_Bra__7C9038FD] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_Course___I_Cer__7AA7F08B] FOREIGN KEY ([I_Certificate_ID]) REFERENCES [dbo].[T_Certificate_Master] ([I_Certificate_ID]),
    CONSTRAINT [FK__T_Course___I_Cou__7B9C14C4] FOREIGN KEY ([I_CourseFamily_ID]) REFERENCES [dbo].[T_CourseFamily_Master] ([I_CourseFamily_ID]),
    CONSTRAINT [FK__T_Course___I_Gra__79B3CC52] FOREIGN KEY ([I_Grading_Pattern_ID]) REFERENCES [dbo].[T_Grading_Pattern_Master] ([I_Grading_Pattern_ID])
);


GO
CREATE NONCLUSTERED INDEX [NCI_S_Course_Name]
    ON [dbo].[T_Course_Master]([S_Course_Name] ASC);

