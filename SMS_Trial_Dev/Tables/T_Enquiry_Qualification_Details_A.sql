CREATE TABLE [dbo].[T_Enquiry_Qualification_Details_A] (
    [I_Enquiry_Qualification_ID] INT             NOT NULL,
    [I_Enquiry_Regn_ID]          INT             NOT NULL,
    [S_Name_Of_Exam]             VARCHAR (200)   NULL,
    [S_University_Name]          VARCHAR (200)   NULL,
    [S_Year_From]                VARCHAR (4)     NULL,
    [S_Year_To]                  VARCHAR (4)     NULL,
    [S_Subject_Name]             VARCHAR (200)   NULL,
    [N_Marks_Obtained]           DECIMAL (18, 2) NULL,
    [N_Percentage]               DECIMAL (18, 2) NULL,
    [S_Division]                 VARCHAR (50)    NULL,
    [I_Status]                   INT             NULL,
    [S_Crtd_By]                  VARCHAR (20)    NULL,
    [S_Upd_By]                   VARCHAR (20)    NULL,
    [Dt_Crtd_On]                 DATETIME        NULL,
    [Dt_Upd_On]                  DATETIME        NULL,
    [AuditedOn]                  DATETIME        NOT NULL,
    [AuditType]                  CHAR (1)        NOT NULL,
    [AuditId]                    INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_T_Enquiry_Qualification_Details_A] PRIMARY KEY CLUSTERED ([AuditId] ASC)
);

