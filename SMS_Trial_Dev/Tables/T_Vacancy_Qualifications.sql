CREATE TABLE [PLACEMENT].[T_Vacancy_Qualifications] (
    [I_Vacancy_Qualifications_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Vacancy_ID]                INT          NOT NULL,
    [I_Qualification_Name_ID]     INT          NOT NULL,
    [S_Crtd_By]                   VARCHAR (20) NULL,
    [S_Upd_By]                    VARCHAR (20) NULL,
    [Dt_Crtd_On]                  DATETIME     NULL,
    [Dt_Upd_On]                   DATETIME     NULL,
    [I_Status]                    INT          NOT NULL,
    CONSTRAINT [PK__T_Vacancy_Qualif__1CDD0CFE] PRIMARY KEY CLUSTERED ([I_Vacancy_Qualifications_ID] ASC),
    CONSTRAINT [FK__T_Vacancy__I_Qua__1DD13137] FOREIGN KEY ([I_Qualification_Name_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID]),
    CONSTRAINT [FK__T_Vacancy__I_Vac__1EC55570] FOREIGN KEY ([I_Vacancy_ID]) REFERENCES [PLACEMENT].[T_Vacancy_Detail] ([I_Vacancy_ID])
);

