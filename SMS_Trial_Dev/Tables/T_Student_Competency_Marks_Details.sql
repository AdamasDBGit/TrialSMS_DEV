CREATE TABLE [ASSESSMENT].[T_Student_Competency_Marks_Details] (
    [I_Student_Competency_Map_ID] INT            IDENTITY (1, 1) NOT NULL,
    [I_Enquiry_Regn_ID]           INT            NULL,
    [I_Exam_Component_ID]         INT            NULL,
    [I_Competency_ID]             INT            NULL,
    [N_Marks_Obtained]            DECIMAL (8, 2) NULL,
    [N_Total_Marks]               DECIMAL (8, 2) NULL,
    [S_Crtd_By]                   VARCHAR (20)   NULL,
    [S_Updt_By]                   VARCHAR (20)   NULL,
    [Dt_Crtd_On]                  DATETIME       NULL,
    [Dt_Updt_On]                  DATETIME       NULL,
    CONSTRAINT [PK_T_Student_Competency_Marks_Details] PRIMARY KEY CLUSTERED ([I_Student_Competency_Map_ID] ASC),
    CONSTRAINT [FK_T_Student_Competency_Marks_Details_T_Competency_Details] FOREIGN KEY ([I_Competency_ID]) REFERENCES [ASSESSMENT].[T_Competency_Details] ([I_Competency_ID]),
    CONSTRAINT [FK_T_Student_Competency_Marks_Details_T_Enquiry_Regn_Detail] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Student_Competency_Marks_Details_T_Exam_Component_Master] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID])
);

