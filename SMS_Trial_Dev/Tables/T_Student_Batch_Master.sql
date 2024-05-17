﻿CREATE TABLE [dbo].[T_Student_Batch_Master] (
    [I_Batch_ID]                  INT           IDENTITY (1, 1) NOT NULL,
    [S_Batch_Code]                VARCHAR (50)  NULL,
    [I_Course_ID]                 INT           NULL,
    [I_Class_ID]                  INT           NULL,
    [I_Section_ID]                INT           NULL,
    [I_School_Session_ID]         INT           NULL,
    [I_Delivery_Pattern_ID]       INT           NULL,
    [I_TimeSlot_ID]               INT           NULL,
    [Dt_BatchStartDate]           DATETIME      NULL,
    [I_Status]                    INT           NULL,
    [Dt_Course_Expected_End_Date] DATETIME      NULL,
    [Dt_Course_Actual_End_Date]   DATETIME      NULL,
    [S_Crtd_By]                   VARCHAR (20)  NULL,
    [S_Updt_By]                   VARCHAR (20)  NULL,
    [Dt_Crtd_On]                  DATETIME      NULL,
    [Dt_Upd_On]                   DATETIME      NULL,
    [b_IsHOBatch]                 BIT           NULL,
    [I_User_ID]                   INT           NULL,
    [S_Batch_Name]                VARCHAR (100) NULL,
    [b_IsApproved]                BIT           NULL,
    [I_Admission_GraceDays]       INT           NULL,
    [b_IsCorporateBatch]          BIT           NULL,
    [I_Latefee_Grace_Day]         INT           NULL,
    [Dt_BatchIntroductionDate]    DATETIME      NULL,
    [s_BatchIntroductionTime]     VARCHAR (250) NULL,
    [I_BatchType]                 INT           NULL,
    [Dt_MBatchStartDate]          DATETIME      NULL,
    [I_Language_ID]               INT           NULL,
    [I_Language_Name]             VARCHAR (200) NULL,
    [I_Category_ID]               INT           NULL,
    [Admission_AfterStartDate]    BIT           CONSTRAINT [DF__T_Student__Admis__33C0A420] DEFAULT ((0)) NOT NULL,
    [Is_Cyclic_Batch]             BIT           DEFAULT ('False') NULL,
    CONSTRAINT [PK_T_Student_Batch_Master] PRIMARY KEY CLUSTERED ([I_Batch_ID] ASC),
    CONSTRAINT [FK_T_Student_Batch_Master_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_Student_Batch_Master_T_Delivery_Pattern_Master] FOREIGN KEY ([I_Delivery_Pattern_ID]) REFERENCES [dbo].[T_Delivery_Pattern_Master] ([I_Delivery_Pattern_ID]),
    CONSTRAINT [FK_T_Student_Batch_Master_T_Student_Batch_Master] FOREIGN KEY ([I_Batch_ID]) REFERENCES [dbo].[T_Student_Batch_Master] ([I_Batch_ID]),
    CONSTRAINT [FK_T_Student_Batch_Master_T_TimeSlot_Master] FOREIGN KEY ([I_TimeSlot_ID]) REFERENCES [dbo].[T_TimeSlot_Master] ([I_TimeSlot_ID]),
    CONSTRAINT [FK_T_Student_Batch_Master_T_User_Master] FOREIGN KEY ([I_User_ID]) REFERENCES [dbo].[T_User_Master] ([I_User_ID])
);


GO
ALTER TABLE [dbo].[T_Student_Batch_Master] NOCHECK CONSTRAINT [FK_T_Student_Batch_Master_T_Course_Master];


GO
ALTER TABLE [dbo].[T_Student_Batch_Master] NOCHECK CONSTRAINT [FK_T_Student_Batch_Master_T_Delivery_Pattern_Master];


GO
ALTER TABLE [dbo].[T_Student_Batch_Master] NOCHECK CONSTRAINT [FK_T_Student_Batch_Master_T_Student_Batch_Master];



