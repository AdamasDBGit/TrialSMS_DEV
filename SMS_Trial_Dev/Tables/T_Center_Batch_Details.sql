CREATE TABLE [dbo].[T_Center_Batch_Details] (
    [I_Batch_ID]                     INT             NOT NULL,
    [I_Centre_Id]                    INT             NOT NULL,
    [I_Course_Fee_Plan_ID]           INT             NULL,
    [I_Minimum_Regn_Amt]             DECIMAL (10, 2) NULL,
    [Max_Strength]                   INT             NULL,
    [I_Status]                       INT             NULL,
    [S_Crtd_By]                      VARCHAR (20)    NULL,
    [S_Updt_By]                      VARCHAR (20)    NULL,
    [Dt_Crtd_On]                     DATETIME        NULL,
    [Dt_Upd_On]                      DATETIME        NULL,
    [I_Employee_ID]                  INT             NULL,
    [B_Is_Eligibility_List_Prepared] BIT             NULL,
    [I_Min_Strength]                 INT             NULL,
    [I_Center_Dispatch_Scheme_ID]    INT             NULL,
    [S_ClassDays]                    VARCHAR (MAX)   NULL,
    [S_OfflineClassTime]             VARCHAR (MAX)   NULL,
    [S_OnlineClassTime]              VARCHAR (MAX)   NULL,
    [S_HandoutClassTime]             VARCHAR (MAX)   NULL,
    [S_ClassMode]                    VARCHAR (MAX)   NULL,
    [S_BatchTime]                    VARCHAR (MAX)   NULL,
    CONSTRAINT [PK_T_Center_Batch_Details] PRIMARY KEY CLUSTERED ([I_Batch_ID] ASC, [I_Centre_Id] ASC),
    CONSTRAINT [FK_T_Center_Batch_Details_T_Centre_Master] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK_T_Center_Batch_Details_T_Employee_Dtls] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK_T_Center_Batch_Details_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID])
);


GO
ALTER TABLE [dbo].[T_Center_Batch_Details] NOCHECK CONSTRAINT [FK_T_Center_Batch_Details_T_Employee_Dtls];


GO
ALTER TABLE [dbo].[T_Center_Batch_Details] NOCHECK CONSTRAINT [FK_T_Center_Batch_Details_T_Student_Batch_Master];



