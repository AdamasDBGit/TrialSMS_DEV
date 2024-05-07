CREATE TABLE [dbo].[T_Login_Trail] (
    [I_Login_Trail_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_User_ID]        INT          NULL,
    [Dt_Login_Time]    DATETIME     NULL,
    [Dt_Logout_Time]   DATETIME     NULL,
    [S_UserSessionID]  VARCHAR (50) NULL,
    [S_IP_Address]     VARCHAR (50) NULL,
    CONSTRAINT [PK_T_Login_Trail] PRIMARY KEY CLUSTERED ([I_Login_Trail_ID] ASC),
    CONSTRAINT [FK_T_Login_Trail_T_User_Master] FOREIGN KEY ([I_User_ID]) REFERENCES [dbo].[T_User_Master] ([I_User_ID])
);

