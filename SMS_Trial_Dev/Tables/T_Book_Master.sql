CREATE TABLE [dbo].[T_Book_Master] (
    [I_Book_ID]   INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Book_Name] VARCHAR (250)  NULL,
    [I_Brand_ID]  INT            NULL,
    [I_Status]    INT            NULL,
    [S_Book_Code] VARCHAR (250)  NULL,
    [S_Crtd_By]   VARCHAR (20)   NULL,
    [S_Book_Desc] VARCHAR (1000) NULL,
    [S_Upd_By]    VARCHAR (20)   NULL,
    [Dt_Crtd_On]  DATETIME       NULL,
    [Dt_Upd_On]   DATETIME       NULL,
    CONSTRAINT [PK__T_Book_Master__1F6473EE] PRIMARY KEY CLUSTERED ([I_Book_ID] ASC),
    CONSTRAINT [FK__T_Book_Ma__I_Bra__06EDCBDF] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [dbo].[T_Book_Master] NOCHECK CONSTRAINT [FK__T_Book_Ma__I_Bra__06EDCBDF];



