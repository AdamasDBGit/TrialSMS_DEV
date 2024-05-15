-- exec [dbo].[ERP_uspGetPreEnquiryDetails] 234871, null, null, null, 1          
--exec [dbo].[ERP_uspGetPreEnquiryDetails_POC] 235009,null, null,null, null,null, null, 100, 0, 0, 'asc', null,107,null,8,null               
CREATE PROCEDURE [dbo].[ERP_uspGetPreEnquiryDetails_POC]                          
(                
    -- Add the parameters for the stored procedure here                                        
 @IEnquiryID INT = NULL ,               
 @S_Fullname VARCHAR(MAX) = NULL,              
 @S_FatherName VARCHAR(MAX) = NULL,            
 @S_MotherName VARCHAR(MAX) = NULL,            
 @sMobileNo VARCHAR(20) = NULL ,            
 @AdmissionStageID INT = NULL,            
 @iCenterID INT = NULL,          
 @Limit INT,          
 @Offset INT,          
 @SortCol INT,          
 @SortDir varchar(10),          
 @Search varchar(max) = NULL,      
 @BrandID int ,    
 @FollowTypeID int=Null,    
 @FollowupStatusID char = null    
,@datefiltervalue int=Null  
,@sessionID int=Null  
    --@stuStatusFor INT = NULL   
   
)                
AS                
    BEGIN        
 Declare @Nextdt date    
