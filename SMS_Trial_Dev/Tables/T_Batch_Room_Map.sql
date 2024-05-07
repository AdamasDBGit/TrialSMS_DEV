CREATE TABLE [dbo].[T_Batch_Room_Map] (
    [I_Batch_Room_ID] BIGINT       IDENTITY (1, 1) NOT NULL,
    [I_Batch_ID]      INT          NOT NULL,
    [I_Room_ID]       INT          NOT NULL,
    [I_Status]        INT          NULL,
    [S_Crtd_By]       VARCHAR (20) NULL,
    [Dt_Crtd_On]      DATETIME     NULL,
    [S_Upd_By]        VARCHAR (20) NULL,
    [Dt_Upd_On]       DATETIME     NULL,
    CONSTRAINT [PK_T_Batch_Room_Map] PRIMARY KEY CLUSTERED ([I_Batch_Room_ID] ASC),
    CONSTRAINT [FK_T_Batch_Room_Map_T_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID]),
    CONSTRAINT [FK_T_Batch_Room_Map_T_Room_Master] FOREIGN KEY ([I_Room_ID]) REFERENCES [dbo].[T_Room_Master] ([I_Room_ID])
);

