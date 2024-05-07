CREATE TABLE [dbo].[T_Module_Term_Map] (
    [I_Module_Term_ID] INT            IDENTITY (1, 1) NOT NULL,
    [I_Term_ID]        INT            NULL,
    [I_Module_ID]      INT            NULL,
    [I_Sequence]       INT            NULL,
    [C_Examinable]     CHAR (1)       NULL,
    [S_Crtd_By]        VARCHAR (20)   NULL,
    [S_Upd_By]         VARCHAR (20)   NULL,
    [Dt_Valid_From]    DATETIME       NULL,
    [Dt_Crtd_On]       DATETIME       NULL,
    [Dt_Valid_To]      DATETIME       NULL,
    [Dt_Upd_On]        DATETIME       NULL,
    [I_Status]         INT            NULL,
    [I_ModuleGroup_ID] INT            NULL,
    [N_Weightage]      NUMERIC (8, 2) NULL,
    [S_Remarks]        VARCHAR (200)  NULL,
    CONSTRAINT [PK__T_Module_Term_Ma__3DE8FB0E] PRIMARY KEY CLUSTERED ([I_Module_Term_ID] ASC),
    CONSTRAINT [FK__T_Module___I_Mod__02491253] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK__T_Module___I_Ter__0154EE1A] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID]),
    CONSTRAINT [FK_T_Module_Term_Map_T_ModuleGroup_Master] FOREIGN KEY ([I_ModuleGroup_ID]) REFERENCES [dbo].[T_ModuleGroup_Master] ([I_ModuleGroup_ID])
);


GO
CREATE NONCLUSTERED INDEX [index_Term_ID_Module_Term]
    ON [dbo].[T_Module_Term_Map]([I_Term_ID] ASC);