--Declare @datefiltervalue int    
If @datefiltervalue is not null    
begin    
SET @Nextdt=(    
select DATEADD(day, @datefiltervalue, GETDATE()))    
End    
Else    
Begin    
Set @Nextdt =null    
End    
    
                 
 --DECLARE @iEnquiryID INT=0                
 -- SET NOCOUNT ON added to prevent extra result sets from                                        
 -- interfering with SELECT statements.                                        
        SET NOCOUNT ON        
  If       
  @BrandID=107       
  Begin       
  SET @iCenterID=1       
  End       
  Else       
  if @BrandID=110      
  Begin      
  SET @iCenterID=36      
  End  
  ELSE
  BEGIN
   set @iCenterID = (select top 1 I_Centre_Id from T_Brand_Center_Details  where I_Brand_ID=@BrandID)
  END
 
   
            
 create table #TempTopFollowUpDate         
 (        
  I_Enquiry_Regn_ID int,        
  Dt_Next_Followup_Date datetime      
  ,FollowupType_ID int    
  ,S_Followup_Status char    
  ,S_FollowupStatus_Desc nvarchar(100)    
 )        
        
 -- insert all top nextFollowUpDate in the temp table with the enquiryID        
 INSERT INTO #TempTopFollowUpDate        
 select F.I_Enquiry_Regn_ID, F.Dt_Next_Followup_Date ,F.ERP_R_I_FollowupType_ID ,F.S_Followup_Status  ,M.S_FollowupStatus_Desc    
 from dbo.T_Enquiry_Regn_Detail A        
 LEFT JOIN (SELECT         
             I_Followup_ID, I_Enquiry_Regn_ID, Dt_Next_Followup_Date, ERP_R_I_FollowupType_ID, S_Followup_Status,      
             ROW_NUMBER() OVER (PARTITION BY I_Enquiry_Regn_ID ORDER BY I_Followup_ID DESC) AS RowNumber        
         FROM         
             T_Enquiry_Regn_Followup) F ON A.I_Enquiry_Regn_ID = F.I_Enquiry_Regn_ID      
    left join T_ERP_Followup_StatusM M ON M.I_FollowupStatus_ID = CAST(F.S_Followup_Status AS INT)    
    WHERE         
        F.RowNumber = 1 OR F.I_Followup_ID IS NULL -- Getting the top followup record for each enquiry   
  ---Adding SessionID parameter-----------  
  and A.R_I_School_Session_ID=@sessionID  
        
        
  declare @TotalRecords int, @FilteredRecords int          
          
  -- start          
  SELECT @TotalRecords = COUNT(*)          
  FROM    dbo.T_Enquiry_Regn_Detail A                
   inner join T_ERP_Admission_Stage_Master TEASM on TEASM.I_Admission_Stage_ID = A.R_I_AdmStgTypeID            
   LEFT JOIN dbo.T_Enquiry_Education_CurrentStatus AS TEECS ON TEECS.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID                
   LEFT JOIN Enquiry_Source_Details as ESD on ESD.I_Info_Source_ID=A.I_Info_Source_ID and ESD.I_Enquiry_ID=A.I_Enquiry_Regn_ID and ESD.I_Status=1-- added by susmita :2023-Nov-23                
     LEFT JOIN T_Enquiry_Course as TEC on TEC.I_Enquiry_Regn_ID = @IEnquiryID              
     LEFT JOIN T_Course_Group_Class_Mapping AS TCGCM on TCGCM.I_Course_ID = TEC.I_Course_ID              
     Left Join T_Class as TC on TC.I_Class_ID = A.I_Class_ID              
                 
     WHERE   A.I_Centre_Id = ISNULL(@iCenterID, A.I_Centre_Id )       
  and A.R_I_School_Session_ID=@sessionID  
    --   AND A.I_Enquiry_Regn_ID=ISNULL(@IEnquiryID, A.I_Enquiry_Regn_ID)              
    --AND (@S_FatherName IS NULL OR A.S_Father_Name LIKE '%' + @S_FatherName + '%')             
    --AND (@S_MotherName IS NULL OR A.S_Mother_Name LIKE '%' + @S_MotherName + '%')             
    --AND (              
    -- CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) LIKE '%' + @S_Fullname + '%'             
    -- OR @S_Fullname IS NULL              
    -- )              
    -- AND S_Mobile_No=ISNULL(@sMobileNo, S_Mobile_No)                
     AND B_IsPreEnquiry = 1            
     AND I_ERP_Entry = 1  --for ERP Entry Records            
     AND (A.App_Payment_Status=0 OR A.App_Payment_Status IS NULL)            
     --AND A.R_I_AdmStgTypeID = ISNULL(@AdmissionStageID, A.R_I_AdmStgTypeID)          
   -- end          
          
          
   -- start          
  SELECT @FilteredRecords = COUNT(*)           
  FROM(          
   SELECT A.I_Enquiry_Regn_ID          
    FROM    dbo.T_Enquiry_Regn_Detail A                
    inner join T_ERP_Admission_Stage_Master TEASM on TEASM.I_Admission_Stage_ID = A.R_I_AdmStgTypeID            
    LEFT JOIN dbo.T_Enquiry_Education_CurrentStatus AS TEECS ON TEECS.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID                
    LEFT JOIN Enquiry_Source_Details as ESD on ESD.I_Info_Source_ID=A.I_Info_Source_ID and ESD.I_Enquiry_ID=A.I_Enquiry_Regn_ID and ESD.I_Status=1-- added by susmita :2023-Nov-23                
      LEFT JOIN T_Enquiry_Course as TEC on TEC.I_Enquiry_Regn_ID = @IEnquiryID              
      LEFT JOIN T_Course_Group_Class_Mapping AS TCGCM on TCGCM.I_Course_ID = TEC.I_Course_ID              
      Left Join T_Class as TC on TC.I_Class_ID = A.I_Class_ID              
                 
      WHERE   A.I_Centre_Id = ISNULL(@iCenterID, A.I_Centre_Id )    
   and A.R_I_School_Session_ID=@sessionID  
        AND A.I_Enquiry_Regn_ID=ISNULL(@IEnquiryID, A.I_Enquiry_Regn_ID)              
     AND (@S_FatherName IS NULL OR A.S_Father_Name LIKE '%' + @S_FatherName + '%')             
     AND (@S_MotherName IS NULL OR A.S_Mother_Name LIKE '%' + @S_MotherName + '%')             
     AND (              
      CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) LIKE '%' + @S_Fullname + '%'             
      OR @S_Fullname IS NULL              
      )              
      AND S_Mobile_No=ISNULL(@sMobileNo, S_Mobile_No)                
      AND B_IsPreEnquiry = 1            
      AND I_ERP_Entry = 1  --for ERP Entry Records            
      AND (A.App_Payment_Status=0 OR A.App_Payment_Status IS NULL)            
      AND A.R_I_AdmStgTypeID = ISNULL(@AdmissionStageID, A.R_I_AdmStgTypeID)            
      AND (          
     @Search IS NULL           
     OR A.S_Enquiry_No LIKE '%' + @Search + '%'           
     OR CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) LIKE '%' + @Search + '%'           
     OR A.S_Mobile_No LIKE '%' + @Search + '%'           
     OR TC.S_Class_Name LIKE '%' + @Search + '%'           
     OR TEASM.S_Admission_Current_Stage LIKE '%' + @Search + '%'           
     OR TEASM.S_Admission_Current_Stage_Desc LIKE '%' + @Search + '%'           
     OR TEASM.S_Admission_Next_Stage LIKE '%' + @Search + '%'           
     OR TEASM.S_Admission_Next_Stage_Desc LIKE '%' + @Search + '%'             
            
    )          
    --  order by A.I_Enquiry_Regn_ID           
    --  OFFSET @Offset ROWS          
    --FETCH NEXT @Limit ROWS ONLY          
  ) AS CountedRecords;          
           
          
          
 --end          
          
  -- Get the next followUp date from the followup table ---        
        
        
        
  BEGIN                
      SELECT              
   A.I_Enquiry_Regn_ID EnquiryRegnID,              
     A.S_Enquiry_No EnquiryNo,                
     A.I_Enquiry_Type_ID EnquiryTypeID,              
     --EnquiryDesc              
     A.Dt_Crtd_On LeadDate,              
     CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) FullName,              
     A.S_Mobile_No MobileNumber,              
     --CourseID to class              
     TEC.I_Course_ID CourseID,              
     A.I_Class_ID CourseAppliedForID,              
     TC.S_Class_Name CourseAppliedFor,            
     A.R_I_AdmStgTypeID AdmissionStage,              
    TEASM.S_Admission_Current_Stage AdmissionCurrentStage,            
    TEASM.S_Admission_Current_Stage_Desc AdmissionCurrentStageDesc,            
    TEASM.S_Admission_Next_Stage AdmissionNextStage,            
    TEASM.S_Admission_Next_Stage_Desc AdmissionNextStageDesc,                 
     A.App_Payment_Status ApplicationPayment,          
     --FollowUpStatus              
     --FollowUpRemark              
     A.I_Is_Active AS IsActive,              
    --A.S_First_Name ,                
    --A.S_Middle_Name ,                
    --A.S_Last_Name ,                
    --A.Dt_Birth_Date ,                
    --A.S_Age ,                
    A.S_Father_Name FatherName,                
    A.S_Mother_Name MotherName,          
 F.Dt_Next_Followup_Date as NextFollowUpDate,        
 ISNULL(F.S_FollowupStatus_Desc,'NA') FollowupStatusDesc,    
