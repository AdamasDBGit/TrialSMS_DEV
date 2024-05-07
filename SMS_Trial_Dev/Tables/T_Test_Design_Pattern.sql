CREATE TABLE [EXAMINATION].[T_Test_Design_Pattern] (
    [I_Test_Design_Pattern_ID] INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Test_Design_ID]         INT            NULL,
    [I_Pool_ID]                INT            NULL,
    [I_No_Of_Questions]        INT            NULL,
    [I_Complexity_ID]          INT            NULL,
    [N_Marks]                  NUMERIC (8, 2) NULL,
    [S_Crtd_By]                VARCHAR (20)   NULL,
    [S_Upd_By]                 VARCHAR (20)   NULL,
    [Dt_Crtd_On]               DATETIME       NULL,
    [Dt_Upd_On]                DATETIME       NULL,
    CONSTRAINT [PK__T_Test_Design_Pa__54E16EFF] PRIMARY KEY CLUSTERED ([I_Test_Design_Pattern_ID] ASC),
    CONSTRAINT [FK__T_Test_De__I_Com__764262CA] FOREIGN KEY ([I_Complexity_ID]) REFERENCES [EXAMINATION].[T_Complexity_Master] ([I_Complexity_ID]),
    CONSTRAINT [FK__T_Test_De__I_Poo__77368703] FOREIGN KEY ([I_Pool_ID]) REFERENCES [EXAMINATION].[T_Pool_Master] ([I_Pool_ID]),
    CONSTRAINT [FK_T_Test_Design_Pattern_T_Test_Design] FOREIGN KEY ([I_Test_Design_ID]) REFERENCES [EXAMINATION].[T_Test_Design] ([I_Test_Design_ID])
);

