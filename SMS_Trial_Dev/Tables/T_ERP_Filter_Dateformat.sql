CREATE TABLE [dbo].[T_ERP_Filter_Dateformat] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [DateFilter_Type] VARCHAR (100) NULL,
    [I_Value]         INT           NULL,
    [S_Purpose]       VARCHAR (50)  NULL,
    [Is_Active]       BIT           NULL
);

