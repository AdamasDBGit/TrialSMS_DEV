CREATE TABLE [EOS].[T_Employee_Qualification] (
    [I_Employee_Qual_ID]      INT            IDENTITY (1, 1) NOT NULL,
    [I_Qualification_Type_ID] INT            NULL,
    [I_Qualification_Name_ID] INT            NULL,
    [I_Employee_ID]           INT            NULL,
    [I_Passing_Year]          INT            NULL,
    [N_Percentage]            NUMERIC (8, 2) NULL,
    [S_Crtd_By]               VARCHAR (20)   NULL,
    [I_Status]                INT            NULL,
    [S_Upd_By]                VARCHAR (20)   NULL,
    [Dt_Crtd_On]              DATETIME       NULL,
    [Dt_Upd_On]               DATETIME       NULL,
    CONSTRAINT [PK__T_Employee_Quali__79C8DAEB] PRIMARY KEY CLUSTERED ([I_Employee_Qual_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Emp__12AA62A5] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__4EBF4CAC] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Qua__28D8CF8F] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID]),
    CONSTRAINT [FK__T_Employe__I_Qua__29CCF3C8] FOREIGN KEY ([I_Qualification_Name_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID]),
    CONSTRAINT [FK__T_Employe__I_Qua__2AC11801] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID]),
    CONSTRAINT [FK__T_Employe__I_Qua__2BB53C3A] FOREIGN KEY ([I_Qualification_Name_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID])
);


GO
ALTER TABLE [EOS].[T_Employee_Qualification] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__12AA62A5];


GO
ALTER TABLE [EOS].[T_Employee_Qualification] NOCHECK CONSTRAINT [FK__T_Employe__I_Emp__4EBF4CAC];