F.S_Followup_Status,    
 @TotalRecords AS TotalRecords,          
 @FilteredRecords AS FilteredRecords          
    --A.S_Curr_Address1 ,                
    --A.S_Curr_Address2 ,                
    --A.I_Curr_Country_ID ,                
  --A.I_Curr_State_ID ,                
    --A.I_Curr_City_ID ,                
    --A.S_Curr_Pincode ,                
    --A.S_Mobile_No ,                
                                  
    --A.I_Caste_ID ,                
    --A.S_Father_Name ,                
    --A.S_Mother_Name ,                
    --A.I_Info_Source_ID ,                
    --A.B_Has_Given_Exam ,                
    --A.I_Seat_Type_ID ,                
    --A.I_Enrolment_Type_ID ,                
    --A.S_Enrolment_No ,                
    --A.I_Rank_Obtained ,                
    --A.I_Sex_ID ,                
    --A.I_Native_Language_ID ,                
    --A.I_Nationality_ID ,                
    --A.I_Religion_ID ,                
    --A.I_Marital_Status_ID ,                
    --A.I_Blood_Group_ID ,                
    --A.I_Caste_ID ,                
    --A.S_Email_ID ,                
 --   A.S_Phone_No ,                
 --   A.S_Student_Photo ,                
 --   A.I_Father_Qualification_ID ,                
 --   A.I_Father_Occupation_ID ,                
 --   A.I_Father_Business_Type_ID ,                
 --   A.S_Father_Designation ,                
 --   A.S_Father_Office_Address ,                
 --   A.S_Father_Office_Phone ,                
 --   A.I_Father_Income_Group_ID ,                
 --   A.I_Mother_Qualification_ID ,                
 --   A.I_Mother_Occupation_ID ,                
 --   A.I_Mother_Business_Type_ID ,                
 --   A.S_Mother_Designation ,                
 --   A.S_Mother_Office_Address ,                
 --   A.S_Mother_Office_Phone ,                
 --   A.I_Mother_Income_Group_ID ,                
 --   A.S_Guardian_Name ,                
 --   A.S_Guardian_Relationship ,                
 --   A.S_Guardian_Address ,                
 --   A.S_Guardian_Phone_No ,                
 --   A.S_Guardian_Mobile_No ,                
 --   A.S_Curr_Address1 ,                
 --   A.S_Curr_Address2 ,                
 --   A.I_Curr_Country_ID ,                
 --   A.I_Curr_State_ID ,                
 --   A.I_Curr_City_ID ,                
 --A.S_Curr_Pincode ,                
 --   A.S_Perm_Address1 ,                
 --   A.S_Perm_Address2 ,                
 --   A.I_Perm_Country_ID ,                
 --   A.I_Perm_State_ID ,                
 --   A.I_Perm_City_ID ,                
 --   A.S_Perm_Area ,                
 --   A.S_Perm_Pincode ,             
 --   A.B_Has_Given_Exam ,                
 --   A.I_Attempts ,                
 --   A.S_Other_Institute ,                
 --   A.N_Duration,                
    --TEECS.I_Education_CurrentStatus_ID                
    -- ,ISNULL(ESD.S_Referer_Mobile_No,'') as S_Referer_Mobile_No                
    -- ,ISNULL(ESD.S_Referer_Name,'') as S_Referer_Name                
    FROM    dbo.T_Enquiry_Regn_Detail A                
 inner join T_ERP_Admission_Stage_Master TEASM on TEASM.I_Admission_Stage_ID = A.R_I_AdmStgTypeID            
    LEFT JOIN dbo.T_Enquiry_Education_CurrentStatus AS TEECS ON TEECS.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID                
    LEFT JOIN Enquiry_Source_Details as ESD on ESD.I_Info_Source_ID=A.I_Info_Source_ID and ESD.I_Enquiry_ID=A.I_Enquiry_Regn_ID and ESD.I_Status=1-- added by susmita :2023-Nov-23                
   LEFT JOIN T_Enquiry_Course as TEC on TEC.I_Enquiry_Regn_ID = @IEnquiryID              
   LEFT JOIN T_Course_Group_Class_Mapping AS TCGCM on TCGCM.I_Course_ID = TEC.I_Course_ID              
   Left Join T_Class as TC on TC.I_Class_ID = A.I_Class_ID        
   Left Join #TempTopFollowUpDate F ON F.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID        
       
                 
   WHERE   A.I_Centre_Id = ISNULL(@iCenterID, A.I_Centre_Id )    
   and A.R_I_School_Session_ID=@sessionID  
           AND A.I_Enquiry_Regn_ID=ISNULL(@IEnquiryID, A.I_Enquiry_Regn_ID)              
     AND (@S_FatherName IS NULL OR A.S_Father_Name LIKE '%' + @S_FatherName + '%')             
     AND (@S_MotherName IS NULL OR A.S_Mother_Name LIKE '%' + @S_MotherName + '%')             
     AND (              
      CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) LIKE '%' + @S_Fullname + '%'             
      OR @S_Fullname IS NULL              
   )              
   AND S_Mobile_No=ISNULL(@sMobileNo, S_Mobile_No)                
            AND B_IsPreEnquiry = 1     
   ------New CRM added    
   --and (F.FollowupType_ID=@FollowTypeID Or @FollowTypeID is null)    
   and (F.S_Followup_Status=@FollowupStatusID Or @FollowupStatusID is null)    
   and (convert(Date,F.Dt_Next_Followup_Date)>=Convert(date,GETDATE())    
 and (convert(Date,F.Dt_Next_Followup_Date)<@Nextdt)    
 OR @Nextdt is null)    
 -------------CRM END    
   AND I_ERP_Entry = 1  --for ERP Entry Records            
   AND (A.App_Payment_Status=0 OR A.App_Payment_Status IS NULL)            
   AND A.R_I_AdmStgTypeID = ISNULL(@AdmissionStageID, A.R_I_AdmStgTypeID)            
   AND (          
  @Search IS NULL           
  OR A.S_Enquiry_No LIKE '%' + @Search + '%'           
  OR CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) LIKE '%' + @Search + '%'           
  OR A.S_Mobile_No LIKE '%' + @Search + '%'           
  OR TC.S_Class_Name LIKE '%' + @Search + '%'           
  OR TEASM.S_Admission_Current_Stage LIKE '%' + @Search + '%'           
  OR TEASM.S_Admission_Current_Stage_Desc LIKE '%' + @Search + '%'           
  OR TEASM.S_Admission_Next_Stage LIKE '%' + @Search + '%'           
  OR TEASM.S_Admission_Next_Stage_Desc LIKE '%' + @Search + '%'             
            
 )          
          
 order by           
 (           
  case when (@SortCol = 0 and @SortDir = 'asc') then A.I_Enquiry_Regn_ID end          
 )asc,          
 (          
  case when (@SortCol = 0 and @SortDir = 'desc') then A.I_Enquiry_Regn_ID end          
 ) desc,          
 (          
  case when (@SortCol = 1 and @SortDir = 'asc') then A.Dt_Crtd_On end           
 ) asc,          
 (          
  case when (@SortCol = 1 and @SortDir = 'desc') then A.Dt_Crtd_On end          
 ) desc,          
 (          
  case when (@SortCol = 2 and @SortDir = 'asc') then CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) end          
 )asc,          
 (          
  case when (@SortCol = 2 and @SortDir = 'desc') then CONCAT(COALESCE(A.S_First_Name+' ', ''), COALESCE(A.S_Middle_Name+' ', ''), COALESCE(A.S_Last_Name, '')) end          
 ) desc,          
 (          
 case when (@SortCol = 3 and @SortDir = 'asc') then A.S_Mobile_No end          
 ) asc,          
 (          
  case when (@SortCol = 3 and @SortDir = 'desc') then A.S_Mobile_No end          
 ) desc,          
 (          
  case when (@SortCol = 4 and @SortDir = 'asc') then TC.S_Class_Name end          
 ) asc,          
 (          
  case when (@SortCol = 4 and @SortDir = 'desc') then TC.S_Class_Name end           
 ) desc,          
 (          
  case when (@SortCol = 5 and @SortDir = 'asc') then TEASM.S_Admission_Current_Stage end          
 ) asc,          
 (          
  case when (@SortCol = 5 and @SortDir = 'desc') then TEASM.S_Admission_Current_Stage end          
 ) desc,          
 (          
  case when (@SortCol = 6 and @SortDir = 'asc') then TEASM.S_Admission_Next_Stage end          
 ) asc,          
 (          
  case when (@SortCol = 6 and @SortDir = 'desc') then TEASM.S_Admission_Next_Stage end          
 ) desc,          
 (          
  case when (@SortCol = 7 and @SortDir = 'asc') then F.Dt_Next_Followup_Date end           
 ) asc,          
 (          
  case when (@SortCol = 7 and @SortDir = 'desc') then F.Dt_Next_Followup_Date end          
 ) desc,          
 (          
  case when (@SortCol = 8 and @SortDir = 'asc') then A.I_Is_Active end           
 ) asc,          
 (          
  case when (@SortCol = 8 and @SortDir = 'desc') then A.I_Is_Active end          
 ) desc           
          
  -- order by A.I_Enquiry_Regn_ID           
   OFFSET @Offset ROWS          
   FETCH NEXT @Limit ROWS ONLY;          
            
     --AND ISNULL(A.S_First_Name, '') + ' ' + ISNULL(A.S_Middle_Name, '') + ' ' + ISNULL(A.S_Last_Name, '') LIKE '%' + @S_Fullname + '%'              
     --AND (ISNULL(A.S_Father_Name, '') LIKE '%' + @S_GuardianName + '%' OR ISNULL(A.S_Mother_Name, '') LIKE '%' + @S_GuardianName + '%')              
                                    
                    --AND I_Enquiry_Status_Code IS NULL                
                    --AND ( I_PreEnquiryFor IS NULL                
                    --      OR I_PreEnquiryFor NOT IN ( 2, 3 )                
                    --    )              
                   
                      
                
   select  @iEnquiryID=A.I_Enquiry_Regn_ID from dbo.T_Enquiry_Regn_Detail A where                 
                      A.I_Centre_Id = @iCenterID                
                    AND I_Enquiry_Regn_ID LIKE ISNULL(@IEnquiryID, I_Enquiry_Regn_ID)                
                    AND S_Mobile_No LIKE ISNULL(@sMobileNo, S_Mobile_No)                
                    AND B_IsPreEnquiry = 1                
                    AND I_Enquiry_Status_Code IS NULL    
     and R_I_School_Session_ID=@sessionID  
                    --AND ( I_PreEnquiryFor IS NULL                
                    --      OR I_PreEnquiryFor NOT IN ( 2, 3 )                
                    --    )                 
  end                     
                          
