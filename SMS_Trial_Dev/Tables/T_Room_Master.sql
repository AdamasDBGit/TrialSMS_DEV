CREATE TABLE [dbo].[T_Room_Master] (
    [I_Room_ID]       INT             IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]      INT             NULL,
    [S_Building_Name] VARCHAR (255)   NULL,
    [S_Block_Name]    VARCHAR (255)   NULL,
    [S_Floor_Name]    VARCHAR (255)   NULL,
    [S_Room_No]       VARCHAR (50)    NULL,
    [I_Room_Type]     INT             NULL,
    [N_Room_Rate]     NUMERIC (18, 2) NULL,
    [I_No_Of_Beds]    INT             NULL,
    [I_Status]        INT             NULL,
    [S_Crtd_by]       VARCHAR (50)    NULL,
    [Dt_Crtd_On]      DATETIME        NULL,
    [S_Updt_By]       VARCHAR (50)    NULL,
    [Dt_Updt_On]      DATETIME        NULL,
    [I_Centre_Id]     INT             NULL,
    [I_Room_Capacity] INT             NULL,
    CONSTRAINT [PK_T_Room_Master] PRIMARY KEY CLUSTERED ([I_Room_ID] ASC),
    CONSTRAINT [FK_T_Room_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [dbo].[T_Room_Master] NOCHECK CONSTRAINT [FK_T_Room_Master_T_Brand_Master];



