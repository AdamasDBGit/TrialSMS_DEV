CREATE TABLE [dbo].[T_Content_Employee_Dtl] (
    [I_Content_Emp_Dtl_ID]       INT          IDENTITY (1, 1) NOT NULL,
    [I_Batch_Content_Details_ID] INT          NOT NULL,
    [I_Brand_ID]                 INT          NULL,
    [I_User_ID]                  INT          NULL,
    [Dt_Expiry_Date]             DATETIME     NULL,
    [I_Status_Id]                INT          NULL,
    [S_Crtd_By]                  VARCHAR (50) NULL,
    [S_Upd_By]                   VARCHAR (50) NULL,
    [Dt_Crtd_On]                 DATETIME     NULL,
    [Dt_Upd_On]                  DATETIME     NULL,
    CONSTRAINT [PK_T_Content_Employee_Dtl] PRIMARY KEY CLUSTERED ([I_Content_Emp_Dtl_ID] ASC),
    CONSTRAINT [FK_T_Content_Employee_Dtl_T_Batch_Content_Details] FOREIGN KEY ([I_Batch_Content_Details_ID]) REFERENCES [dbo].[T_Batch_Content_Details] ([I_Batch_Content_Details_ID]),
    CONSTRAINT [FK_T_Content_Employee_Dtl_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Content_Employee_Dtl_T_User_Master] FOREIGN KEY ([I_User_ID]) REFERENCES [dbo].[T_User_Master] ([I_User_ID])
);


GO
ALTER TABLE [dbo].[T_Content_Employee_Dtl] NOCHECK CONSTRAINT [FK_T_Content_Employee_Dtl_T_Brand_Master];



