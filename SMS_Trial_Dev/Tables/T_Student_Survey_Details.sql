﻿CREATE TABLE [STUDENTFEATURES].[T_Student_Survey_Details] (
    [I_Student_Survey_ID]  INT            IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID]  INT            NOT NULL,
    [S_Student_Feedback]   VARCHAR (1000) NULL,
    [I_Recommended_Rating] INT            NOT NULL,
    [S_Crtd_BY]            VARCHAR (50)   NULL,
    [Dt_Crtd_On]           DATETIME       NULL,
    [S_Upd_By]             VARCHAR (50)   NULL,
    [Dt_Upd_On]            DATETIME       NULL,
    [I_Status]             INT            NULL,
    CONSTRAINT [PK_T_Student_Survey_Details] PRIMARY KEY CLUSTERED ([I_Student_Survey_ID] ASC),
    CONSTRAINT [FK_T_Student_Survey_Details_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);


GO
ALTER TABLE [STUDENTFEATURES].[T_Student_Survey_Details] NOCHECK CONSTRAINT [FK_T_Student_Survey_Details_T_Student_Detail];



