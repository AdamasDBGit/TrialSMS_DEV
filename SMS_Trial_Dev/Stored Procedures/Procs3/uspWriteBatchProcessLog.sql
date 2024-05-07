﻿CREATE Procedure [dbo].[uspWriteBatchProcessLog]
(
	@I_Process_ID_Max Int,
	@S_Batch_Process_Name Varchar(500),
	@S_Comments Varchar(2000),
	@S_Status Varchar(20)
)
 
AS

Begin
	Set NoCount On;

	Declare @I_Batch_Process_ID Int
	Select @I_Batch_Process_ID=I_Batch_Process_ID From dbo.T_Batch_Master Where S_Batch_Process_Name=@S_Batch_Process_Name And I_Status=1

	Insert Into dbo.T_Batch_Log
	(I_Process_ID, I_Batch_Process_ID,S_Batch_Process_Name,S_Comments,Dt_Run_Date_Time,S_Status) 
	Select @I_Process_ID_Max, @I_Batch_Process_ID, @S_Batch_Process_Name, @S_Comments, Getdate(), @S_Status
End
