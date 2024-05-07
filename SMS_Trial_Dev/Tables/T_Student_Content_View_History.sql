CREATE TABLE [STUDENTFEATURES].[T_Student_Content_View_History] (
    [I_Student_Content_View_History_ID] INT      IDENTITY (1, 1) NOT NULL,
    [I_Batch_Content_Details_ID]        INT      NULL,
    [I_Student_Detail_ID]               INT      NULL,
    [Dt_Content_Viewed_On]              DATETIME NULL,
    CONSTRAINT [PK_STUDENTFEATURES.T_Student_Content_View_History] PRIMARY KEY CLUSTERED ([I_Student_Content_View_History_ID] ASC),
    CONSTRAINT [FK_T_Student_Content_View_History_T_Batch_Content_Details] FOREIGN KEY ([I_Batch_Content_Details_ID]) REFERENCES [dbo].[T_Batch_Content_Details] ([I_Batch_Content_Details_ID]),
    CONSTRAINT [FK_T_Student_Content_View_History_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);

