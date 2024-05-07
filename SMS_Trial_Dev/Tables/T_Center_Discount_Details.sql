CREATE TABLE [dbo].[T_Center_Discount_Details] (
    [I_Center_Discount_Id]  INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Center_Id]           INT            NULL,
    [I_Hierarchy_Level_Id]  INT            NULL,
    [I_Hierarchy_Detail_ID] INT            NULL,
    [N_Discount_Percentage] DECIMAL (4, 2) NULL,
    [I_Status]              INT            NULL,
    [S_Crtd_By]             VARCHAR (20)   NULL,
    [S_Upd_By]              VARCHAR (20)   NULL,
    [Dt_Crtd_On]            DATETIME       NULL,
    [Dt_Upd_On]             DATETIME       NULL,
    [I_Brand_Id]            INT            NULL,
    [I_Discount_Amount]     INT            NULL,
    CONSTRAINT [PK_T_Center_Discount_Details] PRIMARY KEY CLUSTERED ([I_Center_Discount_Id] ASC),
    CONSTRAINT [FK_T_Center_Discount_Details_T_Centre_Master] FOREIGN KEY ([I_Center_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Center_Discount_Details_T_Hierarchy_Details] FOREIGN KEY ([I_Hierarchy_Detail_ID]) REFERENCES [dbo].[T_Hierarchy_Details] ([I_Hierarchy_Detail_ID]),
    CONSTRAINT [FK_T_Center_Discount_Details_T_Hierarchy_Level_Master] FOREIGN KEY ([I_Hierarchy_Level_Id]) REFERENCES [dbo].[T_Hierarchy_Level_Master] ([I_Hierarchy_Level_Id])
);

