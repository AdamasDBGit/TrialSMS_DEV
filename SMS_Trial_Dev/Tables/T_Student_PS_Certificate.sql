﻿CREATE TABLE [PSCERTIFICATE].[T_Student_PS_Certificate] (
    [I_Student_Certificate_ID]  INT           IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID]       INT           NOT NULL,
    [I_Course_ID]               INT           NULL,
    [I_Term_ID]                 INT           NULL,
    [S_Certificate_Serial_No]   VARCHAR (200) NULL,
    [Dt_Certificate_Issue_Date] DATETIME      NULL,
    [Dt_Status_Date]            DATETIME      NULL,
    [B_PS_Flag]                 INT           NULL,
    [I_Status]                  INT           NULL,
    [S_Crtd_By]                 VARCHAR (20)  NOT NULL,
    [S_Upd_By]                  VARCHAR (20)  NULL,
    [Dt_Crtd_On]                DATETIME      NOT NULL,
    [Dt_Upd_On]                 DATETIME      NULL,
    [C_Certificate_Type]        CHAR (1)      NULL,
    CONSTRAINT [FK_T_Student_PS_Certificate_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_Student_PS_Certificate_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Student_PS_Certificate_T_Term_Master] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID])
);


GO
ALTER TABLE [PSCERTIFICATE].[T_Student_PS_Certificate] NOCHECK CONSTRAINT [FK_T_Student_PS_Certificate_T_Course_Master];



