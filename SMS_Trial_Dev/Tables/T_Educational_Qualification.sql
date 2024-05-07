﻿CREATE TABLE [PLACEMENT].[T_Educational_Qualification] (
    [T_Education_Qualification_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Qualification_Name_ID]      INT          NOT NULL,
    [I_Student_Detail_ID]          INT          NOT NULL,
    [I_Status]                     INT          NOT NULL,
    [I_Year_Of_Passing]            INT          NULL,
    [S_Percentage_Of_Marks]        VARCHAR (50) NULL,
    [S_Crtd_By]                    VARCHAR (20) NULL,
    [Dt_Crtd_On]                   DATETIME     NULL,
    [S_Upd_By]                     VARCHAR (20) NULL,
    [Dt_Upd_On]                    DATETIME     NULL,
    CONSTRAINT [PK__T_Educational_Qu__44EAFE58] PRIMARY KEY CLUSTERED ([T_Education_Qualification_ID] ASC),
    CONSTRAINT [FK__T_Educati__I_Qua__45DF2291] FOREIGN KEY ([I_Qualification_Name_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID]),
    CONSTRAINT [FK__T_Educati__I_Stu__46D346CA] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [PLACEMENT].[T_Placement_Registration] ([I_Student_Detail_ID])
);

