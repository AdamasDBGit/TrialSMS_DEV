CREATE TABLE [dbo].[T_ERP_Center_batch_Fee_Mapping] (
    [I_Center_batch_Fee_ID] INT  IDENTITY (1, 1) NOT NULL,
    [I_Center_ID]           INT  NULL,
    [I_batch_ID]            INT  NULL,
    [I_Fee_PlanID]          INT  NULL,
    [Dt_created_On]         DATE DEFAULT (getdate()) NULL,
    [Is_Active]             BIT  DEFAULT ((1)) NULL
);

