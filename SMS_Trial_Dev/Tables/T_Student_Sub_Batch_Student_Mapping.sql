CREATE TABLE [dbo].[T_Student_Sub_Batch_Student_Mapping] (
    [T_Student_Sub_Batch_Student_Mapping_Id] BIGINT        IDENTITY (1, 1) NOT NULL,
    [I_Sub_Batch_ID]                         INT           NULL,
    [S_Student_ID]                           VARCHAR (500) NULL,
    [I_Batch_ID]                             INT           NOT NULL,
    [I_Status]                               INT           NULL,
    [S_Crtd_By]                              VARCHAR (20)  NULL,
    [S_Updt_By]                              VARCHAR (20)  NULL,
    [Dt_Crtd_On]                             DATETIME      NULL,
    [Dt_Upd_On]                              DATETIME      NULL,
    [I_Student_Detail_ID]                    INT           NOT NULL,
    CONSTRAINT [PK_T_Student_Sub_Batch_Student_Mapping] PRIMARY KEY CLUSTERED ([T_Student_Sub_Batch_Student_Mapping_Id] ASC),
    CONSTRAINT [FK_T_Student_Sub_Batch_Student_Mapping_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID]),
    CONSTRAINT [FK_T_Student_Sub_Batch_Student_Mapping_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Student_Sub_Batch_Student_Mapping_T_Student_Sub_Batch_Master] FOREIGN KEY ([I_Sub_Batch_ID]) REFERENCES [dbo].[T_Student_Sub_Batch_Master] ([I_Sub_Batch_ID])
);

