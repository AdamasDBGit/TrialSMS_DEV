CREATE TABLE [dbo].[T_CourseList_Master] (
    [I_CourseList_ID]   INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_CourseList_Name] VARCHAR (50) NULL,
    [I_Status]          INT          NULL,
    [S_Crtd_By]         VARCHAR (20) NULL,
    [S_Upd_By]          VARCHAR (20) NULL,
    [Dt_Crtd_On]        DATETIME     NULL,
    [Dt_Upd_On]         DATETIME     NULL,
    [I_Brand_ID]        INT          NULL,
    CONSTRAINT [PK__T_CourseList_Mas__68294D9D] PRIMARY KEY CLUSTERED ([I_CourseList_ID] ASC),
    CONSTRAINT [FK__T_CourseL__I_Bra__69AF7321] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_CourseL__I_Bra__7ECF1DD8] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);

