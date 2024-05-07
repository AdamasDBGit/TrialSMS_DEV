CREATE TABLE [NETWORK].[T_Startup_Kit_Detail] (
    [I_Startup_Kit_Detail_ID] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Centre_Id]             INT           NULL,
    [I_Startup_Kit_ID]        INT           NULL,
    [S_Act_Spec]              VARCHAR (200) NULL,
    [S_Act_No]                VARCHAR (50)  NULL,
    [S_Crtd_By]               VARCHAR (20)  NULL,
    [S_Upd_By]                VARCHAR (20)  NULL,
    [Dt_Crtd_On]              DATETIME      NULL,
    [Dt_Upd_On]               DATETIME      NULL,
    [I_Status]                INT           NULL,
    CONSTRAINT [PK__T_Startup_Kit_De__6F412AD7] PRIMARY KEY CLUSTERED ([I_Startup_Kit_Detail_ID] ASC),
    CONSTRAINT [FK__T_Startup__I_Cen__0DC5B1F7] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Startup__I_Sta__0EB9D630] FOREIGN KEY ([I_Startup_Kit_ID]) REFERENCES [NETWORK].[T_Startup_Kit_Master] ([I_Startup_Kit_ID])
);

