CREATE TABLE [dbo].[T_Student_Sub_Batch_Master] (
    [I_Sub_Batch_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [I_Batch_ID]       INT           NOT NULL,
    [S_Sub_Batch_Code] VARCHAR (50)  NULL,
    [S_Sub_Batch_Name] VARCHAR (100) NULL,
    [I_Status]         INT           NULL,
    [S_Crtd_By]        VARCHAR (20)  NULL,
    [S_Updt_By]        VARCHAR (20)  NULL,
    [Dt_Crtd_On]       DATETIME      NULL,
    [Dt_Upd_On]        DATETIME      NULL,
    CONSTRAINT [PK_T_Student_Sub_Batch_Master] PRIMARY KEY CLUSTERED ([I_Sub_Batch_ID] ASC),
    CONSTRAINT [FK_T_Student_Sub_Batch_Master_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);


GO
ALTER TABLE [dbo].[T_Student_Sub_Batch_Master] NOCHECK CONSTRAINT [FK_T_Student_Sub_Batch_Master_T_Student_Batch_Master];



