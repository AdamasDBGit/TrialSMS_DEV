CREATE TABLE [PLACEMENT].[T_Job_Opening] (
    [I_Vacancy_ID] INT NOT NULL,
    [I_City_ID]    INT NOT NULL,
    [I_Vacancy]    INT NOT NULL,
    CONSTRAINT [PK_T_Job_Opening] PRIMARY KEY CLUSTERED ([I_Vacancy_ID] ASC, [I_City_ID] ASC),
    CONSTRAINT [FK_T_Job_Opening_T_City_Master] FOREIGN KEY ([I_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK_T_Job_Opening_T_Employer_Detail] FOREIGN KEY ([I_Vacancy_ID]) REFERENCES [PLACEMENT].[T_Vacancy_Detail] ([I_Vacancy_ID])
);


GO
ALTER TABLE [PLACEMENT].[T_Job_Opening] NOCHECK CONSTRAINT [FK_T_Job_Opening_T_City_Master];



