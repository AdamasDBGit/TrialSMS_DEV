CREATE TABLE [EXAMINATION].[T_SubQuestion_Answer] (
    [I_SubQuestion_Answer_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Question_Paper_ID]     INT          NULL,
    [I_Question_ID]           INT          NULL,
    [I_SubQuestion_ID]        INT          NULL,
    [I_SubQuestion_Choice_ID] INT          NULL,
    [I_Marks]                 INT          NULL,
    [S_Crtd_By]               VARCHAR (20) NULL,
    [S_Upd_By]                VARCHAR (20) NULL,
    [Dt_Crtd_On]              DATETIME     NULL,
    [Dt_Upd_On]               DATETIME     NULL,
    CONSTRAINT [PK__T_SubQuestion_An__66B60677] PRIMARY KEY CLUSTERED ([I_SubQuestion_Answer_ID] ASC),
    CONSTRAINT [FK__T_SubQues__I_Que__0584A65A] FOREIGN KEY ([I_Question_ID]) REFERENCES [EXAMINATION].[T_Question_Pool] ([I_Question_ID]),
    CONSTRAINT [FK__T_SubQues__I_Que__076CEECC] FOREIGN KEY ([I_Question_ID]) REFERENCES [EXAMINATION].[T_Question_Pool] ([I_Question_ID]),
    CONSTRAINT [FK__T_SubQues__I_Que__100D21C5] FOREIGN KEY ([I_Question_Paper_ID]) REFERENCES [EXAMINATION].[T_Question_Paper] ([I_Question_Paper_ID]),
    CONSTRAINT [FK__T_SubQues__I_Que__11F56A37] FOREIGN KEY ([I_Question_Paper_ID]) REFERENCES [EXAMINATION].[T_Question_Paper] ([I_Question_Paper_ID]),
    CONSTRAINT [FK__T_SubQues__I_Sub__0955373E] FOREIGN KEY ([I_SubQuestion_Choice_ID]) REFERENCES [EXAMINATION].[T_SubQuestion_Choice] ([I_SubQuestion_Choice_ID]),
    CONSTRAINT [FK__T_SubQues__I_Sub__0B3D7FB0] FOREIGN KEY ([I_SubQuestion_Choice_ID]) REFERENCES [EXAMINATION].[T_SubQuestion_Choice] ([I_SubQuestion_Choice_ID]),
    CONSTRAINT [FK__T_SubQues__I_Sub__13DDB2A9] FOREIGN KEY ([I_SubQuestion_ID]) REFERENCES [EXAMINATION].[T_SubQuestion] ([I_SubQuestion_ID]),
    CONSTRAINT [FK__T_SubQues__I_Sub__15C5FB1B] FOREIGN KEY ([I_SubQuestion_ID]) REFERENCES [EXAMINATION].[T_SubQuestion] ([I_SubQuestion_ID])
);

