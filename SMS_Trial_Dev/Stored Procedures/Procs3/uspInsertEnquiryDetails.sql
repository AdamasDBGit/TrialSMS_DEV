﻿CREATE PROCEDURE [dbo].[uspInsertEnquiryDetails]    
    (    
   @iEnquiryID INT = NULL,    
      @Centre INT ,    
      @OccupationID INT =NULL,    
      @PrefCareerID INT =NULL,    
      @InfoSourceID INT =NULL,    
      @EnquiryTypeID INT =NULL,    
      @IsCorporate VARCHAR(20) =NULL,    
      @EnquiryDesc VARCHAR(500) =NULL,    
      @Title VARCHAR(10) =NULL,    
      @FirstName VARCHAR(50) ,    
      @MiddleName VARCHAR(50) =NULL,    
      @LastName VARCHAR(50) ,    
      @DtBirthDate DATETIME ,    
      @Age VARCHAR(20) ,    
      @casteID INT =NULL,    
      @QualificationNameID INT =NULL,    
      @SkipTest CHAR(1) =NULL,    
      @StreamID INT =NULL,    
      @EmailID VARCHAR(200) =NULL,    
      @PhoneNo VARCHAR(20) =NULL,    
      @MobileNo VARCHAR(20) =NULL,    
      @CurrCityID INT =NULL,    
      @CurrStateID INT =NULL,    
      @CurrCountryID INT =NULL,    
      @GuardianName VARCHAR(200) =NULL,    
      @GuardianOccupationID INT =NULL,    
      @GuardianEmailID VARCHAR(200) =NULL,    
      @GuardianPhoneNo VARCHAR(20) =NULL,    
      @GuardianMobileNo VARCHAR(20) =NULL,    
      @IncomeGroupID INT =NULL,    
      @CurrAddress1 VARCHAR(200) =NULL,    
      @CurrAddress2 VARCHAR(200) =NULL,    
      @CurrPincode VARCHAR(20) =NULL,    
      @CurrArea VARCHAR(20) =NULL,    
      @PermAddress1 VARCHAR(200) =NULL,    
      @PermAddress2 VARCHAR(200) =NULL,    
      @PermPincode VARCHAR(20) =NULL,    
      @PermCityID INT =NULL,    
      @PermStateID INT =NULL,    
      @PermCountryID INT =NULL,    
      @PermArea VARCHAR(20) =NULL,    
      @CrtdBy VARCHAR(20) ,    
      @DtCrtdOn DATETIME ,    
      @sSelectedCourseID VARCHAR(100) =NULL,    
      @dtFirstFollowUpDate DATETIME =NULL,    
      @iCorporateID INT =NULL,    
      @iCorporatePlanID INT =NULL,    
      @sStudentPhoto VARCHAR(500) = NULL,    
      @iResidenceArea INT = NULL,    
      @sFatherName VARCHAR(200) = NULL,    
      @sMotherName VARCHAR(200) = NULL,    
      @iSex INT = NULL,    
      @iNativeLanguage INT = NULL,    
      @iNationality INT = NULL,    
      @iReligion INT = NULL,    
      @iMaritalStatus INT= NULL,    
      @iBloodGroup INT = NULL,    
      @iFatherQualification INT = NULL,    
      @iFatherOccupation INT = NULL,    
      @iFatherBusinessType INT = NULL,    
      @sFatherCompany VARCHAR(200) = NULL,    
      @sFatherDesignation VARCHAR(200) = NULL,    
      @sFatherOfficePhone VARCHAR(20) = NULL,    
      @iFatherIncomeGroup INT = NULL,    
      @sFatherPhoto VARCHAR(500) = NULL,    
      @sFatherOfficeAddress VARCHAR(2000) = NULL,    
      @iMotherQualification INT = NULL,    
      @iMotherOccupation INT = NULL,    
      @iMotherBusinessType INT = NULL,    
      @sMotherCompany VARCHAR(200) = NULL,    
      @sMotherDesignation VARCHAR(200) = NULL,    
      @sMotherOfficePhone VARCHAR(20) = NULL,    
      @iMotherIncomeGroup INT = NULL,    
      @sMotherPhoto VARCHAR(500) = NULL,    
      @sMotherOfficeAddress VARCHAR(2000) = NULL,    
      @sGuardianRelation VARCHAR(200)  =NULL,    
      @sGuardianAddress VARCHAR(2000) = NULL,    
      @iMonthlyFamilyIncome INT = NULL,    
      @bCanSponsorEducation BIT = NULL,    
      @sSiblingID VARCHAR(500) =NULL,    
      @bHasGivenOtherExam BIT = NULL,    
      @iNoOfAttempts INT = NULL,    
      @sOtherInstitute VARCHAR(50) = NULL,    
      @nDuration DECIMAL(18,2) = NULL,    
      @iSeatType INT = NULL,    
      @iEnrolmentType INT = NULL,    
      @sEnrolmentNo VARCHAR(50) = NULL,    
      @iRankObtained INT = NULL,    
      @sUniversityRegnNo VARCHAR(50) = NULL,    
      @sUnivRollNo VARCHAR(50) = NULL,    
      @iScholarType INT = NULL,    
      @sSecondLanguageOpted VARCHAR(100) = NULL,    
      @sQualificationXML XML = NULL,    
      @sPhysicalAilment VARCHAR(200)  =NULL,  
      @IsLateral BIT = NULL,
      @EducationCurrentStatus INT = NULL ,
      @EducationStream INT = NULL ,
      @EducationPostGrad INT = NULL ,
      @IndustryType INT = NULL ,
      @ITSkills INT = NULL ,
      @YrsofExp VARCHAR(3) = NULL ,
      @JobRole VARCHAR(MAX) = NULL ,
      @JobSalary VARCHAR(10) = NULL ,
      @sSelectedAimID VARCHAR(100) = NULL ,
      @sSelectedFocusID VARCHAR(100) = NULL ,
      @sReferenceXML XML=NULL,
      @sFeedbackXML XML=NULL,
      @TestScore VARCHAR(10)=NULL  
    )    
