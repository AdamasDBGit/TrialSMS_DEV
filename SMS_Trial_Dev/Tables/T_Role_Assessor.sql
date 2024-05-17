CREATE TABLE [EOS].[T_Role_Assessor] (
    [I_Role_Assessor_Mapping_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]                 INT          NULL,
    [I_Role_ID]                  INT          NULL,
    [I_Assessor_Role_ID]         INT          NULL,
    [I_Target_Day_Of_Month]      INT          NULL,
    [I_Achievement_Day_Of_Month] INT          NULL,
    [S_Crtd_By]                  VARCHAR (20) NULL,
    [S_Upd_By]                   VARCHAR (20) NULL,
    [Dt_Crtd_On]                 DATETIME     NULL,
    [Dt_Upd_On]                  DATETIME     NULL,
    CONSTRAINT [PK__T_Role_Assessor__493B7D80] PRIMARY KEY CLUSTERED ([I_Role_Assessor_Mapping_ID] ASC),
    CONSTRAINT [FK__T_Role_As__I_Rol__5FE9D8AE] FOREIGN KEY ([I_Role_ID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID])
);


GO
ALTER TABLE [EOS].[T_Role_Assessor] NOCHECK CONSTRAINT [FK__T_Role_As__I_Rol__5FE9D8AE];



