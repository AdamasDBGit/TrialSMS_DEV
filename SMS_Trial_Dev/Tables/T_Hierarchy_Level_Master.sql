CREATE TABLE [dbo].[T_Hierarchy_Level_Master] (
    [I_Hierarchy_Level_Id]   INT           IDENTITY (1, 1) NOT NULL,
    [I_Hierarchy_Master_ID]  INT           NOT NULL,
    [S_Hierarchy_Level_Code] VARCHAR (20)  NULL,
    [S_Hierarchy_Level_Name] VARCHAR (100) NULL,
    [I_Sequence]             INT           NULL,
    [I_Status]               INT           NULL,
    [I_Is_Last_Node]         INT           NULL,
    [S_Crtd_By]              VARCHAR (20)  NULL,
    [S_Upd_By]               VARCHAR (20)  NULL,
    [Dt_Crtd_On]             DATETIME      NULL,
    [Dt_Upd_On]              DATETIME      NULL,
    CONSTRAINT [PK__T_Hierarchy_Leve__03317E3D] PRIMARY KEY CLUSTERED ([I_Hierarchy_Level_Id] ASC)
);

