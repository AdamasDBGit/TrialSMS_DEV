CREATE TABLE [ASSESSMENT].[T_Student_Assessment_Suggestion] (
    [I_Enquiry_Regn_ID] INT NOT NULL,
    [I_CourseList_ID]   INT NOT NULL,
    CONSTRAINT [PK_T_Student_Assessment_Suggestion] PRIMARY KEY CLUSTERED ([I_Enquiry_Regn_ID] ASC, [I_CourseList_ID] ASC),
    CONSTRAINT [FK_T_Student_Assessment_Suggestion_T_Enquiry_Regn_Detail] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Student_Assessment_Suggestion_T_Rule_CourseList_Map] FOREIGN KEY ([I_CourseList_ID]) REFERENCES [ASSESSMENT].[T_Rule_CourseList_Map] ([I_CourseList_ID])
);

