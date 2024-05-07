CREATE TABLE [dbo].[T_ERP_Fee_Fine_Details] (
    [I_Fee_Fine_D_ID] INT             IDENTITY (1, 1) NOT NULL,
    [I_Fee_Fine_H_ID] INT             NULL,
    [I_Frm_Range]     INT             NULL,
    [I_To_Range]      INT             NULL,
    [N_Fine_Amount]   NUMERIC (12, 2) NULL,
    [Is_Active]       BIT             DEFAULT ((1)) NULL
);

