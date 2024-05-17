CREATE TABLE [EOS].[T_Employee_WorkExp] (
    [I_Employee_WorkExp_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Employee_ID]         INT           NULL,
    [Dt_From_Date]          DATETIME      NULL,
    [Dt_To_Date]            DATETIME      NULL,
    [S_Company]             VARCHAR (100) NULL,
    [S_Industry]            VARCHAR (100) NULL,
    [S_Job_Type]            VARCHAR (20)  NULL,
    [S_Job_Description]     VARCHAR (200) NULL,
    [I_Status]              INT           NULL,
    [S_Crtd_By]             VARCHAR (20)  NULL,
    [S_Upd_By]              VARCHAR (20)  NULL,
    [Dt_Crtd_On]            DATETIME      NULL,
    [Dt_Upd_On]             DATETIME      NULL,
    CONSTRAINT [PK__T_Employee_WorkE__419A5BB8] PRIMARY KEY CLUSTERED ([I_Employee_WorkExp_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Emp__1E1C1551] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__5A30FF58] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID])
);


GO
ALTER TABLE [EOS].[T_Employee_WorkExp] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__1E1C1551];


GO
ALTER TABLE [EOS].[T_Employee_WorkExp] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__5A30FF58];