-- Table[1] Enquiry Course Details            
        
        
-- This result set is not required in this current store procedure        
    --    SELECT  DISTINCT                
    --            A.I_Course_ID ,                
    --            C.S_Course_Name ,                
    --            C.I_CourseFamily_ID ,                
    --            TCFM.S_CourseFamily_Name ,                
    --            A.I_Enquiry_Regn_ID,                
    --COALESCE(c.I_Language_ID,0) as I_Language_ID,--samim                
    --COALESCE(c.I_Language_Name,'') as I_Language_Name--samim                
    --    FROM    dbo.T_Enquiry_Course A ,                
    --            dbo.T_Enquiry_Regn_Detail B WITH ( NOLOCK ) ,                
    --            dbo.T_Course_Master C ,                
    --            dbo.T_CourseFamily_Master AS TCFM                
    --    WHERE   A.I_Course_ID = C.I_Course_ID                
    --            AND A.I_Enquiry_Regn_ID = @iEnquiryID--@sEnquiryNo                
    --            AND C.I_CourseFamily_ID = TCFM.I_CourseFamily_ID               
    --AND B_IsPreEnquiry = 1         
         
        
        
                --AND I_Enquiry_Status_Code IS NULL                
                    --AND ( I_PreEnquiryFor IS NULL                
                    --      OR I_PreEnquiryFor NOT IN ( 2, 3 )                
                    --    )        AND I_ERP_Entry = 1               
                            
