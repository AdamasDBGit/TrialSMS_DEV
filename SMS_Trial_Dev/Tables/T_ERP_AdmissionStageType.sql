CREATE TABLE [dbo].[T_ERP_AdmissionStageType] (
    [I_AdmStgTypeID]  INT           IDENTITY (1, 1) NOT NULL,
    [S_AdmStage_Desc] VARCHAR (100) NULL,
    [Dtt_Created_At]  DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At] DATETIME      NULL,
    [I_Created_By]    INT           NULL,
    [I_Modified_By]   INT           NULL,
    [Is_Active]       BIT           DEFAULT ((1)) NULL
);

