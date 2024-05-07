CREATE TABLE [dbo].[T_Brand_Center_Details] (
    [I_Brand_Center_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Centre_Id]       INT          NULL,
    [I_Brand_ID]        INT          NULL,
    [S_Crtd_By]         VARCHAR (20) NULL,
    [Dt_Valid_From]     DATETIME     NULL,
    [S_Upd_By]          VARCHAR (20) NULL,
    [Dt_Valid_To]       DATETIME     NULL,
    [Dt_Crtd_On]        DATETIME     NULL,
    [Dt_Upd_On]         DATETIME     NULL,
    [I_Status]          INT          NULL,
    CONSTRAINT [PK__T_Brand_Center_D__233504D2] PRIMARY KEY CLUSTERED ([I_Brand_Center_ID] ASC),
    CONSTRAINT [FK__T_Brand_C__I_Bra__08D61451] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_Brand_C__I_Cen__09A971A2] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

