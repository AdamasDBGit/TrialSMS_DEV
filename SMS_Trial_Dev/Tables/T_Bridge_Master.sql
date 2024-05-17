CREATE TABLE [dbo].[T_Bridge_Master] (
    [I_Bridge_ID]   INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Bridge_Code] VARCHAR (20)   NULL,
    [S_Bridge_Desc] VARCHAR (1000) NULL,
    [I_Brand_ID]    INT            NULL,
    [I_Status]      INT            NULL,
    [S_Crtd_By]     VARCHAR (50)   NULL,
    [S_Upd_By]      VARCHAR (50)   NULL,
    [Dt_Crtd_On]    DATETIME       NULL,
    [Dt_Upd_On]     DATETIME       NULL,
    CONSTRAINT [PK_T_Bridge_Master] PRIMARY KEY CLUSTERED ([I_Bridge_ID] ASC),
    CONSTRAINT [FK_T_Bridge_Master_T_Brand_Master] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [dbo].[T_Bridge_Master] NOCHECK CONSTRAINT [FK_T_Bridge_Master_T_Brand_Master];