AS     
    BEGIN TRY                
        SET NOCOUNT OFF ;                
                
        DECLARE @iGetCourseIndex INT                
        DECLARE @iCourseListLength INT                
        DECLARE @iCourseID INT                
        DECLARE @sSelectedCourseIDs VARCHAR(100)                
        --DECLARE @iEnquiryID INT                
        DECLARE @iCenterID INT                
        DECLARE @iEmployeeId INT           
                
        BEGIN TRANSACTION                
             
   IF ( SELECT  COUNT(*)    
         FROM    dbo.T_Enquiry_Regn_Detail    
         WHERE    I_Centre_Id=  @Centre AND S_Mobile_No = @MobileNo ) = 0   
         BEGIN    
              
    -- Insert the Enquiry Details                
                    
                INSERT INTO dbo.T_Enquiry_Regn_Detail    
                        ( I_Centre_Id ,    
                          I_Occupation_ID ,    
                          I_Pref_Career_ID ,    
                          I_Enquiry_Status_Code ,    
                          I_Info_Source_ID ,    
                          I_Enquiry_Type_ID ,    
                          S_Is_Corporate ,    
                          S_Enquiry_Desc ,    
                          S_Title ,    
                          S_First_Name ,    
                          S_Middle_Name ,    
                          S_Last_Name ,    
                          Dt_Birth_Date ,    
                          S_Age ,    
                          S_Student_Photo ,    
                          I_Qualification_Name_ID ,    
                          C_Skip_Test ,    
                          I_Stream_ID ,    
                          S_Email_ID ,    
                          S_Phone_No ,    
                          S_Mobile_No ,    
                          I_Curr_City_ID ,    
                          I_Curr_State_ID ,    
                          I_Curr_Country_ID ,    
                          S_Guardian_Name ,    
                          I_Guardian_Occupation_ID ,    
                          S_Guardian_Email_ID ,    
                          S_Guardian_Phone_No ,    
                          S_Guardian_Mobile_No ,    
                          I_Income_Group_ID ,    
                          S_Curr_Address1 ,    
                          S_Curr_Address2 ,    
                          S_Curr_Pincode ,    
                          S_Curr_Area ,    
                          S_Perm_Address1 ,    
                          S_Perm_Address2 ,    
                          S_Perm_Pincode ,    
                          I_Perm_City_ID ,    
                          I_Perm_State_ID ,    
                          I_Perm_Country_ID ,    
                          S_Perm_Area ,    
                          I_Residence_Area_ID ,    
                          S_Crtd_By ,    
                          Dt_Crtd_On ,    
                          I_Corporate_ID ,    
                          I_Corporate_Plan_ID ,    
                          I_Caste_ID ,    
                          S_Father_Name ,    
                          S_Mother_Name ,    
                          B_IsPreEnquiry ,    
                          I_Sex_ID ,    
                          I_Native_Language_ID ,    
                          I_Nationality_ID ,    
                          I_Religion_ID ,    
                          I_Marital_Status_ID ,    
                          I_Blood_Group_ID ,    
                          I_Father_Qualification_ID ,    
                          I_Father_Occupation_ID ,    
                          I_Father_Business_Type_ID ,    
                          S_Father_Company_Name ,    
                          S_Father_Designation ,    
                          S_Father_Office_Phone ,    
                          I_Father_Income_Group_ID ,    
                          S_Father_Photo ,    
                          S_Father_Office_Address ,    
                          I_Mother_Qualification_ID ,    
                          I_Mother_Occupation_ID ,    
                          I_Mother_Business_Type_ID ,    
                          S_Mother_Designation ,    
                          S_Mother_Company_Name ,    
  S_Mother_Office_Address ,    
                          S_Mother_Office_Phone ,    
                          I_Mother_Income_Group_ID ,    
                          S_Mother_Photo ,    
                          S_Guardian_Relationship ,    
                          S_Guardian_Address ,    
                          I_Monthly_Family_Income_ID ,    
                          B_Can_Sponsor_Education ,    
                          S_Sibling_ID ,    
                          B_Has_Given_Exam ,    
                          I_Attempts ,    
                          S_Other_Institute ,    
                          N_Duration ,    
                          I_Seat_Type_ID ,    
                          I_Enrolment_Type_ID ,    
                          S_Enrolment_No ,    
                          I_Rank_Obtained ,    
                          S_Univ_Registration_No ,    
                          S_Univ_Roll_No ,    
                          I_Scholar_Type_ID,    
                          S_Second_Language_Opted,    
                          S_Physical_Ailment,  
                          B_IsLateral,
                          N_Test_Score    
                        )    
                VALUES  ( @Centre , -- I_Centre_Id - int    
                          @OccupationID , -- I_Occupation_ID - int    
                          @PrefCareerID , -- I_Pref_Career_ID - int    
                          1 , -- I_Enquiry_Status_Code - int    
                          @InfoSourceID , -- I_Info_Source_ID - int    
                          @EnquiryTypeID , -- I_Enquiry_Type_ID - int    
                          @IsCorporate , -- S_Is_Corporate - varchar(20)    
                          @EnquiryDesc , -- S_Enquiry_Desc - varchar(500)    
                          @Title , -- S_Title - varchar(10)    
                          @FirstName , -- S_First_Name - varchar(50)    
                          @MiddleName , -- S_Middle_Name - varchar(50)    
                          @LastName , -- S_Last_Name - varchar(50)    
                          @DtBirthDate , -- Dt_Birth_Date - datetime    
                          @Age , -- S_Age - varchar(20)    
                          @sStudentPhoto  , -- S_Student_Photo - varchar(500)    
                          @QualificationNameID  , -- I_Qualification_Name_ID - int    
                          @SkipTest , -- C_Skip_Test - char(1)    
                          @StreamID , -- I_Stream_ID - int    
                          @EmailID  , -- S_Email_ID - varchar(200)    
                          @PhoneNo , -- S_Phone_No - varchar(20)    
                          @MobileNo , -- S_Mobile_No - varchar(20)    
                          @CurrCityID , -- I_Curr_City_ID - int    
                          @CurrStateID , -- I_Curr_State_ID - int    
                          @CurrCountryID , -- I_Curr_Country_ID - int    
                          @GuardianName , -- S_Guardian_Name - varchar(200)    
                          @GuardianOccupationID , -- I_Guardian_Occupation_ID - int    
                          @GuardianEmailID , -- S_Guardian_Email_ID - varchar(200)    
                          @GuardianPhoneNo , -- S_Guardian_Phone_No - varchar(20)    
                          @GuardianMobileNo , -- S_Guardian_Mobile_No - varchar(20)    
                          @IncomeGroupID , -- I_Income_Group_ID - int    
                          @CurrAddress1 , -- S_Curr_Address1 - varchar(200)    
                          @CurrAddress2 , -- S_Curr_Address2 - varchar(200)    
                          @CurrPincode , -- S_Curr_Pincode - varchar(20)    
                          @CurrArea , -- S_Curr_Area - varchar(50)    
                          @PermAddress1 , -- S_Perm_Address1 - varchar(200)    
                          @PermAddress2 , -- S_Perm_Address2 - varchar(200)    
                          @PermPincode , -- S_Perm_Pincode - varchar(20)    
                          @PermCityID , -- I_Perm_City_ID - int    
                          @PermStateID , -- I_Perm_State_ID - int    
                   @PermCountryID , -- I_Perm_Country_ID - int    
                          @PermArea , -- S_Perm_Area - varchar(50)    
                          @iResidenceArea  , -- I_Residence_Area_ID - int    
                          @CrtdBy  , -- S_Crtd_By - varchar(20)    
                    @DtCrtdOn , -- Dt_Crtd_On - datetime    
                          @iCorporateID , -- I_Corporate_ID - int    
                          @iCorporatePlanID , -- I_Corporate_Plan_ID - int    
                          @casteID  , -- I_Caste_ID - int    
                          @sFatherName , -- S_Father_Name - varchar(200)    
                          @sMotherName , -- S_Mother_Name - varchar(200)    
                          0 , -- B_IsPreEnquiry - bit    
                          @iSex , -- I_Sex_ID - int    
                          @iNativeLanguage  , -- I_Native_Language_ID - int    
                          @iNationality , -- I_Nationality_ID - int    
                          @iReligion , -- I_Religion_ID - int    
                          @iMaritalStatus , -- I_Marital_Status_ID - int    
                          @iBloodGroup , -- I_Blood_Group_ID - int    
                          @iFatherQualification , -- I_Father_Qualification_ID - int    
                          @iFatherOccupation , -- I_Father_Occupation_ID - int    
                          @iFatherBusinessType , -- I_Father_Business_Type_ID - int    
                          @sFatherCompany , -- S_Father_Company_Name - varchar(200)    
                          @sFatherDesignation , -- S_Father_Designation - varchar(200)    
                          @sFatherOfficePhone , -- S_Father_Office_Phone - varchar(20)    
                          @iFatherIncomeGroup , -- I_Father_Income_Group_ID - int    
                          @sFatherPhoto , -- S_Father_Photo - varchar(500)    
                          @sFatherOfficeAddress , -- S_Father_Office_Address - varchar(2000)    
                          @iMotherQualification , -- I_Mother_Qualification_ID - int    
                          @iMotherOccupation , -- I_Mother_Occupation_ID - int    
                          @iMotherBusinessType , -- I_Mother_Business_Type_ID - int    
                          @sMotherDesignation , -- S_Mother_Designation - varchar(200)    
                          @sMotherCompany , -- S_Mother_Company_Name - varchar(200)    
                          @sMotherOfficeAddress , -- S_Mother_Office_Address - varchar(2000)    
                          @sMotherOfficePhone , -- S_Mother_Office_Phone - varchar(20)    
                          @iMotherIncomeGroup , -- I_Mother_Income_Group_ID - int    
                          @sMotherPhoto , -- S_Mother_Photo - varchar(500)    
                          @sGuardianRelation , -- S_Guardian_Relationship - varchar(200)    
                          @sGuardianAddress , -- S_Guardian_Address - varchar(2000)    
                          @iMonthlyFamilyIncome , -- I_Monthly_Family_Income_ID - int    
                          @bCanSponsorEducation , -- B_Can_Sponsor_Education - bit    
                          @sSiblingID , -- S_Sibling_ID - varchar(500)    
                          @bHasGivenOtherExam , -- B_Has_Given_Exam - bit    
                          @iNoOfAttempts , -- I_Attempts - int    
                          @sOtherInstitute , -- S_Other_Institute - varchar(50)    
                          @nDuration , -- N_Duration - decimal    
                          @iSeatType , -- I_Seat_Type_ID - int    
                          @iEnrolmentType , -- I_Enrolment_Type_ID - int    
                          @sEnrolmentNo , -- S_Enrolment_No - varchar(50)    
                          @iRankObtained , -- I_Rank_Obtained - int    
                          @sUniversityRegnNo , -- S_Univ_Registration_No - varchar(50)    
                          @sUnivRollNo , -- S_Univ_Roll_No - varchar(50)    
                          @iScholarType,  -- I_Scholar_Type_ID - int    
             @sSecondLanguageOpted,    
                          @sPhysicalAilment,  
                          @IsLateral,
                          CAST(@TestScore AS DECIMAL(14,1))    
                        )               
                
                SELECT  @iEnquiryID = SCOPE_IDENTITY()                 
                    
                UPDATE  dbo.T_Enquiry_Regn_Detail    
                SET     S_Enquiry_No = CAST(@iEnquiryID AS VARCHAR(20))    
                WHERE   I_Enquiry_Regn_ID = @iEnquiryID                
           
    
    --Update enquiry Qualification Information       
    INSERT INTO dbo.T_Enquiry_Qualification_Details    
    ( I_Enquiry_Regn_ID ,    
     S_Name_Of_Exam ,    
     S_University_Name ,    
     S_Year_From ,    
     S_Year_To ,    
     S_Subject_Name ,    
     N_Marks_Obtained ,    
     N_Percentage ,    
     S_Division ,    
     I_Status ,    
     S_Crtd_By ,    
     Dt_Crtd_On    
    )    
    SELECT  @iEnquiryID,T.c.value('@S_Name_Of_Exam', 'varchar(200)') ,    
                        T.c.value('@S_University_Name', 'varchar(200)') ,    
                        T.c.value('@S_Year_From', 'varchar(4)') ,    
                        T.c.value('@S_Year_To', 'varchar(4)') ,    
                        T.c.value('@S_Subject_Name', 'varchar(200)') ,    
                        T.c.value('@N_Marks_Obtained', 'decimal(18,2)') ,    
                        T.c.value('@N_Percentage', 'decimal(18, 2)') ,    
                        T.c.value('@S_Division', 'varchar(50)') ,1,@CrtdBy,@DtCrtdOn    
                FROM    @sQualificationXML.nodes('/Root/Qualification') T ( c )
                
                
                --akash
                                INSERT  INTO dbo.T_Enquiry_Aim
                        ( I_Aim_ID ,
                          S_Crtd_By ,
                          Dt_Crtd_On ,
                          I_Enquiry_Regn_ID  
                          
                        )
                        SELECT  * , -- I_Aim_ID - int
                                @CrtdBy , -- S_Crtd_By - varchar(max)
                                @DtCrtdOn ,
                                @iEnquiryID
                        FROM    dbo.fnString2Rows(@sSelectedAimID, ',') FSR 
                        
                        INSERT  INTO dbo.T_Enquiry_Counseling_Focus
                        ( I_Counseling_Focus_ID ,
                          S_Crtd_By ,
                          Dt_Crtd_On ,
                          I_Enquiry_Regn_ID  
                          
                        )
                        SELECT  * , -- I_Counseling_Focus_ID - int
                                @CrtdBy , -- S_Crtd_By - varchar(max)
                                @DtCrtdOn ,
                                @iEnquiryID
                        FROM    dbo.fnString2Rows(@sSelectedFocusID, ',') FSR
                        
                        INSERT  INTO dbo.T_Enquiry_Education_CurrentStatus
                        ( I_Enquiry_Regn_ID ,
                          I_Education_CurrentStatus_ID ,
                          S_Crtd_By ,
                          Dt_Crtd_On 
                        )
                VALUES  ( @iEnquiryID , -- I_Enquiry_Regn_ID - int
                          @EducationCurrentStatus , -- I_Education_CurrentStatus_ID - int
                          @CrtdBy , -- S_Crtd_By - varchar(max)
                          @DtCrtdOn -- Dt_Crtd_On - datetime
           
                        )
                        
                        INSERT  INTO dbo.T_Enquiry_Education_Stream
                        ( I_Enquiry_Regn_ID ,
                          I_Education_Stream_ID ,
                          S_Crtd_By ,
                          Dt_Crtd_On
                        )
                VALUES  ( @iEnquiryID , -- I_Enquiry_Regn_ID - int
                          @EducationStream , -- I_Education_Stream_ID - int
                          @CrtdBy , -- S_Crtd_By - varchar(max)
                          @DtCrtdOn  -- Dt_Crtd_On - datetime
            
                        )
                        
                        INSERT  INTO dbo.T_Enquiry_Education_Qualification
                        ( I_Enquiry_Regn_ID ,
                          I_Education_Qualification_ID ,
                          S_Crtd_By ,
                          Dt_Crtd_On
                        )
                VALUES  ( @iEnquiryID , -- I_Enquiry_Regn_ID - int
                          @EducationPostGrad , -- I_Education_Qualification_ID - int
                          @CrtdBy , -- S_Crtd_By - varchar(max)
                          @DtCrtdOn  -- Dt_Crtd_On - datetime
            
                        )
                        
                        INSERT  INTO dbo.T_Enquiry_Employment_Details
                        ( I_Enquiry_Regn_ID ,
                          I_Employment_Details_ID ,
                          S_Crtd_By ,
                          Dt_Crtd_On
                        )
                VALUES  ( @iEnquiryID , -- I_Enquiry_Regn_ID - int
                          @IndustryType , -- I_Employment_Details_ID - int
                          @CrtdBy , -- S_Crtd_By - varchar(max)
                          @DtCrtdOn  -- Dt_Crtd_On - datetime
            
                        )       
                        
                                        UPDATE  dbo.T_Enquiry_Employment_Details
                SET     S_Experience = @YrsofExp
                WHERE   I_Enquiry_Regn_ID = @iEnquiryID
                UPDATE  dbo.T_Enquiry_Employment_Details
                SET     S_Role = @JobRole
                WHERE   I_Enquiry_Regn_ID = @iEnquiryID
                UPDATE  dbo.T_Enquiry_Employment_Details
                SET     S_Salary = @JobSalary
                WHERE   I_Enquiry_Regn_ID = @iEnquiryID
                
                INSERT  INTO dbo.T_Enquiry_IT_Skills
                        ( I_Enquiry_Regn_ID ,
                          I_IT_Skills_ID ,
                          S_Crtd_By ,
                          Dt_Crtd_On
                        )
                VALUES  ( @iEnquiryID , -- I_Enquiry_Regn_ID - int
                          @ITSkills , -- I_IT_Skills_ID - int
                          @CrtdBy , -- S_Crtd_By - varchar(max)
                          @DtCrtdOn -- Dt_Crtd_On - datetime
           
                        )
                        
                        INSERT  INTO dbo.T_Enquiry_Reference_Details
                        ( I_Enquiry_Regn_ID ,
                          S_Name ,
                          S_Contact_No ,
                          S_Address
                        )
                        SELECT  @iEnquiryID ,
                                T.c.value('@S_Name', 'varchar(MAX)') ,
                                T.c.value('@S_Contact_No', 'varchar(MAX)') ,
                                T.c.value('@S_Address', 'varchar(MAX)')
                        FROM    @sReferenceXML.nodes('/Root/Reference') T ( c )
                        
                        INSERT  INTO dbo.T_Enquiry_PostCounselling_Feedback_Details
                        ( I_Enquiry_Regn_ID ,
                          S_Question ,
                          I_Points
                        )
                        SELECT  @iEnquiryID ,
                                T.c.value('@S_Question', 'varchar(MAX)') ,
                                CAST(T.c.value('@S_Points', 'varchar(MAX)') AS INT)
                        FROM    @sFeedbackXML.nodes('/Root/Feedback') T ( c ) 
                        
                        
                --akash     
                    
                
    -- Update the Courses for the Enquiry                
                INSERT  INTO dbo.T_Enquiry_Course    
                        ( I_Course_ID ,    
                          I_Enquiry_Regn_ID    
                        )    
                        SELECT  * ,    
                                @iEnquiryID    
                        FROM    dbo.fnString2Rows(@sSelectedCourseID, ',')                
                
    -- Get the Employee Id of the Councellor                 
                SELECT  @iEmployeeId = I_Employee_ID    
                FROM    dbo.T_Employee_Dtls    
                WHERE   I_Employee_ID = ( SELECT    I_Reference_ID    
                                          FROM      dbo.T_User_Master    
                                          WHERE     S_Login_ID = @CrtdBy    
                                        )                
                   
    -- Update the first followup information for the enquiry                
                INSERT  INTO dbo.T_Enquiry_Regn_FollowUp    
                        ( I_Enquiry_Regn_ID ,    
                          I_Employee_ID ,    
                          Dt_Followup_Date ,    
                          Dt_Next_Followup_Date ,    
                          S_Followup_Remarks    
                        )    
                VALUES  ( @iEnquiryID ,    
                          @iEmployeeId ,    
                          @DtCrtdOn ,    
                          @dtFirstFollowUpDate ,    
                          'First FollowUp after Enquiry'                  
                        )                
                   
                SELECT  @iEnquiryID AS EnquiryNumber     
         END    
         ELSE     
         BEGIN    
             RAISERROR('Entry with the same mobile no. already exists',11,1)    
         END                
                            
        COMMIT TRANSACTION                
    END TRY                
    BEGIN CATCH                
 --Error occurred:                  
        ROLLBACK TRANSACTION                 
        DECLARE @ErrMsg NVARCHAR(4000) ,    
            @ErrSeverity INT                
        SELECT  @ErrMsg = ERROR_MESSAGE() ,    
                @ErrSeverity = ERROR_SEVERITY()                
                
        RAISERROR(@ErrMsg, @ErrSeverity, 1)                
    END CATCH  
