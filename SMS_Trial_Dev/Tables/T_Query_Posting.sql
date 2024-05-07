CREATE TABLE [ACADEMICS].[T_Query_Posting] (
    [I_Query_Posting_ID]    INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Student_Detail_ID]   INT            NULL,
    [I_E_Project_Spec_ID]   INT            NULL,
    [S_Query_Dtls]          VARCHAR (8000) NULL,
    [Dt_Query_Posting_Date] DATETIME       NULL,
    [S_Resolution]          VARCHAR (8000) NULL,
    [I_Status]              INT            NULL,
    [S_Crtd_By]             VARCHAR (20)   NULL,
    [S_Upd_By]              VARCHAR (20)   NULL,
    [Dt_Crtd_On]            DATETIME       NULL,
    [Dt_Upd_On]             DATETIME       NULL,
    CONSTRAINT [PK__T_Query_Posting__2C496DC0] PRIMARY KEY CLUSTERED ([I_Query_Posting_ID] ASC),
    CONSTRAINT [FK__T_Query_P__I_E_P__1407CFDB] FOREIGN KEY ([I_E_Project_Spec_ID]) REFERENCES [ACADEMICS].[T_E_Project_Spec] ([I_E_Project_Spec_ID]),
    CONSTRAINT [FK__T_Query_P__I_Stu__16E43C86] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK__T_Query_P__I_Stu__17D860BF] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK__T_Query_P__I_Stu__18CC84F8] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);

