CREATE TABLE [dbo].[T_ERP_Saas_Pattern_Child_Details] (
    [I_Saas_Pattern_Child_Details_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Saas_Pattern_Child_Header_ID]  INT          NOT NULL,
    [I_Increment_ID]                  BIGINT       NULL,
    [ch_Pattern1]                     VARCHAR (20) NULL,
    [Is_Active]                       BIT          NULL,
    PRIMARY KEY CLUSTERED ([I_Saas_Pattern_Child_Header_ID] ASC)
);

