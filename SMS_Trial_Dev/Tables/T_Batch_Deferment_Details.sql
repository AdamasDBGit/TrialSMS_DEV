CREATE TABLE [dbo].[T_Batch_Deferment_Details] (
    [I_Batch_Deferment_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [I_Batch_ID]               INT           NULL,
    [Dt_Batch_Hold_Start_Date] DATETIME      NULL,
    [Dt_Batch_Hold_End_Date]   DATETIME      NULL,
    [Dt_Crtd_On]               DATETIME      NULL,
    [S_Crtd_By]                VARCHAR (20)  NULL,
    [S_Comment]                VARCHAR (200) NULL,
    CONSTRAINT [PK_T_Batch_Deferment_Details] PRIMARY KEY CLUSTERED ([I_Batch_Deferment_ID] ASC),
    CONSTRAINT [FK_T_Batch_Deferment_Details_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);

