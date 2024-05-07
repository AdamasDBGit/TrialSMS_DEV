CREATE TABLE [dbo].[T_BusRoute_Master] (
    [I_Route_ID] INT          IDENTITY (1, 1) NOT NULL,
    [S_Route_No] VARCHAR (20) NOT NULL,
    [I_Status]   INT          NULL,
    [S_Crtd_By]  VARCHAR (20) NULL,
    [Dt_Crtd_On] DATETIME     NULL,
    [S_Updt_By]  VARCHAR (20) NULL,
    [Dt_Updt_On] DATETIME     NULL,
    [I_Brand_ID] INT          NULL,
    CONSTRAINT [PK_T_BusRoute_Master] PRIMARY KEY CLUSTERED ([I_Route_ID] ASC)
);

