CREATE TABLE [dbo].[T_Grading_Pattern_Master] (
    [I_Grading_Pattern_ID] INT          IDENTITY (1, 1) NOT NULL,
    [S_Pattern_Name]       VARCHAR (20) NULL,
    [I_Status]             INT          NULL,
    [S_Crtd_By]            VARCHAR (20) NULL,
    [S_Upd_By]             VARCHAR (20) NULL,
    [Dt_Crtd_On]           DATETIME     NULL,
    [Dt_Upd_On]            DATETIME     NULL,
    [I_Brand_ID]           INT          NULL,
    CONSTRAINT [PK__T_Grading_Patter__54425081] PRIMARY KEY CLUSTERED ([I_Grading_Pattern_ID] ASC),
    CONSTRAINT [FK__T_Grading__I_Bra__1042F746] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_Grading__I_Bra__1D2F1727] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);

