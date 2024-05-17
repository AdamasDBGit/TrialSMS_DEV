﻿CREATE TABLE [ACADEMICS].[T_Center_E_Project_Manual] (
    [I_Center_E_Proj_ID]           INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Center_ID]                  INT            NULL,
    [I_Course_ID]                  INT            NULL,
    [I_Term_ID]                    INT            NULL,
    [I_Module_ID]                  INT            NULL,
    [I_Student_Detail_ID]          INT            NULL,
    [I_E_Proj_Manual_Number]       INT            NULL,
    [I_E_Project_Group_ID]         INT            NULL,
    [Dt_Cancellation_Date]         DATETIME       NULL,
    [S_Cancellation_Reason]        VARCHAR (2000) NULL,
    [N_Marks]                      NUMERIC (8, 2) NULL,
    [I_Status]                     INT            NULL,
    [S_Crtd_By]                    VARCHAR (20)   NULL,
    [S_Upd_By]                     VARCHAR (20)   NULL,
    [Dt_Crtd_On]                   DATETIME       NULL,
    [Dt_Upd_On]                    DATETIME       NULL,
    [I_Valid_Cancellation_Attempt] BIT            NULL,
    CONSTRAINT [PK__T_Center_E_Proje__15660868] PRIMARY KEY CLUSTERED ([I_Center_E_Proj_ID] ASC),
    CONSTRAINT [FK__T_Center___I_Cen__5BF880E2] FOREIGN KEY ([I_Center_ID]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id]),
    CONSTRAINT [FK__T_Center___I_Cou__5CECA51B] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Center___I_Mod__676A338E] FOREIGN KEY ([I_Module_ID]) REFERENCES [dbo].[T_Module_Master] ([I_Module_ID]),
    CONSTRAINT [FK__T_Center___I_Stu__6D230CE4] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID]),
    CONSTRAINT [FK__T_Center___I_Ter__6FFF798F] FOREIGN KEY ([I_Term_ID]) REFERENCES [dbo].[T_Term_Master] ([I_Term_ID]),
    CONSTRAINT [FK_T_Center_E_Project_Manual_T_E_Project_Group] FOREIGN KEY ([I_E_Project_Group_ID]) REFERENCES [ACADEMICS].[T_E_Project_Group] ([I_E_Project_Group_ID])
);


GO
ALTER TABLE [ACADEMICS].[T_Center_E_Project_Manual] NOCHECK CONSTRAINT [FK__T_Center___I_Cou__5CECA51B];



