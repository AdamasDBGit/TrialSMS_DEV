CREATE TABLE [dbo].[T_Fee_Sharing_Audit] (
    [I_Fee_Sharing_Audit_ID] INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Fee_Sharing_ID]       INT            NULL,
    [I_Brand_ID]             INT            NULL,
    [I_Country_ID]           INT            NULL,
    [I_Center_ID]            INT            NULL,
    [I_Course_ID]            INT            NULL,
    [I_Fee_Component_ID]     INT            NULL,
    [N_Company_Share]        NUMERIC (8, 4) NULL,
    [Dt_Period_Start]        DATETIME       NULL,
    [Dt_Period_End]          DATETIME       NULL,
    [I_Status]               INT            NULL,
    [S_Crtd_By]              VARCHAR (20)   NULL,
    [S_Upd_By]               VARCHAR (20)   NULL,
    [Dt_Crtd_On]             DATETIME       NULL,
    [Dt_Upd_On]              DATETIME       NULL,
    CONSTRAINT [PK_T_Fee_Sharing_Audit] PRIMARY KEY CLUSTERED ([I_Fee_Sharing_Audit_ID] ASC),
    CONSTRAINT [FK_T_Fee_Sharing_Audit_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [dbo].[T_Fee_Sharing_Audit] NOCHECK CONSTRAINT [FK_T_Fee_Sharing_Audit_T_Brand_Master];



