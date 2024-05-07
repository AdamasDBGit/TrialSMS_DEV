CREATE TABLE [EOS].[T_Employee_Training_Details] (
    [I_Employee_Training_Details_ID] INT IDENTITY (1, 1) NOT NULL,
    [I_Employee_ID]                  INT NULL,
    [I_Training_ID]                  INT NULL,
    [I_Document_ID]                  INT NULL,
    [I_Feedback_Given]               INT NULL,
    CONSTRAINT [FK_T_Employee_Training_Details_T_Employee_Dtls] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK_T_Employee_Training_Details_T_Employee_Training_Master] FOREIGN KEY ([I_Training_ID]) REFERENCES [EOS].[T_Employee_Training_Master] ([I_Training_ID])
);

