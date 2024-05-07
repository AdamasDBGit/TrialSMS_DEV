CREATE TABLE [dbo].[T_Center_Timeslot_Master] (
    [I_TimeSlot_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]    INT          NOT NULL,
    [I_Center_ID]   INT          NOT NULL,
    [Dt_Start_Time] DATETIME     NOT NULL,
    [Dt_End_Time]   DATETIME     NOT NULL,
    [I_Status]      INT          NOT NULL,
    [S_Crtd_By]     VARCHAR (20) NOT NULL,
    [Dt_Crtd_On]    DATETIME     NOT NULL,
    [S_Updt_By]     VARCHAR (20) NULL,
    [Dt_Updt_On]    DATETIME     NULL,
    CONSTRAINT [PK_T_Center_Timeslot_Master] PRIMARY KEY CLUSTERED ([I_TimeSlot_ID] ASC),
    CONSTRAINT [FK_T_Center_Timeslot_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK_T_Center_Timeslot_Master_T_Centre_Master] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

