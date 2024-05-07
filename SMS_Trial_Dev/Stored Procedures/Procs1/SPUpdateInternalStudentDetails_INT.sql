﻿-- =============================================

-- =============================================
CREATE  PROCEDURE [dbo].[SPUpdateInternalStudentDetails_INT]
(
		@UserID				INT,
		@Title				VARCHAR(10),
		@FirstName			VARCHAR(50),
		@MiddleName			VARCHAR(50)=NULL,
		@LastName			VARCHAR(50),
		@Email				VARCHAR(200),
		@MobileNumber		VARCHAR(500)=NULL,
		@CurrentAddress1	VARCHAR(200)=null,			
		@CurrentAddress2	VARCHAR(200)=null,		
		@CurrentCountry		INT,
		@CurrentState		INT,
		@CurrentCity		INT,
		@CurrentZipcode		VARCHAR(500),
		@PermanentAddress1	VARCHAR(200)=null,
		@PermanentAddress2	VARCHAR(200)=null,
		@PermanentCountry	INT,
		@PermanentState		INT,
		@PermanentCity		INT,
		@PermanentZipcode	VARCHAR(500)=null,
		@RegistrationNumber VARCHAR(500),
		@Result				VARCHAR(20) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF EXISTS (SELECT 1 FROM [T_Student_Detail] WHERE [S_Student_ID]=@RegistrationNumber)
			BEGIN
			PRINT('A')
				UPDATE [T_Student_Detail]
				SET
					[S_Title]			=@Title	,
					[S_First_Name]		=@FirstName	,
					[S_Middle_Name]		=ISNULL(@MiddleName,[S_Middle_Name]),
					[S_Last_Name]		=@LastName	,
					[S_Email_ID]		=@Email	,
					[S_Mobile_No]		=@MobileNumber	,
					[S_Curr_Address1]	=@CurrentAddress1	,
					[S_Curr_Address2]	=@CurrentAddress2	,
					[I_Curr_Country_ID]	=@CurrentCountry	,
					[I_Curr_State_ID]	=@CurrentState	,
					[I_Curr_City_ID]	=@CurrentCity	,
					[S_Curr_Pincode]	=@CurrentZipcode	,
					[S_Perm_Address1]	=@PermanentAddress1	,
					[S_Perm_Address2]	=@PermanentAddress2	,
					[I_Perm_Country_ID]	=@PermanentCountry	,
					[I_Perm_State_ID]	=@PermanentState	,
					[I_Perm_City_ID]	=@PermanentCity	,
					[S_Perm_Pincode]	=@PermanentZipcode	,
					[Dt_Upd_On]			=GETDATE(),
					[S_Upd_By]          =@UserID
				WHERE
				--[I_Student_Detail_ID]=@UserID
				[S_Student_ID]=@RegistrationNumber
				SELECT 
				[S_Title]			AS Title	,
				[S_First_Name]		AS FirstName,
				[S_Middle_Name]		AS MiddleName,
				[S_Last_Name]		AS LastName,
				[S_Email_ID]		AS EmailID,
				[S_Student_ID]		AS StudentID
				FROM 
				[T_Student_Detail]
				WHERE
				--[I_Student_Detail_ID]=@UserID
				[S_Student_ID]=@RegistrationNumber
				SET @Result='Updated'
			END
			ELSE
			BEGIN
			PRINT('B')
				SET @Result='UserNotExists'
			END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;  
		SET @Result='NotUpdated'
		DECLARE 
			@ErrorMessage		VARCHAR(MAX),
			@ErrorSeverity		INT,
			@ErrorState			INT;
		SELECT 
			@ErrorMessage	=		ERROR_MESSAGE(),
			@ErrorSeverity	=		ERROR_SEVERITY(),
			@ErrorState		=		ERROR_STATE();
		RAISERROR 
		(
			@ErrorMessage,
			@ErrorSeverity,
			@ErrorState    
		);    
	END CATCH
END

