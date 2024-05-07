﻿

/*****************************************************************************************************************
Created by: 
Date: 20/02/2015
Description:Update SMS Details Passed as Parameter
Parameters: 
******************************************************************************************************************/

CREATE PROCEDURE [dbo].[uspUpdateSMSDetails]
(
	@iSMSDetailsID INT
	,@iIsSuccess INT
	,@iNoOfAttempt INT = NULL
	,@sReturnCodeFromProvider VARCHAR(250) = NULL
)
AS
BEGIN	
	
	UPDATE [T_SMS_SEND_DETAILS] 
		SET [I_IS_SUCCESS] =@iIsSuccess
		,[I_Status]=(1-@iIsSuccess)
		,[I_NO_OF_ATTEMPT]= (CASE WHEN @iNoOfAttempt IS NULL THEN [I_NO_OF_ATTEMPT]  ELSE ISNULL([I_NO_OF_ATTEMPT],0)+1 END)
		,[Dt_SMS_SEND_ON] = (CASE WHEN @iIsSuccess =1 THEN GETDATE() ELSE NULL END)
		,[Dt_Upd_On]=GETDATE()
		,[S_Upd_By] = [S_Crtd_By] 
		,[S_RETURN_CODE_FROM_PROVIDER]=(CASE WHEN @sReturnCodeFromProvider IS NULL THEN [S_RETURN_CODE_FROM_PROVIDER] ELSE @sReturnCodeFromProvider END)
	WHERE [I_SMS_SEND_DETAILS_ID] = @iSMSDetailsID
	 
	
END

