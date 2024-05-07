CREATE TABLE [dbo].[T_ERP_Fee_Fine_Header] (
    [I_Fee_Fine_H_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Name]          VARCHAR (100) NULL,
    [FreqType]        TINYINT       NULL,
    [Is_Active]       BIT           DEFAULT ((1)) NULL,
    [Dt_Create_DT]    DATETIME      DEFAULT (getdate()) NULL,
    [I_Brand_ID]      INT           NULL,
    [I_Center_ID]     INT           NULL
);