--Table[2] Enquiry Qualification Details          
        
-- This result set is not required in this current store procedure        
  --      SELECT  TEQD.I_Enquiry_Regn_ID ,                
  --              TEQD.S_Name_Of_Exam ,                
  --              TEQD.S_University_Name ,                
  --              TEQD.S_Year_From ,                
  --              TEQD.S_Year_To ,                
  --TEQD.S_Subject_Name ,                
  --              TEQD.N_Marks_Obtained ,                
  --              TEQD.N_Percentage ,                
  --              TEQD.S_Division ,                
  --              TEQD.S_Institution                
  --      FROM    dbo.T_Enquiry_Qualification_Details AS TEQD                
  --      WHERE   I_Enquiry_Regn_ID = @iEnquiryID--@sEnquiryNo                
  --              AND TEQD.I_Status = 1         
            
        
        
        
---- Table[3] Enquiry Course Details                 
--        SELECT  TEECS.I_Enquiry_Regn_ID ,                
--                TEECS.I_Education_CurrentStatus_ID                
--        FROM    dbo.T_Enquiry_Education_CurrentStatus AS TEECS                
--        WHERE   TEECS.I_Enquiry_Regn_ID = @sEnquiryNo                
                
        
  -- DROP the temporary table        
    DROP table #TempTopFollowUpDate                                         
    end 