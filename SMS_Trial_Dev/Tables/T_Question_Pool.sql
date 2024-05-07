CREATE TABLE [EXAMINATION].[T_Question_Pool] (
    [I_Question_ID]           INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Pool_ID]               INT             NULL,
    [I_Answer_Type_ID]        INT             NULL,
    [S_Question]              NVARCHAR (2500) NULL,
    [S_Question_Options]      NVARCHAR (4000) NULL,
    [I_Question_Type]         TINYINT         NULL,
    [I_Document_ID]           INT             NULL,
    [I_Complexity_ID]         INT             NULL,
    [N_Question_Max_Marks]    NUMERIC (8, 2)  NULL,
    [Dt_Question_Upload_Date] DATETIME        NULL,
    [S_Crtd_By]               VARCHAR (20)    NULL,
    [S_Upd_By]                VARCHAR (20)    NULL,
    [Dt_Crtd_On]              DATETIME        NULL,
    [Dt_Upd_On]               DATETIME        NULL,
    CONSTRAINT [PK__T_Question_Pool__52F9268D] PRIMARY KEY CLUSTERED ([I_Question_ID] ASC),
    CONSTRAINT [FK__T_Questio__I_Com__745A1A58] FOREIGN KEY ([I_Complexity_ID]) REFERENCES [EXAMINATION].[T_Complexity_Master] ([I_Complexity_ID]),
    CONSTRAINT [FK__T_Questio__I_Poo__754E3E91] FOREIGN KEY ([I_Pool_ID]) REFERENCES [EXAMINATION].[T_Pool_Master] ([I_Pool_ID]),
    CONSTRAINT [FK_T_Question_Pool_T_Answer_Type_Master] FOREIGN KEY ([I_Answer_Type_ID]) REFERENCES [EXAMINATION].[T_Answer_Type_Master] ([I_Answer_Type_ID])
);

