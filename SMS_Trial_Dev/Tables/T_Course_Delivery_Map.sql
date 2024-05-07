CREATE TABLE [dbo].[T_Course_Delivery_Map] (
    [I_Course_Delivery_ID]  INT          IDENTITY (1, 1) NOT NULL,
    [I_Delivery_Pattern_ID] INT          NULL,
    [I_Course_ID]           INT          NULL,
    [S_Crtd_By]             VARCHAR (20) NULL,
    [N_Course_Duration]     NUMERIC (18) NULL,
    [S_Upd_By]              VARCHAR (20) NULL,
    [I_Status]              INT          NULL,
    [Dt_Crtd_On]            DATETIME     NULL,
    [Dt_Upd_On]             DATETIME     NULL,
    CONSTRAINT [PK__T_Course_Deliver__2D7D891B] PRIMARY KEY CLUSTERED ([I_Course_Delivery_ID] ASC),
    CONSTRAINT [FK__T_Course___I_Cou__73FAF2FC] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Course___I_Del__22751F6C] FOREIGN KEY ([I_Delivery_Pattern_ID]) REFERENCES [dbo].[T_Delivery_Pattern_Master] ([I_Delivery_Pattern_ID])
);

