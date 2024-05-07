﻿CREATE PROCEDURE [dbo].[uspGetStudentInformationDetails] -- [dbo].[uspGetStudentInformationDetails] null,null,2,14               
    (
      -- Add the parameters for the stored procedure here                  
      @iEnquiryRegnID INT = NULL ,
      @sEmailId VARCHAR(200) = NULL ,
      @iApplicationId INT = NULL ,
      @sStudentCode VARCHAR(100) = NULL          
    )
AS 
    BEGIN            
        
        DECLARE @iStudentDetailId INT       
        DECLARE @iEnquiryId INT               
        DECLARE @iCenterId INT        
 -- SET NOCOUNT ON added to prevent extra result sets from                  
 -- interfering with SELECT statements.                  
        SET NOCOUNT ON           
             
        
        SELECT  @iStudentDetailId = I_Student_Detail_ID
        FROM    dbo.T_Student_Detail AS tsd
        WHERE   tsd.S_Student_ID = @sStudentCode        
         
        IF @iApplicationId = 1 
            BEGIN        
                SELECT  A.I_Enquiry_Regn_ID ,
                        A.S_First_Name ,
                        A.S_Middle_Name ,
                        A.S_Last_Name ,
                        A.I_Centre_Id ,
                        A.Dt_Crtd_On ,
                        A.I_Enquiry_Status_Code ,
                        A.S_Title ,
                        A.Dt_Birth_Date ,
                        A.S_Age ,
                        A.C_Skip_Test ,
                        A.S_Email_ID ,
                        A.S_Phone_No ,
                        A.S_Mobile_No ,
                        A.I_Qualification_Name_ID ,
                        A.I_Occupation_ID ,
                        A.I_Stream_ID ,
                        A.I_Pref_Career_ID ,
                        A.S_Guardian_Name ,
                        A.I_Guardian_Occupation_ID ,
                        A.S_Guardian_Email_ID ,
                        A.S_Guardian_Phone_No ,
                        A.S_Guardian_Mobile_No ,
                        A.I_Income_Group_ID ,
                        A.S_Curr_Address1 ,
                        A.S_Curr_Address2 ,
                        A.I_Curr_Country_ID ,
                        A.I_Curr_State_ID ,
                        A.I_Curr_City_ID ,
                        A.S_Curr_Area ,
                        A.S_Curr_Pincode ,
                        A.S_Perm_Address1 ,
                        A.S_Perm_Address2 ,
                        A.I_Perm_Country_ID ,
                        A.I_Perm_State_ID ,
                        A.I_Perm_City_ID ,
                        A.S_Perm_Area ,
                        A.S_Perm_Pincode ,
                        A.S_Enquiry_No ,
                        A.I_Enquiry_Type_ID ,
                        A.S_Is_Corporate ,
                        A.I_Info_Source_ID ,
                        A.S_Enquiry_Desc ,
                        A.S_Crtd_By ,
                        A.Dt_Crtd_On ,
                        A.I_Corporate_ID
                FROM    dbo.T_Enquiry_Regn_Detail A WITH ( NOLOCK )
                WHERE   A.I_Enquiry_Regn_ID = ISNULL(@iEnquiryRegnID,
                                                     A.I_Enquiry_Regn_ID)
                        AND A.S_Email_ID = ISNULL(@sEmailId, A.S_Email_ID)
                ORDER BY A.I_Enquiry_Regn_ID            
                
            
                 
	  -- Table[1] Enquiry Course Details              
                SELECT  DISTINCT
                        A.I_Course_ID ,
                        C.S_Course_Name ,
                        C.I_CourseFamily_ID ,
                        TCFM.S_CourseFamily_Name ,
                        A.I_Enquiry_Regn_ID
                FROM    dbo.T_Enquiry_Course A ,
                        dbo.T_Enquiry_Regn_Detail B WITH ( NOLOCK ) ,
                        dbo.T_Course_Master C ,
                        dbo.T_CourseFamily_Master AS TCFM
                WHERE   A.I_Course_ID = C.I_Course_ID
                        AND A.I_Enquiry_Regn_ID = @iEnquiryRegnID
                        AND C.I_CourseFamily_ID = TCFM.I_CourseFamily_ID            
            END        
        ELSE 
            BEGIN    
            
                SELECT  @iEnquiryId = I_Enquiry_Regn_ID
                FROM    dbo.T_Student_Detail AS tsd
                WHERE   tsd.I_Student_Detail_ID = @iStudentDetailId       
            
                SELECT  TSD.*
                FROM    dbo.T_Student_Detail TSD WITH ( NOLOCK )
                WHERE   TSD.I_Student_Detail_ID = @iStudentDetailId --AND TSD.I_Status<>0            
               
            --Table[1] Enquiry Details            
               
                SELECT  ERD.*
                FROM    dbo.T_Enquiry_Regn_Detail ERD WITH ( NOLOCK ) ,
                        dbo.T_Student_Detail TSD WITH ( NOLOCK )
                WHERE   ERD.I_Enquiry_Regn_ID = TSD.I_Enquiry_Regn_ID
                        AND ERD.I_Enquiry_Regn_ID = @iEnquiryId             
               
        --Table[2] Center Details            
               
                SET @iCenterId = ( SELECT   SCD.I_Centre_Id
                                   FROM     dbo.T_Student_Center_Detail SCD
                                   WHERE    SCD.I_Student_Detail_ID = @iStudentDetailId
                                            AND GETDATE() >= ISNULL(GETDATE(),
                                                              SCD.Dt_Valid_From)
                                            AND GETDATE() <= ISNULL(GETDATE(),
                                                              SCD.Dt_Valid_To)
                                            AND SCD.I_Status <> 0
                                 )            
	               
                SELECT  TCM.I_Centre_ID ,
                        TCM.S_Center_Code ,
                        TCM.S_Center_Name ,
                        TBM.S_Brand_Name
                FROM    dbo.T_Centre_Master TCM
                        INNER JOIN dbo.T_Brand_Center_Details TBCD ON TBCD.I_Centre_Id = TCM.I_Centre_Id
                        INNER JOIN dbo.T_Brand_Master TBM ON TBM.I_Brand_ID = TBCD.I_Brand_ID
                WHERE   TCM.I_Centre_ID = @iCenterId
                        AND TCM.I_Status <> 0            
                 
        --Table[3] StudentCourse Details            
               
                IF EXISTS ( SELECT  'True'
                            FROM    dbo.T_Course_Master CM ,
                                    dbo.T_CourseFamily_Master CFM ,
                                    dbo.T_Course_Delivery_Map TCDM ,
                                    ( SELECT    I_Course_ID ,
                                                Dt_Course_Start_Date ,
                                                Dt_Course_Actual_End_Date ,
                                                Dt_Course_Expected_End_Date ,
                                                I_Is_Completed ,
                                                I_Course_Center_Delivery_ID
                                      FROM      dbo.T_Student_Course_Detail
                                      WHERE     I_Student_Detail_ID = @iStudentDetailId
                                                AND             
			 --I_Status<>0 AND              
                                                GETDATE() >= ISNULL(GETDATE(),
                                                              Dt_Valid_From)
                                                AND GETDATE() <= ISNULL(GETDATE(),
                                                              Dt_Valid_To)
                                    ) TSCD ,
                                    dbo.T_Course_Center_Delivery_FeePlan TCCDF
                            WHERE   TSCD.I_Course_ID = CM.I_Course_ID
                                    AND CFM.I_CourseFamily_ID = CM.I_CourseFamily_ID
                                    AND TSCD.I_Course_Center_Delivery_ID = TCCDF.I_Course_Center_Delivery_ID
                                    AND TCDM.I_Course_ID = CM.I_Course_ID
                                    AND TCDM.I_Course_Delivery_ID = TCCDF.I_Course_Delivery_ID --AND TCDM.I_Status <> 0 AND TCCDF.I_Status <> 0            
			 --AND GETDATE() >= ISNULL(GETDATE(),TCCDF.Dt_Valid_From)AND GETDATE() <= ISNULL(GETDATE(),TCCDF.Dt_Valid_To)            
		  ) 
                    BEGIN     
                        SELECT DISTINCT
                                CM.I_Course_ID ,
                                CM.S_Course_Code ,
                                CM.S_Course_Name ,
                                CM.S_Course_Desc ,
                                CM.C_IsCareerCourse ,
                                ISNULL([CM].[I_Min_Week_For_Placement], 0) AS [I_Min_Week_For_Placement] ,
                                ISNULL([CM].[I_Max_Week_For_Placement], 1000) AS [I_Max_Week_For_Placement] ,
                                CFM.S_CourseFamily_Name ,
                                CFM.I_CourseFamily_ID ,
                                TSCD.Dt_Course_Start_Date ,
                                TSCD.Dt_Course_Actual_End_Date ,
                                TSCD.Dt_Course_Expected_End_Date ,
                                TSCD.I_Is_Completed ,
                                TSCD.I_Batch_ID ,
                                TCCDF.I_Course_Fee_Plan_ID ,
                                TCDM.N_Course_Duration ,
                                ( SELECT    COUNT(B.I_Session_ID)
                                  FROM      dbo.T_Session_Module_Map A
                                            INNER JOIN dbo.T_Session_Master B ON A.I_Session_ID = B.I_Session_ID
                                            INNER JOIN dbo.T_Module_Term_Map C ON A.I_Module_ID = C.I_Module_ID
                                            INNER JOIN dbo.T_Term_Course_Map D ON C.I_Term_ID = D.I_Term_ID
                                                              AND D.I_Course_ID = CM.I_Course_ID
                                                              AND GETDATE() >= ISNULL(A.Dt_Valid_From,
                                                              GETDATE())
                                                              AND GETDATE() <= ISNULL(A.Dt_Valid_To,
                                                              GETDATE())
                                                              AND A.I_Status <> 0
                                                              AND B.I_Status <> 0
                                                              AND C.I_Status <> 0
                                                              AND D.I_Status <> 0
                                ) AS I_No_Of_Session ,
                                ( SELECT    COUNT(*)
                                  FROM      dbo.T_Student_Attendance_Details TSAD
                                  WHERE     TSAD.I_Student_Detail_ID = @iStudentDetailId
                                            AND TSAD.I_Course_ID = CM.I_Course_ID
                                            AND I_Has_Attended = 1
                                ) AS Session_Attended ,
                                CFM.I_IsMTech,
                                ( SELECT    DATEDIFF(dd,
                                                     ( SELECT MIN(Dt_Attendance_Date)
                                                       FROM   dbo.T_Student_Attendance_Details TSAD
                                                       WHERE  TSAD.I_Student_Detail_ID = @iStudentDetailId
                                                              AND TSAD.I_Course_ID = CM.I_Course_ID
                                                              AND I_Has_Attended = 1
                                                     ),
                                                     ( SELECT MAX(Dt_Attendance_Date)
                                                       FROM   dbo.T_Student_Attendance_Details TSAD
                                                       WHERE  TSAD.I_Student_Detail_ID = @iStudentDetailId
                                                              AND TSAD.I_Course_ID = CM.I_Course_ID
                                                              AND I_Has_Attended = 1
                                                     ))
                                ) AS Duration_Completed
                        FROM    dbo.T_Course_Master CM ,
                                dbo.T_CourseFamily_Master CFM ,
                                dbo.T_Course_Delivery_Map TCDM ,
                                ( SELECT    I_Course_ID ,
                                            Dt_Course_Start_Date ,
                                            Dt_Course_Actual_End_Date ,
                                            Dt_Course_Expected_End_Date ,
                                            I_Is_Completed ,
                                            I_Course_Center_Delivery_ID ,
                                            I_Batch_ID
                                  FROM      dbo.T_Student_Course_Detail
                                  WHERE     I_Student_Detail_ID = @iStudentDetailId
                                            AND             
				 --I_Status<>0 AND              
                                            GETDATE() >= ISNULL(GETDATE(),
                                                              Dt_Valid_From)
                                            AND GETDATE() <= ISNULL(GETDATE(),
                                                              Dt_Valid_To)
                                ) TSCD ,
                                dbo.T_Course_Center_Delivery_FeePlan TCCDF
                        WHERE   TSCD.I_Course_ID = CM.I_Course_ID
                                AND CFM.I_CourseFamily_ID = CM.I_CourseFamily_ID
                                AND TSCD.I_Course_Center_Delivery_ID = TCCDF.I_Course_Center_Delivery_ID
                                AND TCDM.I_Course_ID = CM.I_Course_ID
                                AND TCDM.I_Course_Delivery_ID = TCCDF.I_Course_Delivery_ID 
                    END          
                ELSE 
                    BEGIN          
		          
                        SELECT DISTINCT
                                CM.I_Course_ID ,
                                CM.S_Course_Code ,
                                CM.S_Course_Name ,
                                CM.S_Course_Desc ,
                                CM.C_IsCareerCourse ,
                                ISNULL([CM].[I_Min_Week_For_Placement], 0) AS [I_Min_Week_For_Placement] ,
                                ISNULL([CM].[I_Max_Week_For_Placement], 1000) AS [I_Max_Week_For_Placement] ,
                                CFM.S_CourseFamily_Name ,
                                CFM.I_CourseFamily_ID ,
                                TSCD.Dt_Course_Start_Date ,
                                TSCD.Dt_Course_Actual_End_Date ,
                                TSCD.Dt_Course_Expected_End_Date ,
                                TSCD.I_Is_Completed ,
                                TSCD.I_Batch_ID ,
                                TCCDF.I_Course_Fee_Plan_ID ,
                                TCDM.N_Course_Duration ,
                                ( SELECT    COUNT(B.I_Session_ID)
                                  FROM      dbo.T_Session_Module_Map A
                                            INNER JOIN dbo.T_Session_Master B ON A.I_Session_ID = B.I_Session_ID
                                            INNER JOIN dbo.T_Module_Term_Map C ON A.I_Module_ID = C.I_Module_ID
                                            INNER JOIN dbo.T_Term_Course_Map D ON C.I_Term_ID = D.I_Term_ID
                                                              AND D.I_Course_ID = CM.I_Course_ID
                                                              AND GETDATE() >= ISNULL(A.Dt_Valid_From,
                                                              GETDATE())
                                                              AND GETDATE() <= ISNULL(A.Dt_Valid_To,
                                                              GETDATE())
                                                              AND A.I_Status <> 0
                                                              AND B.I_Status <> 0
                                                              AND C.I_Status <> 0
                                                              AND D.I_Status <> 0
                                ) AS I_No_Of_Session ,
                                ( SELECT    COUNT(*)
                                  FROM      dbo.T_Student_Attendance_Details TSAD
                                  WHERE     TSAD.I_Student_Detail_ID = @iStudentDetailId
                                            AND TSAD.I_Course_ID = CM.I_Course_ID
                                            AND I_Has_Attended = 1
                                ) AS Session_Attended ,
                                 CFM.I_IsMTech,
                                ( SELECT    DATEDIFF(dd,
                                                     ( SELECT MIN(Dt_Attendance_Date)
                                                       FROM   dbo.T_Student_Attendance_Details TSAD
                                                       WHERE  TSAD.I_Student_Detail_ID = @iStudentDetailId
                                                              AND TSAD.I_Course_ID = CM.I_Course_ID
                                                              AND I_Has_Attended = 1
                                                     ),
                                                     ( SELECT MAX(Dt_Attendance_Date)
                                                       FROM   dbo.T_Student_Attendance_Details TSAD
                                                       WHERE  TSAD.I_Student_Detail_ID = @iStudentDetailId
                                                              AND TSAD.I_Course_ID = CM.I_Course_ID
                                                              AND I_Has_Attended = 1
                                                     ))
                                ) AS Duration_Completed
                        FROM    dbo.T_Course_Master CM ,
                                dbo.T_CourseFamily_Master CFM ,
                                dbo.T_Course_Delivery_Map TCDM ,
                                ( SELECT    I_Course_ID ,
                                            Dt_Course_Start_Date ,
                                            I_Batch_ID ,
                                            Dt_Course_Actual_End_Date ,
                                            Dt_Course_Expected_End_Date ,
                                            I_Is_Completed ,
                                            I_Course_Center_Delivery_ID
                                  FROM      dbo.T_Student_Course_Detail
                                  WHERE     I_Student_Detail_ID = @iStudentDetailId
                                            AND             
				 --I_Status<>0 AND              
                                            GETDATE() >= ISNULL(GETDATE(),
                                                              Dt_Valid_From)
                                            AND GETDATE() <= ISNULL(GETDATE(),
                                                              Dt_Valid_To)
                                ) TSCD ,
                                dbo.T_Course_Center_Delivery_FeePlan TCCDF
                        WHERE   TSCD.I_Course_ID = CM.I_Course_ID
                                AND CFM.I_CourseFamily_ID = CM.I_CourseFamily_ID
                                AND TSCD.I_Course_Center_Delivery_ID = TCCDF.I_Course_Center_Delivery_ID
                                AND TCDM.I_Course_ID = CM.I_Course_ID             
				 --AND TCDM.I_Course_Delivery_ID = TCCDF.I_Course_Delivery_ID            
                    END          
                  
            END        
    END 