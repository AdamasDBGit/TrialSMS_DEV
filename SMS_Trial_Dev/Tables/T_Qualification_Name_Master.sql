CREATE TABLE [dbo].[T_Qualification_Name_Master] (
    [I_Qualification_Name_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Qualification_Type_ID] INT          NULL,
    [S_Qualification_Name]    VARCHAR (50) NULL,
    [S_Crtd_By]               VARCHAR (20) NULL,
    [I_Status]                INT          NULL,
    [S_Upd_By]                VARCHAR (20) NULL,
    [Dt_Crtd_On]              DATETIME     NULL,
    [Dt_Upd_On]               DATETIME     NULL,
    CONSTRAINT [PK__T_Qualification___0169FCB3] PRIMARY KEY CLUSTERED ([I_Qualification_Name_ID] ASC),
    CONSTRAINT [FK__T_Qualifi__I_Qua__3041EB9B] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID]),
    CONSTRAINT [FK__T_Qualifi__I_Qua__3079F157] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID]),
    CONSTRAINT [FK__T_Qualifi__I_Qua__31360FD4] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID]),
    CONSTRAINT [FK__T_Qualifi__I_Qua__316E1590] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID]),
    CONSTRAINT [FK__T_Qualifi__I_Qua__322A340D] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID]),
    CONSTRAINT [FK__T_Qualifi__I_Qua__326239C9] FOREIGN KEY ([I_Qualification_Type_ID]) REFERENCES [dbo].[T_Qualification_Type_Master] ([I_Qualification_Type_ID])
);

