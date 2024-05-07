CREATE TABLE [dbo].[T_Center_TimeSlot] (
    [I_TimeSlot_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [I_Centre_Id]     INT           NULL,
    [S_TimeSlot_Code] VARCHAR (20)  NULL,
    [S_TimeSlot_Desc] VARCHAR (50)  NULL,
    [I_Status]        INT           NULL,
    [S_Crtd_By]       VARCHAR (500) NULL,
    [S_Upd_By]        VARCHAR (500) NULL,
    [Dt_Crtd_On]      DATETIME      NULL,
    [Dt_Upd_On]       DATETIME      NULL,
    CONSTRAINT [PK__T_Center_TimeSlo__75392FF8] PRIMARY KEY CLUSTERED ([I_TimeSlot_ID] ASC),
    CONSTRAINT [FK__T_Center___I_Cen__32423E38] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

