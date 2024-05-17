CREATE TABLE [dbo].[T_Courier_Master] (
    [I_Courier_ID]     INT          IDENTITY (1, 1) NOT NULL,
    [S_Courier_Code]   VARCHAR (20) NULL,
    [S_Courier_Name]   VARCHAR (50) NULL,
    [Dt_Start_Date]    DATETIME     NULL,
    [Dt_End_Date]      DATETIME     NULL,
    [S_Address_Line1]  VARCHAR (50) NULL,
    [S_Address_Line2]  VARCHAR (50) NULL,
    [I_Country_ID]     INT          NULL,
    [I_State_ID]       INT          NULL,
    [I_City_ID]        INT          NULL,
    [S_Pincode]        VARCHAR (10) NULL,
    [S_Telephone_No]   VARCHAR (20) NULL,
    [S_Contact_Person] VARCHAR (50) NULL,
    [I_Status]         INT          NULL,
    [S_Crtd_By]        VARCHAR (20) NULL,
    [S_Upd_By]         VARCHAR (20) NULL,
    [Dt_Crtd_On]       DATETIME     NULL,
    [Dt_Upd_On]        DATETIME     NULL,
    CONSTRAINT [PK__T_Courier_Master__0663BBFA] PRIMARY KEY CLUSTERED ([I_Courier_ID] ASC),
    CONSTRAINT [FK__T_Courier__I_Cit__2AF6222B] FOREIGN KEY ([I_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK__T_Courier__I_Cit__54B4563B] FOREIGN KEY ([I_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK__T_Courier__I_Cou__03F0984C] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_Courier__I_Sta__2CDE6A9D] FOREIGN KEY ([I_State_ID]) REFERENCES [dbo].[T_State_Master] ([I_State_ID]),
    CONSTRAINT [FK__T_Courier__I_Sta__569C9EAD] FOREIGN KEY ([I_State_ID]) REFERENCES [dbo].[T_State_Master] ([I_State_ID])
);


GO
ALTER TABLE [dbo].[T_Courier_Master] NOCHECK CONSTRAINT [FK__T_Courier__I_Cit__2AF6222B];


GO
ALTER TABLE [dbo].[T_Courier_Master] NOCHECK CONSTRAINT [FK__T_Courier__I_Cit__54B4563B];


GO
ALTER TABLE [dbo].[T_Courier_Master] NOCHECK CONSTRAINT [FK__T_Courier__I_Sta__2CDE6A9D];


GO
ALTER TABLE [dbo].[T_Courier_Master] NOCHECK CONSTRAINT [FK__T_Courier__I_Sta__569C9EAD];



