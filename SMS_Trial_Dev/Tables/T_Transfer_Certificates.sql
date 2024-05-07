﻿CREATE TABLE [dbo].[T_Transfer_Certificates] (
    [I_Transfer_Cert_Req_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID]    INT           NULL,
    [I_Transfer_Req_Status]  INT           NULL,
    [TC_Serial_No]           VARCHAR (100) NULL,
    [Release_Date]           DATETIME      NULL,
    [Is_Released]            BIT           CONSTRAINT [DF_T_Transfer_Certificates_Is_Released] DEFAULT ((0)) NULL,
    [S_Remarks]              VARCHAR (500) NULL,
    [S_Crtd_By]              VARCHAR (20)  NULL,
    [S_Upd_By]               VARCHAR (20)  NULL,
    [Dt_Crtd_On]             DATETIME      NULL,
    [Dt_Upd_On]              DATETIME      NULL,
    CONSTRAINT [PK_T_Transfer_Certificates] PRIMARY KEY CLUSTERED ([I_Transfer_Cert_Req_ID] ASC),
    CONSTRAINT [FK_T_Transfer_Certificates_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);


GO
CREATE NONCLUSTERED INDEX [IX_T_Transfer_Certificates]
    ON [dbo].[T_Transfer_Certificates]([I_Transfer_Cert_Req_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [NCI_I_Student_Detail_ID]
    ON [dbo].[T_Transfer_Certificates]([I_Student_Detail_ID] ASC);

