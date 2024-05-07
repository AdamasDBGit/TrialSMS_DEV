CREATE TABLE [dbo].[T_City_Master] (
    [I_City_ID]    INT          IDENTITY (1, 1) NOT NULL,
    [S_City_Code]  VARCHAR (10) NULL,
    [S_City_Name]  VARCHAR (50) NULL,
    [I_Country_ID] INT          NULL,
    [I_Status]     CHAR (1)     NULL,
    [S_Crtd_By]    VARCHAR (20) NULL,
    [S_Upd_By]     VARCHAR (20) NULL,
    [Dt_Crtd_On]   DATETIME     NULL,
    [Dt_Upd_On]    DATETIME     NULL,
    [I_State_ID]   INT          NULL,
    CONSTRAINT [PK__T_City_Master__02932B16] PRIMARY KEY CLUSTERED ([I_City_ID] ASC),
    CONSTRAINT [FK__T_City_Ma__I_Cou__00200768] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_City_Ma__I_Cou__7F2BE32F] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID])
);

