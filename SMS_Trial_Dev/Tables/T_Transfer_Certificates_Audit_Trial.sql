CREATE TABLE [dbo].[T_Transfer_Certificates_Audit_Trial] (
    [I_Transfer_Cert_History_Id] INT           IDENTITY (1, 1) NOT NULL,
    [I_Transfer_Cert_Req_ID]     INT           NOT NULL,
    [I_Transfer_Req_Status]      INT           NULL,
    [S_Remarks]                  VARCHAR (500) NULL,
    [Is_Released]                BIT           NULL,
    [S_Crtd_By]                  VARCHAR (20)  NULL,
    [Dt_Crtd_On]                 DATETIME      NULL,
    CONSTRAINT [PK_T_Transfer_Certificates_Audit_Trial] PRIMARY KEY CLUSTERED ([I_Transfer_Cert_History_Id] ASC),
    CONSTRAINT [FK_T_Transfer_Certificates_Audit_Trial_T_Transfer_Certificates] FOREIGN KEY ([I_Transfer_Cert_Req_ID]) REFERENCES [dbo].[T_Transfer_Certificates] ([I_Transfer_Cert_Req_ID])
);

