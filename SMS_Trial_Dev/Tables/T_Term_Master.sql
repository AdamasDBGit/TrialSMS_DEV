CREATE TABLE [dbo].[T_Term_Master] (
    [I_Term_ID]             INT           IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]            INT           NULL,
    [S_Term_Code]           VARCHAR (50)  NULL,
    [S_Term_Name]           VARCHAR (250) NULL,
    [S_Crtd_By]             VARCHAR (20)  NULL,
    [S_Upd_By]              VARCHAR (20)  NULL,
    [Dt_Crtd_On]            DATETIME      NULL,
    [Dt_Upd_On]             DATETIME      NULL,
    [I_Is_Editable]         INT           NULL,
    [I_Status]              INT           NULL,
    [I_Total_Session_Count] INT           NULL,
    [S_Display_Name]        VARCHAR (MAX) NULL,
    CONSTRAINT [PK__T_Term_Master__5B2F4532] PRIMARY KEY CLUSTERED ([I_Term_ID] ASC),
    CONSTRAINT [FK__T_Term_Ma__I_Bra__04315AC5] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [dbo].[T_Term_Master] NOCHECK CONSTRAINT [FK__T_Term_Ma__I_Bra__04315AC5];




GO
CREATE NONCLUSTERED INDEX [NCI_I_Brand_ID]
    ON [dbo].[T_Term_Master]([I_Brand_ID] ASC);

