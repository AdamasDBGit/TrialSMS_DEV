CREATE TABLE [ACADEMICS].[T_E_Project_Spec] (
    [I_E_Project_Spec_ID]  INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Course_ID]          INT           NULL,
    [I_Term_ID]            INT           NULL,
    [I_Module_ID]          INT           NULL,
    [S_Description]        VARCHAR (500) NULL,
    [I_File_ID]            INT           NULL,
    [Dt_Last_Allocated_On] DATETIME      NULL,
    [S_Crtd_By]            VARCHAR (20)  NULL,
    [S_Upd_By]             VARCHAR (20)  NULL,
    [Dt_Crtd_On]           DATETIME      NULL,
    [Dt_Upd_On]            DATETIME      NULL,
    [I_Status]             INT           NOT NULL,
    [Dt_Valid_To]          DATETIME      NULL,
    CONSTRAINT [PK__E_Project_Spec__11957784] PRIMARY KEY CLUSTERED ([I_E_Project_Spec_ID] ASC),
    CONSTRAINT [FK__E_Project__I_Cou__4238AEDF] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__E_Project__I_Mod__46FD63FC] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK__E_Project__I_Ter__49D9D0A7] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID]),
    CONSTRAINT [FK_E_Project_Spec_E_Project_Spec] FOREIGN KEY ([I_E_Project_Spec_ID]) REFERENCES [ACADEMICS].[T_E_Project_Spec] ([I_E_Project_Spec_ID])
);


GO
ALTER TABLE [ACADEMICS].[T_E_Project_Spec] NOCHECK CONSTRAINT [FK__E_Project__I_Cou__4238AEDF];



