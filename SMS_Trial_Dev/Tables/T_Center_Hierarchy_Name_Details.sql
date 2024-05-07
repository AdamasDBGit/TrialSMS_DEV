CREATE TABLE [dbo].[T_Center_Hierarchy_Name_Details] (
    [I_Center_ID]           INT           NOT NULL,
    [S_Center_Name]         VARCHAR (100) NULL,
    [I_Brand_ID]            INT           NULL,
    [S_Brand_Name]          VARCHAR (100) NULL,
    [I_Region_ID]           INT           NULL,
    [S_Region_Name]         VARCHAR (100) NULL,
    [I_Territory_ID]        INT           NULL,
    [S_Territiry_Name]      VARCHAR (100) NULL,
    [I_City_ID]             INT           NULL,
    [S_City_Name]           VARCHAR (100) NULL,
    [I_Hierarchy_Detail_ID] INT           NULL,
    CONSTRAINT [PK_T_Center_Hierarchy_Name_Details] PRIMARY KEY CLUSTERED ([I_Center_ID] ASC),
    CONSTRAINT [FK_T_Center_Hierarchy_Name_Details_T_Centre_Master] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

