CREATE TABLE [dbo].[T_Session_Module_Map] (
    [I_Session_Module_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Module_ID]         INT          NULL,
    [I_Session_ID]        INT          NULL,
    [I_Sequence]          INT          NULL,
    [S_Crtd_By]           VARCHAR (20) NULL,
    [S_Upd_By]            VARCHAR (20) NULL,
    [Dt_Valid_From]       DATETIME     NULL,
    [Dt_Crtd_On]          DATETIME     NULL,
    [Dt_Valid_To]         DATETIME     NULL,
    [Dt_Upd_On]           DATETIME     NULL,
    [I_Status]            INT          NULL,
    CONSTRAINT [PK__T_Session_Module__77568294] PRIMARY KEY CLUSTERED ([I_Session_Module_ID] ASC),
    CONSTRAINT [FK__T_Session__I_Mod__6F363DDF] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK__T_Session__I_Ses__702A6218] FOREIGN KEY ([I_Session_ID]) REFERENCES [dbo].[T_Session_Master] ([I_Session_ID])
);


GO
ALTER TABLE [dbo].[T_Session_Module_Map] NOCHECK CONSTRAINT [FK__T_Session__I_Ses__702A6218];




GO
CREATE NONCLUSTERED INDEX [index_Module_ID_Session_Module]
    ON [dbo].[T_Session_Module_Map]([I_Module_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [NC_T_Session_Module_Map_I_Status]
    ON [dbo].[T_Session_Module_Map]([I_Status] ASC)
    INCLUDE([I_Session_Module_ID], [I_Module_ID], [I_Session_ID], [I_Sequence], [Dt_Valid_From], [Dt_Valid_To]);

