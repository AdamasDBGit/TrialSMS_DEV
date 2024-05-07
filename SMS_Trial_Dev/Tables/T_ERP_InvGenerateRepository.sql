CREATE TABLE [dbo].[T_ERP_InvGenerateRepository] (
    [I_ID]                   INT          IDENTITY (1, 1) NOT NULL,
    [S_Curr_Year]            VARCHAR (10) NULL,
    [I_IncrementID]          BIGINT       NULL,
    [Dtt_Lst_Update]         DATETIME     NULL,
    [I_Brand_ID]             INT          NULL,
    [I_School_Session_ID]    INT          NULL,
    [Type]                   VARCHAR (10) NULL,
    [Temp_Inv]               INT          NULL,
    [InstallmentwiseTempInv] INT          NULL,
    [pattern1]               VARCHAR (10) NULL
);

