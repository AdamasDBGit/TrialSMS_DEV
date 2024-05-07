CREATE TABLE [dbo].[T_Hierarchy_Brand_Details] (
    [I_Hierarchy_Brand_ID]  INT          IDENTITY (1, 1) NOT NULL,
    [I_Hierarchy_Master_ID] INT          NULL,
    [I_Brand_ID]            INT          NULL,
    [I_Status]              INT          NULL,
    [Dt_Crtd_On]            DATETIME     NULL,
    [Dt_Upd_On]             CHAR (18)    NULL,
    [S_Crtd_By]             VARCHAR (20) NULL,
    [S_Upd_By]              VARCHAR (20) NULL,
    [Dt_Valid_From]         DATETIME     NULL,
    [Dt_Valid_To]           DATETIME     NULL,
    CONSTRAINT [PK__T_Hierarchy_Bran__00DFECCE] PRIMARY KEY CLUSTERED ([I_Hierarchy_Brand_ID] ASC),
    CONSTRAINT [FK__T_Hierarc__I_Bra__54624C12] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_Hierarc__I_Hie__1F175F99] FOREIGN KEY ([I_Hierarchy_Master_ID]) REFERENCES [dbo].[T_Hierarchy_Master] ([I_Hierarchy_Master_ID]),
    CONSTRAINT [FK__T_Hierarc__I_Hie__5556704B] FOREIGN KEY ([I_Hierarchy_Master_ID]) REFERENCES [dbo].[T_Hierarchy_Master] ([I_Hierarchy_Master_ID])
);

