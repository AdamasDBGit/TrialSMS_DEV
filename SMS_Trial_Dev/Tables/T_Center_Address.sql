CREATE TABLE [NETWORK].[T_Center_Address] (
    [I_Center_Address_ID]   INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Centre_Id]           INT           NULL,
    [S_Center_Address1]     VARCHAR (100) NULL,
    [S_Center_Address2]     VARCHAR (100) NULL,
    [I_City_ID]             INT           NULL,
    [I_State_ID]            INT           NULL,
    [S_Pin_Code]            VARCHAR (10)  NULL,
    [I_Country_ID]          INT           NULL,
    [S_Telephone_No]        VARCHAR (20)  NULL,
    [S_Email_ID]            VARCHAR (50)  NULL,
    [S_Delivery_Address1]   VARCHAR (100) NULL,
    [S_Delivery_Address2]   VARCHAR (100) NULL,
    [I_Delivery_City_ID]    INT           NULL,
    [I_Delivery_State_ID]   INT           NULL,
    [S_Delivery_Pin_No]     VARCHAR (20)  NULL,
    [I_Delivery_Country_ID] INT           NULL,
    [S_Delivery_Phone_No]   VARCHAR (20)  NULL,
    [S_Delivery_Email_ID]   VARCHAR (50)  NULL,
    CONSTRAINT [PK__T_Center_Address__56757D0D] PRIMARY KEY CLUSTERED ([I_Center_Address_ID] ASC),
    CONSTRAINT [FK__T_Center___I_Cen__7BA701BC] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Center___I_Cit__7D8F4A2E] FOREIGN KEY ([I_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK__T_Center___I_Cou__7E836E67] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_Center___I_Sta__7C9B25F5] FOREIGN KEY ([I_State_ID]) REFERENCES [dbo].[T_State_Master] ([I_State_ID])
);


GO
ALTER TABLE [NETWORK].[T_Center_Address] NOCHECK CONSTRAINT [FK__T_Center___I_Cit__7D8F4A2E];


GO
ALTER TABLE [NETWORK].[T_Center_Address] NOCHECK CONSTRAINT [FK__T_Center___I_Sta__7C9B25F5];



