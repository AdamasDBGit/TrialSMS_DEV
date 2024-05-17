CREATE TABLE [EXAMINATION].[T_Examination_Detail] (
    [I_Exam_ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [I_Exam_Component_ID]       INT           NULL,
    [I_Centre_Id]               INT           NULL,
    [I_Course_ID]               INT           NULL,
    [I_Term_ID]                 INT           NULL,
    [I_Module_ID]               INT           NULL,
    [I_Status_ID]               INT           NULL,
    [I_Agency_ID]               INT           NULL,
    [S_Invigilator_Name]        VARCHAR (500) NULL,
    [S_Identification_Doc_Type] VARCHAR (200) NULL,
    [C_Invigilator_Notified]    CHAR (1)      NULL,
    [S_Reason]                  VARCHAR (MAX) NULL,
    [Dt_Exam_Date]              DATETIME      NULL,
    [S_Registration_No]         VARCHAR (20)  NULL,
    [Dt_Registration_Date]      DATETIME      NULL,
    [S_Exam_Venue]              VARCHAR (200) NULL,
    [Dt_Exam_Start_Time]        DATETIME      NULL,
    [Dt_Exam_End_Time]          DATETIME      NULL,
    [S_Crtd_By]                 VARCHAR (20)  NULL,
    [S_Upd_By]                  VARCHAR (20)  NULL,
    [Dt_Crtd_On]                DATETIME      NULL,
    [Dt_Upd_On]                 DATETIME      NULL,
    CONSTRAINT [PK__T_Examination_De__11564BB9] PRIMARY KEY CLUSTERED ([I_Exam_ID] ASC),
    CONSTRAINT [FK__T_Examina__I_Age__57E8C433] FOREIGN KEY ([I_Agency_ID]) REFERENCES [EXAMINATION].[T_Agency_Master] ([I_Agency_ID]),
    CONSTRAINT [FK__T_Examina__I_Cen__5AC530DE] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Examina__I_Cou__59D10CA5] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Examina__I_Exa__56007BC1] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK__T_Examina__I_Ter__58DCE86C] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID])
);


GO
ALTER TABLE [EXAMINATION].[T_Examination_Detail] NOCHECK CONSTRAINT [FK__T_Examina__I_Age__57E8C433];


GO
ALTER TABLE [EXAMINATION].[T_Examination_Detail] NOCHECK CONSTRAINT [FK__T_Examina__I_Cen__5AC530DE];


GO
ALTER TABLE [EXAMINATION].[T_Examination_Detail] NOCHECK CONSTRAINT [FK__T_Examina__I_Cou__59D10CA5];


GO
ALTER TABLE [EXAMINATION].[T_Examination_Detail] NOCHECK CONSTRAINT [FK__T_Examina__I_Exa__56007BC1];


GO
ALTER TABLE [EXAMINATION].[T_Examination_Detail] NOCHECK CONSTRAINT [FK__T_Examina__I_Ter__58DCE86C];



