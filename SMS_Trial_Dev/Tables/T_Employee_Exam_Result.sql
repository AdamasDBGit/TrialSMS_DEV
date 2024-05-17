CREATE TABLE [EOS].[T_Employee_Exam_Result] (
    [I_Employee_Exam_Result_ID] INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Employee_ID]             INT            NULL,
    [I_Exam_Component_ID]       INT            NULL,
    [I_No_Of_Attempts]          INT            NULL,
    [N_Marks]                   NUMERIC (8, 2) NULL,
    [B_Passed]                  BIT            NULL,
    [S_Answer_XML]              XML            NULL,
    [S_Crtd_By]                 VARCHAR (20)   NULL,
    [S_Upd_By]                  VARCHAR (20)   NULL,
    [Dt_Crtd_On]                DATETIME       NULL,
    [Dt_Upd_On]                 DATETIME       NULL,
    [I_Enquiry_Regn_ID]         INT            NULL,
    CONSTRAINT [PK__T_Employee_Exam___53B90BF3] PRIMARY KEY CLUSTERED ([I_Employee_Exam_Result_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Emp__0A151CA4] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__0BFD6516] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__48124F1D] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Exa__0920F86B] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK__T_Employe__I_Exa__0B0940DD] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK__T_Employe__I_Exa__471E2AE4] FOREIGN KEY ([I_Exam_Component_ID]) REFERENCES [dbo].[T_Exam_Component_Master] ([I_Exam_Component_ID]),
    CONSTRAINT [FK_T_Employee_Exam_Result_T_Enquiry_Regn_Detail] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID])
);


GO
ALTER TABLE [EOS].[T_Employee_Exam_Result] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__0A151CA4];


GO
ALTER TABLE [EOS].[T_Employee_Exam_Result] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__0BFD6516];


GO
ALTER TABLE [EOS].[T_Employee_Exam_Result] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__48124F1D];



