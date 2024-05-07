CREATE TABLE [dbo].[T_Invoice_Sequence_Number] (
    [I_Brand_ID]        INT          NULL,
    [I_State_ID]        INT          NULL,
    [I_Sequence_Number] INT          DEFAULT ((0)) NULL,
    [S_Invoice_type]    VARCHAR (10) NULL
);

