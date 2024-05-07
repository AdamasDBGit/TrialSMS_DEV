CREATE TABLE [dbo].[T_State_Master] (
    [I_State_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_State_Code] VARCHAR (10) NULL,
    [S_State_Name] VARCHAR (50) NULL,
    [I_Country_ID] INT          NULL,
    [I_Status]     INT          NULL,
    [S_Crtd_By]    VARCHAR (20) NULL,
    [S_Upd_By]     VARCHAR (20) NULL,
    [Dt_Crtd_On]   DATETIME     NULL,
    [Dt_Upd_On]    DATETIME     NULL,
    CONSTRAINT [PK__T_State_Master__047B7388] PRIMARY KEY CLUSTERED ([I_State_ID] ASC),
    CONSTRAINT [FK__T_State_M__I_Cou__01142BA1] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_State_M__I_Cou__02084FDA] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID])
);

