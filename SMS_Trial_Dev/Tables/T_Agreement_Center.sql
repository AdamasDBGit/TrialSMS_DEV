CREATE TABLE [NETWORK].[T_Agreement_Center] (
    [I_Agreement_Center_ID] INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Agreement_ID]        INT NULL,
    [I_Centre_Id]           INT NOT NULL,
    CONSTRAINT [PK__T_Agreement_Cent__29ACF837] PRIMARY KEY CLUSTERED ([I_Agreement_Center_ID] ASC),
    CONSTRAINT [FK__T_Agreeme__I_Agr__7405DFF4] FOREIGN KEY ([I_Agreement_ID]) REFERENCES [NETWORK].[T_Agreement_Details] ([I_Agreement_ID]),
    CONSTRAINT [FK__T_Agreeme__I_Cen__7311BBBB] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

