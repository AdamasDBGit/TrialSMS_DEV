﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ERP_uspUpdateCandidateEnquiryDetails] 
(
	@iEnquiryRegnID int = NULL,
	@sFirstName varchar(50) = NULL,
	@sMiddleName varchar(50) = NULL,
	@sLastName varchar(50) = NULL,
	@iGender int = NULL,
	@DtBirthDate date = NULL,
	@sMobileNo varchar(20) = NULL,
	@iBloodGroup int = NULL,
	@iNativeLanguage int = NULL,
	@iNationality int = NULL,
	@iReligion int = NULL,
	@iCaste int = NULL,
	@sEmail varchar(200) = NULL,
	@sCandidatePhotoPath varchar(500) = NULL,
	@iUpdatedBy varchar(max) = NULL,
	@SSecondLanguageOpted nvarchar(50)=null,
	@ITabNo int = null
)	
AS
begin transaction
BEGIN
	BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @currentTabNo int;
	IF @sCandidatePhotoPath IS NULL
	BEGIN
		SET @sCandidatePhotoPath = (SELECT S_Student_Photo FROM [dbo].[T_Enquiry_Regn_Detail] WHERE I_Enquiry_Regn_ID = @iEnquiryRegnID)
	END

	UPDATE [dbo].[T_Enquiry_Regn_Detail]
	SET		
		S_First_Name = @sFirstName,
		S_Middle_Name = @sMiddleName,
		S_Last_Name = @sLastName,
		I_Sex_ID = @iGender,
		Dt_Birth_Date = @DtBirthDate,
		S_Mobile_No = @sMobileNo,
		I_Blood_Group_ID = @iBloodGroup,
		I_Native_Language_ID = @iNativeLanguage,
		I_Nationality_ID = @iNationality,
		I_Religion_ID = @iReligion,
		I_Caste_ID = @iCaste,
		S_Email_ID = @sEmail,
		S_Student_Photo = @sCandidatePhotoPath,
		S_Upd_By = @iUpdatedBy,
		Dt_Upd_On = GETDATE(),
		Enquiry_Crtd_By = @iUpdatedBy,
		S_Second_Language_Opted =@SSecondLanguageOpted,
		Enquiry_Date = GETDATE()
		--I_Tab_No = @ITabNo

		 
	WHERE I_Enquiry_Regn_ID = @iEnquiryRegnID
	set @currentTabNo = (select I_Tab_No from [T_Enquiry_Regn_Detail] WHERE I_Enquiry_Regn_ID = @iEnquiryRegnID)
	IF(@ITabNo>@currentTabNo)
	BEGIN
	update [T_Enquiry_Regn_Detail] set I_Tab_No = @ITabNo WHERE I_Enquiry_Regn_ID = @iEnquiryRegnID
	END
	select 1 StatusFlag,'Candidate details saved successfully' Message
	END TRY
	BEGIN CATCH
		rollback transaction
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int

		SELECT	@ErrMsg = ERROR_MESSAGE(),
				@ErrSeverity = ERROR_SEVERITY()
		select 0 StatusFlag,@ErrMsg Message
	END CATCH
commit transaction
END
