CREATE TABLE [DOCUMENT].[T_User_Documents] (
    [I_Document_ID]         INT           IDENTITY (1, 1) NOT NULL,
    [I_Category_ID]         INT           NOT NULL,
    [I_Brand_ID]            INT           NOT NULL,
    [I_Hierarchy_Detail_ID] INT           NULL,
    [S_File_Name]           VARCHAR (250) NOT NULL,
    [S_File_Path]           VARCHAR (250) NOT NULL,
    [I_File_Size]           BIGINT        NOT NULL,
    [Dt_Expiry_Date]        DATETIME      NOT NULL,
    [I_Course_ID]           INT           NULL,
    [I_Term_ID]             INT           NULL,
    [I_Module_ID]           INT           NULL,
    [I_Batch_ID]            INT           NULL,
    [S_CreatedBy]           VARCHAR (50)  NULL,
    [Dt_CreatedOn]          DATETIME      NULL,
    [S_UpdatedBy]           VARCHAR (50)  NULL,
    [Dt_UpadtedOn]          DATETIME      NULL,
    [I_Status]              INT           NULL,
    CONSTRAINT [PK_T_User_Documents] PRIMARY KEY CLUSTERED ([I_Document_ID] ASC),
    CONSTRAINT [FK_T_User_Documents_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_User_Documents_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_User_Documents_T_Hierarchy_Details] FOREIGN KEY ([I_Hierarchy_Detail_ID]) REFERENCES [dbo].[T_Hierarchy_Details] ([I_Hierarchy_Detail_ID]),
    CONSTRAINT [FK_T_User_Documents_T_Module_Master] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK_T_User_Documents_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID]),
    CONSTRAINT [FK_T_User_Documents_T_Term_Master] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID])
);


GO
ALTER TABLE [DOCUMENT].[T_User_Documents] NOCHECK CONSTRAINT [FK_T_User_Documents_T_Brand_Master];


GO
ALTER TABLE [DOCUMENT].[T_User_Documents] NOCHECK CONSTRAINT [FK_T_User_Documents_T_Course_Master];


GO
ALTER TABLE [DOCUMENT].[T_User_Documents] NOCHECK CONSTRAINT [FK_T_User_Documents_T_Hierarchy_Details];


GO
ALTER TABLE [DOCUMENT].[T_User_Documents] NOCHECK CONSTRAINT [FK_T_User_Documents_T_Module_Master];


GO
ALTER TABLE [DOCUMENT].[T_User_Documents] NOCHECK CONSTRAINT [FK_T_User_Documents_T_Student_Batch_Master];


GO
ALTER TABLE [DOCUMENT].[T_User_Documents] NOCHECK CONSTRAINT [FK_T_User_Documents_T_Term_Master];



