﻿

/*****************************************************************************************************************
Created by: 
Date: 20/02/2015
Description:Send SMS To StudentID or Mobile No
Parameters: 
******************************************************************************************************************/

CREATE PROCEDURE [dbo].[uspSendSMS]
(
	@iStudentID INT = NULL,
	@iSMSTypeID INT,
	@sSMSBody VARCHAR(500),
	@iReferenceID INT=NULL,
	@sMobileNo VARCHAR(25) = NULL, --Should be Picked from Student Master?
	@sCreatedBy VARCHAR(20) ,
	--@sPackagePath VARCHAR(250),
	@sConString VARCHAR(250),
	@iIsSuccess INT
)
AS
BEGIN
	--Validate Either StudentID or MobileNo has  to be provided
	IF @iStudentID IS NULL AND @sMobileNo IS NULL 
        BEGIN	            
            RAISERROR ('Either StudentID or MobileNo should be passed as parameter.', 11,1)
            RETURN
        END

	BEGIN TRY 
	-- SET NOCOUNT ON added to prevent extra result sets from  
	 -- interfering with SELECT statements.  
	 
	 SET NOCOUNT ON 
	 --BEGIN TRAN T1  
	 
	 DECLARE @MaxNoOfAttempt INT=0
	 DECLARE @NoOfAttempt INT =0,@iReferenceTypeID INT, @iSMSDetailsID INT
	 DECLARE @ReturnCodeFormProvider VARCHAR(25)=''
	 
	
	
	 --SELECT @MaxNoOfAttempt = [S_PARAM_VALUE] FROM [T_SMS_PARAM_MASTER] WHERE [I_PARAM_ID] =6 --IN PACKAGE
	
	 
	 SELECT @iReferenceTypeID = [I_REFERENCE_TYPE_ID] 
		FROM [T_SMS_TYPE_MASTER] 
		WHERE [I_SMS_TYPE_ID] = @iSMSTypeID
		
		IF @iStudentID IS NOT NULL AND @sMobileNo IS NULL
			SELECT @sMobileNo=COALESCE(S_Mobile_No,S_Phone_No,S_Guardian_Mobile_No,S_Guardian_Phone_No,'') FROM T_STUDENT_DETAIL  WHERE I_STUDENT_DETAIL_ID=@iStudentID 
	 
	 INSERT INTO [dbo].[T_SMS_SEND_DETAILS]
	 ([S_MOBILE_NO],[I_SMS_STUDENT_ID],[I_SMS_TYPE_ID],[S_SMS_BODY],[I_IS_SUCCESS],[I_NO_OF_ATTEMPT],
	 [S_RETURN_CODE_FROM_PROVIDER],[I_REFERENCE_ID],[I_REFERENCE_TYPE_ID],[I_Status],[S_Crtd_By])
	 VALUES (@sMobileNo,@iStudentID,@iSMSTypeID,@sSMSBody,@iIsSuccess,@NoOfAttempt,
	 @ReturnCodeFormProvider,@iReferenceID,@iReferenceTypeID,1,@sCreatedBy)	
	 
	 SELECT @iSMSDetailsID=SCOPE_IDENTITY() 
	 
	 PRINT @iSMSDetailsID
	 SELECT @iSMSDetailsID
	 
	 --Call DTSPackageWith this ID, and also the path where this package lies
	 
	 IF @iIsSuccess=1
	 BEGIN
		EXEC [uspSendSMSInstantaneously] @iSMSDetailsID,@sConString
		
		UPDATE [T_SMS_SEND_DETAILS] SET [I_IS_SUCCESS] = 0 WHERE [I_SMS_SEND_DETAILS_ID] = @iSMSDetailsID AND [I_Status] =1
	 END
	 
	 
	 --COMMIT TRAN T1   
	END TRY  
	BEGIN CATCH  
	 --Error occurred:    
	 --ROLLBACK TRAN T1  
	 DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int  
	 SELECT @ErrMsg = ERROR_MESSAGE(),  
	   @ErrSeverity = ERROR_SEVERITY()  
	  
	 RAISERROR(@ErrMsg, @ErrSeverity, 1)  
	END CATCH
END

