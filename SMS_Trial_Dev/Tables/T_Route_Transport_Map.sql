CREATE TABLE [dbo].[T_Route_Transport_Map] (
    [I_PickupPoint_ID] INT          NOT NULL,
    [I_Route_ID]       INT          NOT NULL,
    [I_Status]         INT          NULL,
    [S_Crtd_By]        VARCHAR (50) NULL,
    [Dt_Crtd_On]       DATETIME     NULL,
    [S_Updt_By]        VARCHAR (50) NULL,
    [Dt_Updt_On]       DATETIME     NULL,
    CONSTRAINT [FK_T_Route_Transport_Map_T_BusRoute_Master] FOREIGN KEY ([I_Route_ID]) REFERENCES [dbo].[T_BusRoute_Master] ([I_Route_ID]),
    CONSTRAINT [FK_T_Route_Transport_Map_T_Transport_Master] FOREIGN KEY ([I_PickupPoint_ID]) REFERENCES [dbo].[T_Transport_Master] ([I_PickupPoint_ID])
);

