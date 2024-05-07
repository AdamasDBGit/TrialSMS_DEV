CREATE TABLE [ASSESSMENT].[T_Student_Assessment_Map] (
    [I_Enquiry_Regn_ID]   INT NOT NULL,
    [I_PreAssessment_ID]  INT NOT NULL,
    [I_Exam_Component_ID] INT NOT NULL,
    [B_Is_Complete]       BIT NULL,
    [Total_Marks]         INT NULL,
    CONSTRAINT [PK_T_Student_Assessment_Map] PRIMARY KEY CLUSTERED ([I_Enquiry_Regn_ID] ASC, [I_PreAssessment_ID] ASC, [I_Exam_Component_ID] ASC),
    CONSTRAINT [FK_T_Student_Assessment_Map_T_Enquiry_Regn_Detail] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Student_Assessment_Map_T_Exam_Component_Master] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK_T_Student_Assessment_Map_T_PreAssessment_Master] FOREIGN KEY ([I_PreAssessment_ID]) REFERENCES [ASSESSMENT].[T_PreAssessment_Master] ([I_PreAssessment_ID])
);

