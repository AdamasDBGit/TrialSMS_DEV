CREATE TABLE [dbo].[T_Center_Functionality_Status] (
    [I_Center_Functionality_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Center_ID]               INT          NULL,
    [S_Status_Code]             VARCHAR (50) NULL,
    CONSTRAINT [PK_T_Center_Functionality_Status] PRIMARY KEY CLUSTERED ([I_Center_Functionality_ID] ASC),
    CONSTRAINT [FK_T_Center_Functionality_Status_T_Centre_Master] FOREIGN KEY ([I_Center_Functionality_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

