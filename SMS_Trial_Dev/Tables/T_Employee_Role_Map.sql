﻿CREATE TABLE [EOS].[T_Employee_Role_Map] (
    [I_Employee_Role_Map_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Employee_ID]          INT          NULL,
    [I_Role_ID]              INT          NULL,
    [I_Status_ID]            INT          NULL,
    [Dt_Valid_From]          DATETIME     NULL,
    [Dt_Valid_To]            CHAR (18)    NULL,
    [S_Crtd_By]              VARCHAR (20) NULL,
    [S_Upd_By]               VARCHAR (20) NULL,
    [Dt_Crtd_On]             DATETIME     NULL,
    [Dt_Upd_On]              DATETIME     NULL,
    CONSTRAINT [PK__T_Employee_Role___5F49EED9] PRIMARY KEY CLUSTERED ([I_Employee_Role_Map_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Emp__139E86DE] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Emp__4FB370E5] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID]),
    CONSTRAINT [FK__T_Employe__I_Rol__1586CF50] FOREIGN KEY ([I_Role_ID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID]),
    CONSTRAINT [FK__T_Employe__I_Rol__519BB957] FOREIGN KEY ([I_Role_ID]) REFERENCES [dbo].[T_Role_Master] ([I_Role_ID])
);

