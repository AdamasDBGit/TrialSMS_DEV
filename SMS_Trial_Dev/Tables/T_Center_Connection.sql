CREATE TABLE [EXAMINATION].[T_Center_Connection] (
    [I_Centre_Id]         INT           NOT NULL,
    [S_Connection_String] VARCHAR (500) NOT NULL,
    CONSTRAINT [PK__T_Center_Connect__3CBFCCAB] PRIMARY KEY CLUSTERED ([I_Centre_Id] ASC),
    CONSTRAINT [FK__T_Center___I_Cen__1E505424] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

