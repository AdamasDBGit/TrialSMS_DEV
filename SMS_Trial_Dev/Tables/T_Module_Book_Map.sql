CREATE TABLE [dbo].[T_Module_Book_Map] (
    [I_Module_Book_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Book_ID]        INT          NULL,
    [I_Module_ID]      INT          NULL,
    [S_Crtd_By]        VARCHAR (20) NULL,
    [S_Upd_By]         VARCHAR (20) NULL,
    [Dt_Crtd_On]       DATETIME     NULL,
    [Dt_Valid_From]    DATETIME     NULL,
    [Dt_Upd_On]        DATETIME     NULL,
    [Dt_Valid_To]      DATETIME     NULL,
    [I_Status]         INT          NULL,
    CONSTRAINT [PK__T_Module_Book_Ma__3A186A2A] PRIMARY KEY CLUSTERED ([I_Module_Book_ID] ASC),
    CONSTRAINT [FK__T_Module___I_Boo__257252FF] FOREIGN KEY ([I_Book_ID]) REFERENCES [dbo].[T_Book_Master] ([I_Book_ID]),
    CONSTRAINT [FK__T_Module___I_Boo__27ACA59A] FOREIGN KEY ([I_Book_ID]) REFERENCES [dbo].[T_Book_Master] ([I_Book_ID]),
    CONSTRAINT [FK__T_Module___I_Mod__7E78816F] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID])
);

