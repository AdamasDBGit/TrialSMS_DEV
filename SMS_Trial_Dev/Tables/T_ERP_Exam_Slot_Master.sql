CREATE TABLE [dbo].[T_ERP_Exam_Slot_Master] (
    [I_Slot_ID]       INT          IDENTITY (1, 1) NOT NULL,
    [S_Slot_Code]     VARCHAR (50) NULL,
    [T_Slot_St_Time]  TIME (0)     NULL,
    [T_Slot_End_Time] TIME (0)     NULL,
    [Dtt_Created_At]  DATETIME     DEFAULT (getdate()) NULL,
    [Dtt_Modified_At] DATETIME     NULL,
    [I_Created_By]    INT          NULL,
    [I_Modified_By]   INT          NULL,
    [Is_Active]       BIT          DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Slot_ID] ASC)
);

