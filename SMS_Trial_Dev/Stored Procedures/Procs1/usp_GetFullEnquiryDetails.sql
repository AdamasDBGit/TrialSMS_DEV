-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec [usp_GetFullEnquiryDetails] 234997
-- 
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetFullEnquiryDetails]
(
	@iEnquiryRegnID int  
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @FatherFullName NVARCHAR(300) = (select S_Father_Name from  [dbo].[T_Enquiry_Regn_Detail] where I_Enquiry_Regn_ID = @iEnquiryRegnID);
 
		DECLARE @FatherFirstName NVARCHAR(100), @FatherMiddleName NVARCHAR(100), @FatherLastName NVARCHAR(100);
 
		-- Extract the Last Name
		SET @FatherLastName = RIGHT(@FatherFullName, CHARINDEX(' ', REVERSE(@FatherFullName)) - 1);
 
		-- Extract the First and Middle Name
		SET @FatherFirstName = LEFT(@FatherFullName, LEN(@FatherFullName) - LEN(@FatherLastName) - 1);
 
		-- If you want to further split Middle Name
		IF CHARINDEX(' ', @FatherFirstName) > 0
		BEGIN
			SET @FatherMiddleName = RIGHT(@FatherFirstName, LEN(@FatherFirstName) - CHARINDEX(' ', @FatherFirstName));
			SET @FatherFirstName = LEFT(@FatherFirstName, CHARINDEX(' ', @FatherFirstName) - 1);
		END
		ELSE
		BEGIN
			SET @FatherMiddleName =null; -- Assign null string if no middle name
		END



		DECLARE @MotherFullName NVARCHAR(300) = (select S_Mother_Name from  [dbo].[T_Enquiry_Regn_Detail] where I_Enquiry_Regn_ID = @iEnquiryRegnID);
 
		DECLARE @MotherFirstName NVARCHAR(100), @MotherMiddleName NVARCHAR(100), @MotherLastName NVARCHAR(100);
 
		-- Extract the Last Name
		SET @MotherLastName = RIGHT(@MotherFullName, CHARINDEX(' ', REVERSE(@MotherFullName)) - 1);
 
		-- Extract the First and Middle Name
		SET @MotherFirstName = LEFT(@MotherFullName, LEN(@MotherFullName) - LEN(@MotherLastName) - 1);
 
		-- If you want to further split Middle Name
		IF CHARINDEX(' ', @MotherFirstName) > 0
		BEGIN
			SET @MotherMiddleName = RIGHT(@MotherFirstName, LEN(@MotherFirstName) - CHARINDEX(' ', @MotherFirstName));
			SET @MotherFirstName = LEFT(@MotherFirstName, CHARINDEX(' ', @MotherFirstName) - 1);
		END
		ELSE
		BEGIN
			SET @MotherMiddleName =null; -- Assign null string if no middle name
		END


    -- Insert statements for procedure here
	 SELECT   
	 TEERD.I_Enquiry_Regn_ID,  
	 TEERD.I_Enquiry_Status_Code,  
	 TEERD.I_Info_Source_ID,  
	 TEERD.I_Enquiry_Type_ID,  
	 TEERD.S_Enquiry_No,  
	 TEERD.S_First_Name,  
	 TEERD.S_Middle_Name,  
	 TEERD.S_Last_Name,  
	 TEERD.I_Sex_ID,  
	 TEERD.Dt_Birth_Date,  
	 TEERD.S_Mobile_No,  
	 TEERD.I_Blood_Group_ID,  
	 TEERD.I_Native_Language_ID,  
	 TEERD.I_Nationality_ID,  
	 TEERD.I_Religion_ID,  
	 TEERD.I_Caste_ID,  
	 TEERD.S_Email_ID,  
	 TEERD.S_Student_Photo as CandidatePhotoPath,  
	 TEERD.Enquiry_Date,  
	 TEERD.PreEnquiryDate,  
	 TEERD.S_Enquiry_No,
	 TESFSCM.R_I_Fee_Structure_ID FeeStructureID,
	 ISNULL(TEERD.I_Tab_No,0) I_Tab_No
	 FROM T_Enquiry_Regn_Detail TEERD 
	 LEFT JOIN 
	 T_ERP_Stud_Fee_Struct_Comp_Mapping TESFSCM ON TESFSCM.R_I_Enquiry_Regn_ID = TEERD.I_Enquiry_Regn_ID
	 WHERE I_Enquiry_Regn_ID = @iEnquiryRegnID;


	  SELECT   
	  TEERD.I_Enquiry_Regn_ID AS I_Enquiry_Regn_ID,  	  
	  TEERD.S_Father_Mobile_No AS S_Father_Mobile_No,

	  @FatherFirstName AS S_Father_First_Name,
	  @FatherMiddleName AS S_Father_Middile_Name,
	  @FatherLastName AS S_Father_Last_Name,
	  
	  --PARSENAME(REPLACE(TEERD.S_Father_Name, ' ', '.'), 3) AS S_Father_First_Name,
	  --PARSENAME(REPLACE(TEERD.S_Father_Name, ' ', '.'), 2) AS S_Father_Middile_Name,
	  --PARSENAME(REPLACE(TEERD.S_Father_Name, ' ', '.'), 1) AS S_Father_Last_Name,

	  --TEERD.S_First_Name AS S_Father_First_Name,  
	  --TEERD.S_Middile_Name AS S_Father_Middile_Name,  
	  --TEERD.S_Last_Name AS S_Father_Last_Name,  

	  TEERD.S_Father_Email AS S_Father_Email_ID,  
	  TEERD.I_Father_Qualification_ID AS I_Father_Qualification_ID,  
	  TEERD.I_Father_Occupation_ID AS I_Father_Occupation_ID,  
	  TEERD.S_Father_Company_Name AS S_Father_Company_Name,  
	  TEERD.S_Father_Designation AS S_Father_Designation,  
	  TEERD.I_Father_Income_Group_ID AS I_Father_Income_Group_ID,  
	  TEERD.S_Father_Photo AS S_Father_Photo_Path,  
  	  
	  TEERD.S_Mother_Mobile_No AS S_Mother_Mobile_No, 
	  
	  @MotherFirstName AS S_Mother_First_Name,
	  @MotherMiddleName AS S_Mother_Middile_Name,
	  @MotherLastName AS S_Mother_Last_Name,

	  --PARSENAME(REPLACE(TEERD.S_Mother_Name, ' ', '.'), 3) AS S_Mother_First_Name,
	  --PARSENAME(REPLACE(TEERD.S_Mother_Name, ' ', '.'), 2) AS S_Mother_Middile_Name,
	  --PARSENAME(REPLACE(TEERD.S_Mother_Name, ' ', '.'), 1) AS S_Mother_Last_Name,


	  --TEERD.S_First_Name AS S_Mother_First_Name,  
	  --TEERD.S_Middile_Name AS S_Mother_Middile_Name,  
	  --TEERD.S_Last_Name AS S_Mother_Last_Name,  

	  TEERD.S_Mother_Email AS S_Mother_Email_ID,  
	  TEERD.I_Mother_Qualification_ID AS I_Mother_Qualification_ID,  
	  TEERD.I_Mother_Occupation_ID AS I_Mother_Occupation_ID,  
	  TEERD.S_Mother_Company_Name AS S_Mother_Company_Name,  
	  TEERD.S_Mother_Designation AS S_Mother_Designation,  
	  TEERD.I_Mother_Income_Group_ID AS I_Mother_Income_Group_ID,  
	  TEERD.S_Mother_Photo AS S_Mother_Photo_Path,  
  
  	    -- current address
	  TEERD.I_Curr_Country_ID AS S_Country_ID,  
	  TEERD.I_Curr_State_ID AS S_State_ID,  
	  TEERD.I_Curr_City_ID AS S_City_ID,  
	  TEERD.S_Curr_Address1 AS S_Address1,  
	  TEERD.S_Curr_Address2 AS S_Address2,  
	  TEERD.S_Curr_Pincode AS S_Pincode  ,
	  --permanent address
	  TEERD.I_Perm_Country_ID AS I_P_Country_ID,  
	  TEERD.I_Perm_State_ID AS	 I_P_State_ID,  
	  TEERD.I_Perm_City_ID AS	 I_P_City_ID,  
	  TEERD.S_Perm_Address1 AS	 S_P_AddressLine_1,  
	  TEERD.S_Perm_Address2 AS	 S_P_AddressLine_2,  
	  TEERD.S_Perm_Pincode AS	 S_P_PinCode 
  
	  FROM T_Enquiry_Regn_Detail TEERD   
	  WHERE I_Enquiry_Regn_ID = @iEnquiryRegnID;


	  SELECT   
	 TEERD.I_Enquiry_Regn_ID,  
	 TEERD.I_Enquiry_Type_ID,  
	 TEERD.I_School_Group_ID,  
	 TEERD.I_Class_ID AS I_Course_Applied_For, 
	 TEERD.I_Stream_ID AS I_Stream_ID,
	 TEESM.I_EnqType_Source_Mapping_ID AS I_Info_Source_ID,
	 TEERD.R_I_School_Session_ID AS R_I_School_Session_ID,
	 TEERD.Is_Prev_Academy,  
	 TEERD.Is_Sibling,  
  
	 TEEPD.R_I_Prev_Class_ID,  
	 CASE   
			WHEN TEEPD.Is_Marks_Input = 1 THEN 0   
			WHEN TEEPD.Is_Marks_Input = 0 THEN 1  
		END AS Is_Marks_Input,  
	 TEEPD.N_TotalMarks,  
	 TEEPD.N_Obtain_Marks,  
	 TEEPD.S_Grade,  
	 TEEPD.N_Percentage,  
	 TEEPD.S_School_Name,  
	 TEEPD.S_School_Board,  
	 TEEPD.S_Address,  
  
	 TEPS.S_StudentID,  
	 TEPS.S_Stud_Name,  
	 TEECD.I_Source_DetailsID I_Source_ID,
	 TEECD.S_Referal S_Referal,
	 CASE   
			WHEN TEPS.Is_Running_Stud = 1 THEN 0   
			WHEN TEPS.Is_Running_Stud = 0 THEN 1   
		END AS Is_Running_Stud,  
	 TEPS.S_Passout_Year  
  
	 FROM   
	 T_Enquiry_Regn_Detail AS TEERD  
	 left join T_ERP_EnquiryReg_Prev_Details AS TEEPD ON TEERD.I_Enquiry_Regn_ID = TEEPD.R_I_Enquiry_Regn_ID  
	 left join T_ERP_PreEnq_Siblings AS TEPS ON TEERD.I_Enquiry_Regn_ID = TEPS.R_I_Enquiry_Regn_ID 
	 left join T_ERP_Enquiry_CRM_Details TEECD ON TEECD.I_Enquiry_ID = TEERD.I_Enquiry_Regn_ID
	 left join T_ERP_CRMSource_Details TECD ON TECD.I_Source_DetailsID=TEECD.I_Source_DetailsID
	 left join T_ERP_EnqType_Source_Mapping TEESM ON TEESM.I_EnqType_Source_Mapping_ID=TECD.I_EnqType_Source_Mapping_ID
	 WHERE TEERD.I_Enquiry_Regn_ID = @iEnquiryRegnID;  
END
