CREATE TABLE [ACADEMICS].[T_FAQ_Details] (
    [I_FAQ_ID]               INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_E_Project_Spec_ID]    INT            NULL,
    [S_Question_Description] VARCHAR (8000) NULL,
    [S_Answer_Description]   VARCHAR (8000) NULL,
    [I_Status]               INT            NULL,
    [S_Crtd_By]              VARCHAR (20)   NULL,
    [S_Upd_By]               VARCHAR (20)   NULL,
    [Dt_Crtd_On]             DATETIME       NULL,
    [Dt_Upd_On]              DATETIME       NULL,
    [I_Query_Posting_ID]     INT            NULL,
    CONSTRAINT [PK__T_FAQ_Details__2A61254E] PRIMARY KEY CLUSTERED ([I_FAQ_ID] ASC),
    CONSTRAINT [FK__T_FAQ_Det__I_E_P__0E4EF685] FOREIGN KEY ([I_E_Project_Spec_ID]) REFERENCES [ACADEMICS].[T_E_Project_Spec] ([I_E_Project_Spec_ID]),
    CONSTRAINT [FK__T_FAQ_Det__I_Que__3303BA4C] FOREIGN KEY ([I_Query_Posting_ID]) REFERENCES [ACADEMICS].[T_Query_Posting] ([I_Query_Posting_ID]),
    CONSTRAINT [FK__T_FAQ_Det__I_Que__7CF751BF] FOREIGN KEY ([I_Query_Posting_ID]) REFERENCES [ACADEMICS].[T_Query_Posting] ([I_Query_Posting_ID])
);

