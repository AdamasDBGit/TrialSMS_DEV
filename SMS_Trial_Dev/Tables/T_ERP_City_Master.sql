CREATE TABLE [dbo].[T_ERP_City_Master] (
    [I_City_ID]       INT          IDENTITY (1, 1) NOT NULL,
    [S_City_Code]     VARCHAR (10) NULL,
    [S_City_Name]     VARCHAR (50) NULL,
    [R_I_Country_ID]  INT          NULL,
    [R_I_State_ID]    INT          NULL,
    [Dtt_Created_At]  DATETIME     DEFAULT (getdate()) NULL,
    [Dtt_Modified_At] DATETIME     NULL,
    [I_Created_By]    INT          NULL,
    [I_Modified_By]   INT          NULL,
    [Is_Active]       BIT          DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_City_ID] ASC)
);

