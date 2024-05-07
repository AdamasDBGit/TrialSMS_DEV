CREATE TABLE [dbo].[T_Student_Transport_History] (
    [I_Student_Detail_ID]       INT          NOT NULL,
    [I_PickupPoint_ID]          INT          NOT NULL,
    [I_Route_ID]                INT          NOT NULL,
    [Dt_Transport_Deactivation] DATETIME     NULL,
    [S_Crtd_By]                 VARCHAR (50) NULL,
    [Dt_Crtd_On]                DATETIME     NULL,
    [S_Updt_By]                 VARCHAR (50) NULL,
    [Dt_Updt_On]                DATETIME     NULL,
    CONSTRAINT [FK_T_Student_Transport_History_T_BusRoute_Master] FOREIGN KEY ([I_Route_ID]) REFERENCES [dbo].[T_BusRoute_Master] ([I_Route_ID]),
    CONSTRAINT [FK_T_Student_Transport_History_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK_T_Student_Transport_History_T_Transport_Master] FOREIGN KEY ([I_PickupPoint_ID]) REFERENCES [dbo].[T_Transport_Master] ([I_PickupPoint_ID])
);

