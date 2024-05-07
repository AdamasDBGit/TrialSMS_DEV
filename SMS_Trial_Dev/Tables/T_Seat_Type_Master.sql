CREATE TABLE [dbo].[T_Seat_Type_Master] (
    [I_Seat_Type_ID] INT          IDENTITY (1, 1) NOT NULL,
    [S_Seat_Type]    VARCHAR (50) NULL,
    [I_Status]       INT          NULL,
    [S_Crtd_By]      VARCHAR (50) NULL,
    [Dt_Crtd_On]     DATETIME     NULL,
    [S_Updt_By]      VARCHAR (50) NULL,
    [Dt_Updt_On]     DATETIME     NULL,
    CONSTRAINT [PK_T_Seat_Type_Master] PRIMARY KEY CLUSTERED ([I_Seat_Type_ID] ASC)
);

