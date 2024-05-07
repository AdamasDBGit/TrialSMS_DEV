CREATE TABLE [dbo].[T_ERP_NoGen_pattern_Master] (
    [I_Pttrn_Master_ID] INT          NULL,
    [S_Pattern1]        VARCHAR (10) NULL,
    [S_Pattern2]        VARCHAR (10) NULL,
    [I_Brand_ID]        INT          NULL,
    [Is_Active]         BIT          DEFAULT ((1)) NULL
);

