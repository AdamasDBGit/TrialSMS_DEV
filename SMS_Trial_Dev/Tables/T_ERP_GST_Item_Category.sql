CREATE TABLE [dbo].[T_ERP_GST_Item_Category] (
    [I_GST_FeeComponent_Catagory_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_GST_FeeComponent_Category_Type] VARCHAR (255) NULL,
    [I_Fee_Component_ID]               INT           NULL,
    [S_GST_FeeComponent_Description]   VARCHAR (MAX) NOT NULL,
    [Is_Active]                        BIT           DEFAULT ((1)) NOT NULL,
    [I_Created_By]                     INT           NULL,
    [Dt_Created_At]                    DATETIME      DEFAULT (getdate()) NULL,
    [I_Updated_By]                     INT           NULL,
    [Dt_Updated_At]                    DATETIME      NULL,
    [I_Brand_Id]                       INT           NULL,
    [Type]                             INT           NULL,
    PRIMARY KEY CLUSTERED ([I_GST_FeeComponent_Catagory_ID] ASC)
);

