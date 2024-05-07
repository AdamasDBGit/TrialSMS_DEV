﻿CREATE PROCEDURE [dbo].[uspInsertEnquiryUploadDetails]
    (
      @sEnquiryMigrationXML XML = NULL     
    )
AS	
    BEGIN TRY                  
        SET NOCOUNT OFF; 
        
        DECLARE @AcademicYear VARCHAR(10)='2023'
        
        BEGIN TRANSACTION                  
         
         -- Create Temporary Table To TimeTable Parent Information            
        CREATE TABLE #tempInterfaceTable
            (
              ID INT IDENTITY(1, 1) ,
              CenterId INT ,
              FirstName VARCHAR(50) ,
              MiddleName VARCHAR(50) ,
              LastName VARCHAR(50) ,
              DOB DATETIME ,
              Age VARCHAR(20) ,
              MobileNo VARCHAR(12) ,
              CourseAppliedFor VARCHAR(MAX) ,
              FatherName VARCHAR(50) ,
              FatherContact VARCHAR(12) ,
              MotherName VARCHAR(50) ,
              MotherContact VARCHAR(12) ,
              [Address] VARCHAR(200) ,
              Country VARCHAR(20) ,
              [State] VARCHAR(20) ,
              City VARCHAR(20) ,
              Pincode VARCHAR(20) ,
              MotherTongue VARCHAR(20) ,
              Sex VARCHAR(20) ,
              Religion VARCHAR(20) ,
              Email VARCHAR(200) ,
              Scholar VARCHAR(20) ,
              BloodGrp VARCHAR(20) ,
              Nationality VARCHAR(20) ,
              SocialCategory VARCHAR(20) ,
              FamilyIncome VARCHAR(20) ,
              S_CrtdBy VARCHAR(20) ,
              Dt_CrtdOn DATETIME ,
              I_Status_ID INT ,
              FormNo VARCHAR(MAX) ,
              Amount DECIMAL(14, 2) ,
              TransactionNo VARCHAR(MAX) ,
              ReceiptNo VARCHAR(MAX) ,
              ExtReceiptDate DATETIME ,
              [Source] VARCHAR(MAX) ,
              DepositedAccNo VARCHAR(MAX)
            )  
            
        CREATE TABLE #InterfaceTable
            (
              ID INT IDENTITY(1, 1) ,
              EnquiryID INT ,
              CenterId INT ,
              FirstName VARCHAR(50) ,
              MiddleName VARCHAR(50) ,
              LastName VARCHAR(50) ,
              DOB DATETIME ,
              Age VARCHAR(20) ,
              MobileNo VARCHAR(12) ,
              CourseAppliedFor INT ,
              FatherName VARCHAR(50) ,
              FatherContact VARCHAR(12) ,
              MotherName VARCHAR(50) ,
              MotherContact VARCHAR(12) ,
              [Address] VARCHAR(200) ,
              Country INT ,
              [State] INT ,
              City INT ,
              Pincode VARCHAR(20) ,
              MotherTongue INT ,
              Sex INT ,
              Religion INT ,
              Email VARCHAR(200) ,
              Scholar INT ,
              BloodGrp INT ,
              Nationality INT ,
              SocialCategory INT ,
              FamilyIncome INT ,
              S_CrtdBy VARCHAR(20) ,
              Dt_CrtdOn DATETIME ,
              I_Status_ID INT ,
              FormNo VARCHAR(MAX) ,
              Amount DECIMAL(14, 2) ,
              TransactionNo VARCHAR(MAX) ,
              ReceiptNo VARCHAR(MAX) ,
              ExtReceiptDate DATETIME ,
              [Source] VARCHAR(MAX) ,
              DepositedAccNo VARCHAR(MAX)
            )    
            
        INSERT  INTO #tempInterfaceTable
                ( CenterId ,
                  FirstName ,
                  MiddleName ,
                  LastName ,
                  DOB ,
                  Age ,
                  MobileNo ,
                  CourseAppliedFor ,
                  FatherName ,
                  FatherContact ,
                  MotherName ,
                  MotherContact ,
                  [Address] ,
                  Country ,
                  [State] ,
                  City ,
                  Pincode ,
                  MotherTongue ,
                  Sex ,
                  Religion ,
                  Email ,
                  Scholar ,
                  BloodGrp ,
                  Nationality ,
                  SocialCategory ,
                  FamilyIncome ,
                  S_CrtdBy ,
                  Dt_CrtdOn ,
                  I_Status_ID ,
                  FormNo ,
                  Amount ,
                  TransactionNo ,
                  ReceiptNo ,
                  ExtReceiptDate ,
                  [Source] ,
                  DepositedAccNo
                )
                SELECT  T.c.value('@CenterId', 'int') ,
                        T.c.value('@FirstName', 'varchar(50)') ,
                        T.c.value('@MiddleName', 'varchar(50)') ,
                        T.c.value('@LastName', 'varchar(50)') ,
                        T.c.value('@DOB', 'datetime') ,
                        CASE WHEN T.c.value('@Age', 'varchar(10)') = ''
                             THEN NULL
                             ELSE T.c.value('@Age', 'varchar(10)')
                        END ,
                        T.c.value('@MobileNo', 'varchar(12)') ,
                        CASE WHEN T.c.value('@CourseAppliedFor',
                                            'varchar(MAX)') = '' THEN NULL
                             ELSE T.c.value('@CourseAppliedFor',
                                            'varchar(MAX)')
                        END ,
                        CASE WHEN T.c.value('@FatherName', 'varchar(50)') = ''
                             THEN NULL
                             ELSE T.c.value('@FatherName', 'varchar(50)')
                        END ,
                        CASE WHEN T.c.value('@FatherContact', 'varchar(12)') = ''
                             THEN NULL
                             ELSE T.c.value('@FatherContact', 'varchar(12)')
                        END ,
                        CASE WHEN T.c.value('@MotherName', 'varchar(50)') = ''
                             THEN NULL
                             ELSE T.c.value('@MotherName', 'varchar(50)')
                        END ,
                        CASE WHEN T.c.value('@MotherContact', 'varchar(12)') = ''
                             THEN NULL
                             ELSE T.c.value('@MotherContact', 'varchar(12)')
                        END ,
                        CASE WHEN T.c.value('@Address', 'varchar(200)') = ''
                             THEN NULL
                             ELSE T.c.value('@Address', 'varchar(200)')
                        END ,
                        CASE WHEN T.c.value('@Country', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@Country', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@State', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@State', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@City', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@City', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@Pincode', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@Pincode', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@MotherTongue', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@MotherTongue', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@Sex', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@Sex', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@Religion', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@Religion', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@Email', 'varchar(200)') = ''
                             THEN NULL
                             ELSE T.c.value('@Email', 'varchar(200)')
                        END ,
                        CASE WHEN T.c.value('@Scholar', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@Scholar', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@BloodGrp', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@BloodGrp', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@Nationality', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@Nationality', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@SocialCategory', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@SocialCategory', 'varchar(20)')
                        END ,
                        CASE WHEN T.c.value('@FamilyIncome', 'varchar(20)') = ''
                             THEN NULL
                             ELSE T.c.value('@FamilyIncome', 'varchar(20)')
                        END ,
                        T.c.value('@S_CrtdBy', 'varchar(20)') ,
                        T.c.value('@Dt_CrtdOn', 'datetime') ,
                        1 ,
                        CASE WHEN T.c.value('@ApplicationNo', 'varchar(MAX)') = ''
                             THEN NULL
                             ELSE T.c.value('@ApplicationNo', 'varchar(MAX)')
                        END ,
                        CAST( CASE WHEN T.c.value('@AmountPaid', 'varchar(MAX)') = ''
                             THEN NULL
                             ELSE T.c.value('@AmountPaid', 'varchar(MAX)')
                        END AS DECIMAL(14,2)) ,
                        CASE WHEN T.c.value('@TransactionNo', 'varchar(MAX)') = ''
                             THEN NULL
                             ELSE T.c.value('@TransactionNo', 'varchar(MAX)')
                        END ,
                        CASE WHEN T.c.value('@ReceiptNo', 'varchar(MAX)') = ''
                             THEN NULL
                             ELSE T.c.value('@ReceiptNo', 'varchar(MAX)')
                        END ,
                        CASE WHEN T.c.value('@ReceiptDate', 'datetime') = ''
                             THEN NULL
                             ELSE T.c.value('@ReceiptDate', 'datetime')
                        END ,
                        CASE WHEN T.c.value('@PaymentSource', 'varchar(MAX)') = ''
                             THEN NULL
                             ELSE T.c.value('@PaymentSource', 'varchar(MAX)')
                        END ,
                        CASE WHEN T.c.value('@DepositAccNo', 'varchar(MAX)') = ''
                             THEN NULL
                             ELSE T.c.value('@DepositAccNo', 'varchar(MAX)')
                        END
                FROM    @sEnquiryMigrationXML.nodes('/Root/EnquiryMigration') T ( c )
                
                
                --SELECT * FROM #tempInterfaceTable AS TIT
                
                
        DECLARE @idmin INT= ( SELECT    MIN(ID) AS MinID
                              FROM      #tempInterfaceTable AS TIT
                              WHERE     TIT.I_Status_ID = 1
                            )
        DECLARE @idmax INT= ( SELECT    MAX(ID) AS MaxID
                              FROM      #tempInterfaceTable AS TIT
                              WHERE     TIT.I_Status_ID = 1
                            )
                
                
        WHILE ( @idmin <= @idmax )
            BEGIN
                
                IF EXISTS ( SELECT  *
                            FROM    #tempInterfaceTable AS TIT
                            WHERE   TIT.ID = @idmin
                                    AND TIT.I_Status_ID = 1 )
                    BEGIN
                
                        DECLARE @brandid INT= NULL
                        DECLARE @courseappliedid INT= NULL
                        DECLARE @countryid INT= NULL
                        DECLARE @stateid INT= NULL
                        DECLARE @cityid INT= NULL
                        DECLARE @mothertongueid INT= NULL
                        DECLARE @sexid INT= NULL
                        DECLARE @religionid INT= NULL
                        DECLARE @bloodgrpid INT= NULL
                        DECLARE @nationalityid INT= NULL
                        DECLARE @socialcategoryid INT= NULL
                        DECLARE @incomeid INT= NULL
                        DECLARE @EmployeeId VARCHAR(MAX)= NULL
                        DECLARE @scholarid INT= NULL
                
                        SELECT  @brandid = TCHND.I_Brand_ID
                        FROM    dbo.T_Center_Hierarchy_Name_Details AS TCHND
                                INNER JOIN #tempInterfaceTable AS TIT ON TCHND.I_Center_ID = TIT.CenterId
                        WHERE   TIT.ID = @idmin
                
                        SELECT TOP 1 @courseappliedid = TCM.I_Course_ID
                        FROM    dbo.T_Course_Master AS TCM
                                INNER JOIN #tempInterfaceTable AS TIT ON  UPPER(TCM.S_Course_Name) LIKE UPPER('%'+TIT.CourseAppliedFor+'%')
                        WHERE   TIT.ID = @idmin AND TCM.S_Course_Name LIKE '%'+@AcademicYear+'%' AND TCM.I_Brand_ID=@brandid
                        
                        
                        SELECT  TOP 1 @countryid = TCM.I_Country_ID
                        FROM    dbo.T_Country_Master AS TCM
                                INNER JOIN #tempInterfaceTable AS TIT ON TIT.Country  LIKE  UPPER('%'+TCM.S_Country_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        
                        SELECT  TOP 1 @stateid = TSM.I_State_ID
                        FROM    dbo.T_State_Master AS TSM
                                INNER JOIN #tempInterfaceTable AS TIT ON TIT.[State] LIKE UPPER('%'+TSM.S_State_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        
                        SELECT  TOP 1 @cityid = TCM.I_City_ID
                        FROM    dbo.T_City_Master AS TCM
                                INNER JOIN #tempInterfaceTable AS TIT ON TIT.City LIKE UPPER('%'+TCM.S_City_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        
                        SELECT  TOP 1 @mothertongueid = TNL.I_Native_Language_ID
                        FROM    dbo.T_Native_Language AS TNL
                                INNER JOIN #tempInterfaceTable AS TIT ON TIT.MotherTongue LIKE UPPER('%'+TNL.S_Native_Language_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        
                        SELECT  TOP 1 @sexid = TUS.I_Sex_ID
                        FROM    dbo.T_User_Sex AS TUS
                                INNER JOIN #tempInterfaceTable AS TIT ON TIT.Sex LIKE UPPER('%'+TUS.S_Sex_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        
                        SELECT  TOP 1 @religionid = TUR.I_Religion_ID
                        FROM    dbo.T_User_Religion AS TUR
                                INNER JOIN #tempInterfaceTable AS TIT ON TIT.Religion LIKE UPPER('%'+TUR.S_Religion_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        
                        SELECT  @bloodgrpid = TBG.I_Blood_Group_ID
                        FROM    dbo.T_Blood_Group AS TBG
                                INNER JOIN #tempInterfaceTable AS TIT ON TBG.S_Blood_Group = TIT.BloodGrp
                        WHERE   TIT.ID = @idmin
                        
                        
                        SELECT  @nationalityid = TUN.I_Nationality_ID
                        FROM    dbo.T_User_Nationality AS TUN
                                INNER JOIN #tempInterfaceTable AS TIT ON  TUN.S_Nationality LIKE  UPPER('%'+TIT.Nationality+'%')
                        WHERE   TIT.ID = @idmin
                        
                        SELECT  TOP 1 @socialcategoryid = TCM.I_Caste_ID
                        FROM    dbo.T_Caste_Master AS TCM
                                INNER JOIN #tempInterfaceTable AS TIT ON TIT.SocialCategory LIKE UPPER('%'+TCM.S_Caste_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        SELECT  @incomeid = TIGM.I_Income_Group_ID
                        FROM    dbo.T_Income_Group_Master AS TIGM
                                INNER JOIN #tempInterfaceTable AS TIT ON TIGM.S_Income_Group_Name = TIT.FamilyIncome
                        WHERE   TIT.ID = @idmin
                        
                        SELECT  @EmployeeId = TUM.S_Login_ID
                        FROM    dbo.T_User_Master AS TUM
                                INNER JOIN #tempInterfaceTable AS TIT ON TUM.S_Login_ID = TIT.S_CrtdBy
                        WHERE   TIT.ID = @idmin
                        
                        SELECT  @scholarid = TSTM.I_Scholar_Type_ID
                        FROM    dbo.T_Scholar_Type_Master AS TSTM
                                INNER JOIN #tempInterfaceTable AS TIT ON  TIT.Scholar LIKE UPPER('%'+TSTM.S_Scholar_Type_Name+'%')
                        WHERE   TIT.ID = @idmin
                        
                        INSERT  INTO #InterfaceTable
                                ( CenterId ,
                                  FirstName ,
                                  MiddleName ,
                                  LastName ,
                                  DOB ,
                                  Age ,
                                  MobileNo ,
                                  CourseAppliedFor ,
                                  FatherName ,
                                  FatherContact ,
                                  MotherName ,
                                  MotherContact ,
                                  Address ,
                                  Country ,
                                  State ,
                                  City ,
                                  Pincode ,
                                  MotherTongue ,
                                  Sex ,
                                  Religion ,
                                  Email ,
                                  Scholar ,
                                  BloodGrp ,
                                  Nationality ,
                                  SocialCategory ,
                                  FamilyIncome ,
                                  S_CrtdBy ,
                                  Dt_CrtdOn ,
                                  I_Status_ID ,
                                  FormNo ,
                                  Amount ,
                                  TransactionNo ,
                                  ReceiptNo ,
                                  ExtReceiptDate ,
                                  [Source] ,
                                  DepositedAccNo
                                )
                                SELECT  CenterId ,
                                        FirstName ,
                                        MiddleName ,
                                        LastName ,
                                        DOB ,
                                        Age ,
                                        MobileNo ,
                                        @courseappliedid ,
                                        FatherName ,
                                        FatherContact ,
                                        MotherName ,
                                        MotherContact ,
                                        Address ,
                                        @countryid ,
                                        @stateid ,
                                        ISNULL(@cityid,1) ,
                                        Pincode ,
                                        @mothertongueid ,
                                        @sexid ,
                                        @religionid ,
                                        Email ,
                                        @scholarid ,
                                        @bloodgrpid ,
                                        @nationalityid ,
                                        @socialcategoryid ,
                                        @incomeid ,
                                        S_CrtdBy ,
                                        Dt_CrtdOn ,
                                        I_Status_ID ,
                                        FormNo ,
                                        Amount ,
                                        TransactionNo ,
                                        ReceiptNo ,
                                        ExtReceiptDate ,
                                        [Source] ,
                                        DepositedAccNo
                                FROM    #tempInterfaceTable AS TIT
                                WHERE   TIT.ID = @idmin
                        
                
                        SET @idmin = @idmin + 1;
                    END
                
                ELSE
                    BEGIN
                
                        SET @idmin = @idmin + 1;
                
                    END
                
            END
         
        --SELECT * FROM #InterfaceTable AS TIT 
         
        UPDATE  #InterfaceTable
        SET     I_Status_ID = 0
        WHERE   ID IN ( SELECT  IT.ID
                        FROM    #InterfaceTable AS IT
                        WHERE   ( IT.FirstName IS NULL
                                  OR IT.LastName IS NULL
                                  OR IT.CenterId IS NULL
                                  OR IT.DOB IS NULL
                                  OR IT.Age IS NULL
                                  OR IT.MobileNo IS NULL
                                  OR IT.CourseAppliedFor IS NULL
                                  OR IT.FatherName IS NULL
                                  OR IT.FatherContact IS NULL
                                  OR IT.MotherName IS NULL
                                  OR IT.Address IS NULL
                                  OR IT.Country IS NULL
                                  OR IT.State IS NULL
                                  OR IT.City IS NULL
                                  OR IT.Pincode IS NULL
                                  OR IT.MotherTongue IS NULL
                                  OR IT.Sex IS NULL
                                  OR IT.Religion IS NULL
                                  OR IT.Email IS NULL
                                  OR IT.Nationality IS NULL
                                  OR IT.SocialCategory IS NULL
                                  --OR IT.FamilyIncome IS NULL
                                )
                                AND IT.I_Status_ID = 1 ) 
        
        
          
            
        DECLARE @idmin1 INT= ( SELECT   MIN(ID) AS MinID
                               FROM     #InterfaceTable AS TIT
                               WHERE    TIT.I_Status_ID = 1
                             )
        DECLARE @idmax1 INT= ( SELECT   MAX(ID) AS MaxID
                               FROM     #InterfaceTable AS TIT
                               WHERE    TIT.I_Status_ID = 1
                             )
                            
        WHILE ( @idmin1 <= @idmax1 )
            BEGIN
                    
                DECLARE @enquiryid INT
                
                IF ( SELECT COUNT(*)
                     FROM   dbo.T_Enquiry_Regn_Detail AS TERD
                            INNER JOIN #InterfaceTable AS TTT ON TERD.S_Form_No = TTT.FormNo AND TTT.CenterId=TERD.I_Centre_Id
                     WHERE  TTT.ID = @idmin1
                            AND TTT.I_Status_ID = 1
                   ) = 0
                    BEGIN			
                    
                        INSERT  INTO dbo.T_Enquiry_Regn_Detail
                                ( I_Centre_Id ,
                                  I_Enquiry_Status_Code ,
                                  S_First_Name ,
                                  S_Middle_Name ,
                                  S_Last_Name ,
                                  Dt_Birth_Date ,
                                  S_Age ,
                                  C_Skip_Test ,
                                  S_Email_ID ,
                                  S_Mobile_No ,
                                  I_Curr_City_ID ,
                                  I_Curr_State_ID ,
                                  I_Curr_Country_ID ,
                                  I_Income_Group_ID ,
                                  S_Curr_Address1 ,
                                  S_Curr_Pincode ,
                                  S_Crtd_By ,
                                  Dt_Crtd_On ,
                                  I_Caste_ID ,
                                  S_Father_Name ,
                                  S_Mother_Name ,
                                  B_IsPreEnquiry ,
                                  I_Sex_ID ,
                                  I_Native_Language_ID ,
                                  I_Nationality_ID ,
                                  I_Religion_ID ,
                                  I_Blood_Group_ID ,
                                  S_Father_Office_Phone ,
                                  S_Mother_Office_Phone ,
                                  B_Has_Given_Exam ,
                                  I_Scholar_Type_ID ,
                                  S_Form_No ,
                                  I_PreEnquiryFor ,
                                  I_Relevence_ID ,
                                  Enquiry_Date ,
                                  Enquiry_Crtd_By
                                )
                                SELECT  IT.CenterId ,
                                        1 ,
                                        IT.FirstName ,
                                        IT.MiddleName ,
                                        IT.LastName ,
                                        IT.DOB ,
                                        IT.Age ,
                                        'T' ,
                                        IT.Email ,
                                        IT.MobileNo ,
                                        IT.City ,
                                        IT.State ,
                                        IT.Country ,
                                        IT.FamilyIncome ,
                                        IT.Address ,
                                        IT.Pincode ,
                                        IT.S_CrtdBy ,
                                        IT.ExtReceiptDate ,
                                        IT.SocialCategory ,
                                        IT.FatherName ,
                                        IT.MotherName ,
                                        1 ,
                                        IT.Sex ,
                                        IT.MotherTongue ,
                                        IT.Nationality ,
                                        IT.Religion ,
                                        IT.BloodGrp ,
                                        IT.FatherContact ,
                                        IT.MotherContact ,
                                        0 ,
                                        IT.Scholar ,
                                        NULL ,
                                        NULL ,
                                        1 ,
                                        GETDATE() ,
                                        IT.S_CrtdBy
                                FROM    #InterfaceTable AS IT
                                WHERE   IT.ID = @idmin1
                                        AND IT.I_Status_ID = 1
					
                        SET @enquiryid = SCOPE_IDENTITY()
					
                        INSERT  INTO dbo.T_Enquiry_Course
                                ( I_Course_ID ,
                                  I_Enquiry_Regn_ID 
					            )
                                SELECT  IT.CourseAppliedFor ,
                                        @enquiryid
                                FROM    #InterfaceTable AS IT
                                WHERE   IT.ID = @idmin1
                                        AND IT.I_Status_ID = 1
					
                        UPDATE  dbo.T_Enquiry_Regn_Detail
                        SET     S_Enquiry_No = CAST(@enquiryid AS VARCHAR)
                        WHERE   I_Enquiry_Regn_ID = @enquiryid
                
                        UPDATE  #InterfaceTable
                        SET     EnquiryID = @enquiryid
                        WHERE   ID = @idmin1
                                AND I_Status_ID = 1
                
                
                        INSERT  INTO dbo.T_Enquiry_Regn_Followup
                                ( I_Enquiry_Regn_ID ,
                                  I_Employee_ID ,
                                  Dt_Followup_Date ,
                                  Dt_Next_Followup_Date ,
                                  S_Followup_Remarks    
                                )
                                SELECT  IT.EnquiryID ,
                                        NULL ,
                                        IT.Dt_CrtdOn ,
                                        DATEADD(d, 10, IT.ExtReceiptDate) ,
                                        'First FollowUp after Enquiry'
                                FROM    #InterfaceTable AS IT
                                WHERE   IT.ID = @idmin1
                                        AND IT.I_Status_ID = 1
                                        
                                        
                        --Payment-- 
                        
                        DECLARE @CenterID INT=NULL
                        DECLARE @Amount DECIMAL(14,2)=NULL
                        DECLARE @CrtdBy VARCHAR(MAX)
                        DECLARE @CrtdOn DATETIME
                        DECLARE @iBrandID INT=NULL
                        DECLARE @TransNo VARCHAR(MAX)=NULL
                        DECLARE @ExtReceiptNo VARCHAR(MAX) =NULL
                        DECLARE @ExtReceiptDate DATETIME=NULL
                        DECLARE @Source VARCHAR(MAX)=NULL
                        DECLARE @DepositAcc VARCHAR(MAX)=NULL
                        DECLARE @FormNo VARCHAR(MAX)=NULL
                        
                        
                        SET @CenterID=(SELECT IT.CenterId FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)
                        SET @iBrandID=(SELECT I_Brand_ID FROM T_Center_Hierarchy_Name_Details WHERE I_Center_ID=@CenterID)
                        SET @Amount=(SELECT IT.Amount FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid) 
                        SET @CrtdBy=(SELECT IT.S_CrtdBy FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)
                        SET @CrtdOn=(SELECT IT.Dt_CrtdOn FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)
                        SET @TransNo=(SELECT IT.TransactionNo FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)
                        SET @ExtReceiptNo=(SELECT IT.ReceiptNo FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)
                        SET @ExtReceiptDate=(SELECT IT.ExtReceiptDate FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid) 
                        SET @Source=(SELECT IT.[Source] FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)
                        SET @DepositAcc=(SELECT IT.DepositedAccNo FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)
                        SET @FormNo=(SELECT IT.FormNo FROM #InterfaceTable AS IT WHERE IT.ID=@idmin1 AND IT.I_Status_ID=1 AND IT.EnquiryID=@enquiryid)        
                         
                        IF (@CenterID IS NOT NULL AND @enquiryid IS NOT NULL)
                        
                        BEGIN
                                        
                        EXEC dbo.uspGenerateOnAccReceiptFromExtSource @iCenterId = @CenterID, -- int
                            @iAmount = @Amount, -- numeric
                            @iReceiptDate = @CrtdOn, -- datetime
                            @iEnquiryID = @enquiryid, -- int
                            @sFormNo = @FormNo, -- varchar(100)
                            @iBrandID = @iBrandID, -- int
                            @TransactionNo = @TransNo, -- varchar(max)
                            @ExtReceiptNo = @ExtReceiptNo, -- varchar(max)
                            @ExtReceiptDate = @ExtReceiptDate, -- varchar(max)
                            @Source = @Source, -- varchar(max)
                            @DepositAccNo = @DepositAcc, -- varchar(max)
                            @CrtdBy = @CrtdBy, -- varchar(50)
                            @CrtdOn = @CrtdOn -- datetime
                            
                         END
                            
                            
                            
                            --Payment-- 
                                        
                                        
					
                        UPDATE  #InterfaceTable
                        SET     I_Status_ID = 2
                        WHERE   ID = @idmin1
                                AND I_Status_ID = 1
					
                        SET @idmin1 = @idmin1 + 1
                
                    END
                
                ELSE
                    BEGIN
                    
                        DECLARE @MobNo NVARCHAR(20)= ( SELECT CAST(IT.MobileNo AS NVARCHAR)
                                                       FROM   #InterfaceTable
                                                              AS IT
                                                       WHERE  IT.ID = @idmin1
                                                              AND IT.I_Status_ID = 1
                                                     )
                        UPDATE  #InterfaceTable
                        SET     I_Status_ID = 0
                        WHERE   ID = @idmin1
                        DECLARE @errorstring VARCHAR(200)= 'Entry with the same mobile no. ('
                            + CAST(@MobNo AS VARCHAR) + ') already exists'
                
                        RAISERROR(@errorstring,11,1) 
                
                    END
                
                    
            END
            
                    --SELECT * FROM #InterfaceTable AS TIT 
                            
        SELECT  TTT.ID,
				TERD.S_Enquiry_No ,
                TERD.S_First_Name ,
                TERD.S_Last_Name ,
                TERD.S_Mobile_No,
                TERD.S_Form_No AS FormNo
        FROM    dbo.T_Enquiry_Regn_Detail AS TERD
                INNER JOIN #InterfaceTable AS TTT ON TERD.S_Mobile_No = TTT.MobileNo
                                                     AND TERD.I_Enquiry_Regn_ID = TTT.EnquiryID
        WHERE   TTT.I_Status_ID = 2
                AND TERD.I_Enquiry_Status_Code = 1
                 
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

