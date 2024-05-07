CREATE TABLE [dbo].[T_User_Video_Access_Trail] (
    [I_Video_Access_Trail_ID]    INT          IDENTITY (1, 1) NOT NULL,
    [I_User_ID]                  INT          NULL,
    [I_Batch_Content_Details_ID] INT          NULL,
    [Dt_Login_Time]              DATETIME     NULL,
    [Dt_Logout_Time]             DATETIME     NULL,
    [S_IP_Address]               VARCHAR (50) NULL,
    CONSTRAINT [PK_T_User_Video_Access_Trail] PRIMARY KEY CLUSTERED ([I_Video_Access_Trail_ID] ASC),
    CONSTRAINT [FK_T_User_Video_Access_Trail_T_Batch_Content_Details] FOREIGN KEY ([I_Batch_Content_Details_ID]) REFERENCES [dbo].[T_Batch_Content_Details] ([I_Batch_Content_Details_ID]),
    CONSTRAINT [FK_T_User_Video_Access_Trail_T_User_Master] FOREIGN KEY ([I_User_ID]) REFERENCES [dbo].[T_User_Master] ([I_User_ID])
);

