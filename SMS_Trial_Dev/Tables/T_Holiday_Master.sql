CREATE TABLE [dbo].[T_Holiday_Master] (
    [I_Holiday_ID]          INT           IDENTITY (1, 1) NOT NULL,
    [I_Center_ID]           INT           NULL,
    [Dt_Holiday_Date]       DATETIME      NOT NULL,
    [S_Holiday_Description] VARCHAR (200) NOT NULL,
    [I_Brand_ID]            INT           NULL,
    CONSTRAINT [PK_T_Holiday_Master] PRIMARY KEY CLUSTERED ([I_Holiday_ID] ASC),
    CONSTRAINT [FK_T_Holiday_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Holiday_Master_T_Centre_Master] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);


GO
ALTER TABLE [dbo].[T_Holiday_Master] NOCHECK CONSTRAINT [FK_T_Holiday_Master_T_Brand_Master];



