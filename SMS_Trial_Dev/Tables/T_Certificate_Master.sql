CREATE TABLE [dbo].[T_Certificate_Master] (
    [I_Certificate_ID]          INT           IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]                INT           NULL,
    [I_Template_ID]             INT           NULL,
    [S_Certificate_Name]        VARCHAR (300) NULL,
    [S_Certificate_Description] VARCHAR (300) NULL,
    [S_Certificate_Type]        VARCHAR (10)  NULL,
    [I_Status]                  INT           NULL,
    [S_Crtd_By]                 VARCHAR (20)  NULL,
    [S_Upd_By]                  VARCHAR (20)  NULL,
    [Dt_Crtd_On]                DATETIME      NULL,
    [Dt_Upd_On]                 DATETIME      NULL,
    CONSTRAINT [PK__T_Certificate_Ma__1B93E30A] PRIMARY KEY CLUSTERED ([I_Certificate_ID] ASC),
    CONSTRAINT [FK__T_Certifi__I_Bra__022916C2] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Certificate_Master_T_Template_Master] FOREIGN KEY ([I_Template_ID]) REFERENCES [dbo].[T_Template_Master] ([I_Template_ID])
);


GO
ALTER TABLE [dbo].[T_Certificate_Master] NOCHECK CONSTRAINT [FK__T_Certifi__I_Bra__022916C2];


GO
ALTER TABLE [dbo].[T_Certificate_Master] NOCHECK CONSTRAINT [FK_T_Certificate_Master_T_Template_Master];



