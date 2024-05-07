﻿
CREATE PROCEDURE [dbo].[uspGetStudentDetails] -- [dbo].[uspGetStudentDetails] NULL,'12-0087'                   
    (
      -- Add the parameters for the stored procedure here                        
      @iStudentDetailId INT ,
      @sStudentNo VARCHAR(500) = NULL ,
      @iCenterId INT = NULL                        

    )
AS 
    BEGIN                        

                         

                         

        DECLARE --@iCenterId INT ,                
            @iEnquiryRegnId INT                        

  --@iStudentDetailId int                        

                         

        IF ( @iStudentDetailId IS NULL ) 
            SELECT  @iStudentDetailId = I_Student_Detail_ID
            FROM    dbo.T_Student_Detail TSD WITH ( NOLOCK )
                    INNER JOIN dbo.T_Enquiry_Regn_Detail AS TERD ON TSD.I_Enquiry_Regn_ID = TERD.I_Enquiry_Regn_ID
            WHERE   S_Student_ID = @sStudentNo --AND I_Status<>0         
                    AND I_Centre_Id = ISNULL(@iCenterId, I_Centre_Id)                  

                        

                          

   --Table[0] Student Details                        

                           

        SELECT  TSD.I_Student_Detail_ID ,
                TSD.I_Enquiry_Regn_ID ,
                TSD.S_Student_ID ,
                TSD.S_Title ,
                TSD.S_First_Name ,
                TSD.S_Middle_Name ,
                TSD.S_Last_Name ,
                TSD.S_Guardian_Name ,
                TSD.I_Guardian_Occupation_ID ,
                TSD.S_Guardian_Email_ID ,
                TSD.S_Guardian_Phone_No ,
                TSD.S_Guardian_Mobile_No ,
                TSD.I_Income_Group_ID ,
                TSD.Dt_Birth_Date ,
                TSD.S_Age ,
                TSD.S_Email_ID ,
                TSD.S_Phone_No ,
                TSD.S_Mobile_No ,
                TSD.C_Skip_Test ,
                TSD.I_Occupation_ID ,
                TSD.I_Pref_Career_ID ,
                TSD.I_Qualification_Name_ID ,
                TSD.I_Stream_ID ,
                TSD.S_Curr_Address1 ,
                TSD.S_Curr_Address2 ,
                TSD.I_Curr_Country_ID ,
                TSD.I_Curr_State_ID ,
                TSD.I_Curr_City_ID ,
                TSD.S_Curr_Area ,
                TSD.S_Curr_Pincode ,
                TSD.S_Perm_Address1 ,
                TSD.S_Perm_Address2 ,
                TSD.I_Perm_Country_ID ,
                TSD.I_Perm_State_ID ,
                TSD.I_Perm_City_ID ,
                TSD.S_Perm_Area ,
                TSD.S_Perm_Pincode ,
                TSD.I_Residence_Area_ID ,
                TSD.I_Status ,
                TSD.S_Crtd_By ,
                TSD.S_Upd_By ,
                TSD.Dt_Crtd_On ,
                TSD.Dt_Upd_On ,
                TSD.S_Conduct_Code ,
                TSD.S_Is_Corporate ,
                TSD.I_Corporate_ID ,
                TSD.I_RollNo ,
                TSD.I_Marital_Status_ID ,
                TSD.I_Transport_ID ,
                tsd.I_Route_ID ,
                TSD.I_room_ID ,
                TSD.I_RollNo ,
                TSD.I_House_ID,
				ISNULL(TSD.B_HasTakenLoan,0) as B_HasTakenLoan,
				ISNULL(TSD.I_DiscountType_ID,1) as I_DiscountType_ID
        FROM    dbo.T_Student_Detail TSD WITH ( NOLOCK )
        WHERE   TSD.I_Student_Detail_ID = @iStudentDetailId --AND TSD.I_Status<>0                        

                           

   --SET @iStudentDetailId=(SELECT I_Student_Detail_ID FROM dbo.T_Student_Detail  WHERE I_Student_ID=@iStudentID AND I_Status<>0)                        

                           

        SET @iEnquiryRegnId = ( SELECT  TSD.I_Enquiry_Regn_ID
                                FROM    dbo.T_Student_Detail TSD WITH ( NOLOCK )
                                WHERE   TSD.I_Student_Detail_ID = @iStudentDetailId
                              ) -- AND TSD.I_Status<>0)                        

                           

   --Table[1] Enquiry Details                

              

        SELECT  ERD.I_Enquiry_Regn_ID ,
                ERD.I_Centre_Id ,
                ERD.I_Occupation_ID ,
                ERD.I_Pref_Career_ID ,
                ERD.I_Enquiry_Status_Code ,
                ERD.I_Info_Source_ID ,
                ERD.I_Enquiry_Type_ID ,
                ERD.S_Enquiry_No ,
                ERD.S_Is_Corporate ,
                ERD.S_Enquiry_Desc ,
                ERD.S_Title ,
                ERD.S_First_Name ,
                ERD.S_Middle_Name ,
                ERD.S_Last_Name ,
                ERD.Dt_Birth_Date ,
                ERD.S_Age ,
                ERD.S_Student_Photo ,
                ERD.I_Qualification_Name_ID ,
                ERD.C_Skip_Test ,
                ERD.I_Stream_ID ,
                ERD.I_Aptitude_Marks ,
                ERD.S_Email_ID ,
                ERD.S_Phone_No ,
                ERD.S_Mobile_No ,
                ERD.I_Curr_City_ID ,
                ERD.I_Curr_State_ID ,
                ERD.I_Curr_Country_ID ,
                ERD.S_Guardian_Name ,
                ERD.I_Guardian_Occupation_ID ,
                ERD.S_Guardian_Email_ID ,
                ERD.S_Guardian_Phone_No ,
                ERD.S_Guardian_Mobile_No ,
                ERD.I_Income_Group_ID ,
                ERD.S_Curr_Address1 ,
                ERD.S_Curr_Address2 ,
                ERD.S_Curr_Pincode ,
                ERD.S_Curr_Area ,
                ERD.S_Perm_Address1 ,
                ERD.S_Perm_Address2 ,
                ERD.S_Perm_Pincode ,
                ERD.I_Perm_City_ID ,
                ERD.I_Perm_State_ID ,
                ERD.I_Perm_Country_ID ,
                ERD.S_Perm_Area ,
                ERD.I_Residence_Area_ID ,
                ERD.S_Crtd_By ,
                ERD.S_Upd_By ,
                ERD.Dt_Crtd_On ,
                ERD.Dt_Upd_On ,
                ERD.I_Corporate_ID ,
                ERD.I_Corporate_Plan_ID ,
                ERD.I_Caste_ID ,
                ERD.S_Father_Name ,
                ERD.S_Mother_Name ,
                ERD.B_IsPreEnquiry ,
                ERD.I_Sex_ID ,
                ERD.I_Native_Language_ID ,
                ERD.I_Nationality_ID ,
                ERD.I_Religion_ID ,
                ERD.I_Marital_Status_ID ,
                ERD.I_Blood_Group_ID ,
                ERD.I_Father_Qualification_ID ,
                ERD.I_Father_Occupation_ID ,
                ERD.I_Father_Business_Type_ID ,
                ERD.S_Father_Company_Name ,
                ERD.S_Father_Designation ,
                ERD.S_Father_Office_Phone ,
                ERD.I_Father_Income_Group_ID ,
                ERD.S_Father_Photo ,
                ERD.S_Father_Office_Address ,
                ERD.I_Mother_Qualification_ID ,
                ERD.I_Mother_Occupation_ID ,
                ERD.I_Mother_Business_Type_ID ,
                ERD.S_Mother_Designation ,
                ERD.S_Mother_Company_Name ,
                ERD.S_Mother_Office_Address ,
                ERD.S_Mother_Office_Phone ,
                ERD.I_Mother_Income_Group_ID ,
                ERD.S_Mother_Photo ,
                ERD.S_Guardian_Relationship ,
                ERD.S_Guardian_Address ,
                ERD.I_Monthly_Family_Income_ID ,
                ERD.B_Can_Sponsor_Education ,
                ERD.S_Sibling_ID ,
                ERD.B_Has_Given_Exam ,
                ERD.I_Attempts ,
                ERD.S_Other_Institute ,
                ERD.N_Duration ,
                ERD.I_Seat_Type_ID ,
                ERD.I_Enrolment_Type_ID ,
                ERD.S_Enrolment_No ,
                ERD.I_Rank_Obtained ,
                ERD.S_Univ_Registration_No ,
                ERD.S_Univ_Roll_No ,
                ERD.I_Scholar_Type_ID ,
                ERD.S_Second_Language_Opted ,
                ERD.S_Physical_Ailment ,
                erd.B_IsLateral
        FROM    dbo.T_Enquiry_Regn_Detail ERD WITH ( NOLOCK ) ,
                dbo.T_Student_Detail TSD WITH ( NOLOCK )
        WHERE   ERD.I_Enquiry_Regn_ID = TSD.I_Enquiry_Regn_ID
                AND ERD.I_Enquiry_Regn_ID = @iEnquiryRegnId                         

                           

   --Table[2] Center Details                        

        IF @iCenterId IS NULL 
            BEGIN                   

                SET @iCenterId = ( SELECT   SCD.I_Centre_Id
                                   FROM     dbo.T_Student_Center_Detail SCD
                                   WHERE    SCD.I_Student_Detail_ID = @iStudentDetailId
                                            AND GETDATE() >= ISNULL(GETDATE(),
                                                              SCD.Dt_Valid_From)
                                            AND GETDATE() <= ISNULL(GETDATE(),
                                                              SCD.Dt_Valid_To)
                                            AND SCD.I_Status <> 0
                                 )                        

            END      

                           
		--CHANGE ADDED FOR GST IMPLEMENTATION
  --      SELECT  TCM.I_Centre_ID ,
  --              TCM.S_Center_Code ,
  --              TCM.S_Center_Name ,
  --              TBM.S_Brand_Name
  --      FROM    dbo.T_Centre_Master TCM
  --              INNER JOIN dbo.T_Brand_Center_Details TBCD ON TBCD.I_Centre_Id = TCM.I_Centre_Id
  --              INNER JOIN dbo.T_Brand_Master TBM ON TBM.I_Brand_ID = TBCD.I_Brand_ID
  --      WHERE   TCM.I_Centre_ID = @iCenterId
  --              AND TCM.I_Status <> 0                    
		
		--SELECT @iCenterId
		
		SELECT  TCM.I_Centre_ID ,
                TCM.S_Center_Code ,
                TCM.S_Center_Name ,
                TBM.S_Brand_Name,
				GCM.S_State_Code,
				SM.S_State_Name
        FROM    dbo.T_Centre_Master TCM
                INNER JOIN dbo.T_Brand_Center_Details TBCD ON TBCD.I_Centre_Id = TCM.I_Centre_Id
                INNER JOIN dbo.T_Brand_Master TBM ON TBM.I_Brand_ID = TBCD.I_Brand_ID
				INNER JOIN NETWORK.T_Center_Address AS CA ON TBCD.I_Centre_Id = CA.I_Centre_Id
				INNER JOIN dbo.T_State_Master AS SM ON CA.I_State_ID = SM.I_State_ID
				LEFT JOIN dbo.T_GST_Code_Master AS GCM ON GCM.I_State_ID = SM.I_State_ID AND GCM.I_Brand_ID = TBM.I_Brand_ID
        WHERE   TCM.I_Centre_ID = @iCenterId
                AND TCM.I_Status <> 0                          
		--CHANGE END FOR GST IMPLEMENTATION
                           

   --Table[3] StudentCourse Details                        

        SELECT DISTINCT
                CM.I_Course_ID ,
                CM.S_Course_Code ,
                CM.S_Course_Name ,
                CM.S_Course_Desc ,
                ISNULL(CM.C_IsCareerCourse, 'N') AS C_IsCareerCourse ,
                ISNULL([CM].[I_Min_Week_For_Placement], 0) AS [I_Min_Week_For_Placement] ,
                ISNULL([CM].[I_Max_Week_For_Placement], 1000) AS [I_Max_Week_For_Placement] ,
                CFM.S_CourseFamily_Name ,
                CFM.I_CourseFamily_ID ,
                ISNULL(CFM.I_IsMTech, 0) AS I_IsMTech ,
                TSCD.Dt_BatchStartDate ,
                TSCD.Dt_Course_Actual_End_Date ,
                TSCD.Dt_Course_Expected_End_Date ,
                TSCD.I_Is_Completed ,
                TSCD.I_Batch_ID ,
                tscd.I_Course_Fee_Plan_ID ,
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
                ( SELECT    DATEDIFF(dd,
                                     ( SELECT   MIN(Dt_Attendance_Date)
                                       FROM     dbo.T_Student_Attendance_Details TSAD
                                       WHERE    TSAD.I_Student_Detail_ID = @iStudentDetailId
                                                AND TSAD.I_Course_ID = CM.I_Course_ID
                                                AND I_Has_Attended = 1
                                     ),
                                     ( SELECT   MAX(Dt_Attendance_Date)
                                       FROM     dbo.T_Student_Attendance_Details TSAD
                                       WHERE    TSAD.I_Student_Detail_ID = @iStudentDetailId
                                                AND TSAD.I_Course_ID = CM.I_Course_ID
                                                AND I_Has_Attended = 1
                                     ))
                ) AS Duration_Completed
        FROM    dbo.T_Course_Master CM ,
                dbo.T_CourseFamily_Master CFM ,
                dbo.T_Course_Delivery_Map TCDM ,
                ( SELECT    I_Course_ID ,
                            tsbm.Dt_BatchStartDate ,
                            TSBD.I_Batch_ID ,
                            Dt_Course_Actual_End_Date ,
                            Dt_Course_Expected_End_Date ,
                            CAST(CASE ISNULL(TCBD.I_Status, tsbm.I_Status)
                                   WHEN 5 THEN 1
                                   ELSE 0
                                 END AS BIT) AS I_Is_Completed ,
                            TCBD.I_Course_Fee_Plan_ID ,
                            TSBM.I_Delivery_Pattern_ID
                  FROM      dbo.T_Student_Batch_Details AS TSBD
                            INNER JOIN dbo.T_Student_Batch_Master AS TSBM ON TSBD.I_Batch_ID = TSBM.I_Batch_ID
                            INNER JOIN dbo.T_Center_Batch_Details AS TCBD ON tsbm.I_Batch_ID = TCBD.I_Batch_ID
                  WHERE     TSBD.I_Student_ID = @iStudentDetailId
                            AND TSBD.I_Status <> 0
                            AND TSBD.I_Status IN ( 1, 2 )
                            AND TCBD.I_Centre_Id = @iCenterId
                            AND                  

   --I_Status<>0 AND                          
                            --GETDATE() >= ISNULL(GETDATE(), Dt_Valid_From)
                            --AND GETDATE() <= ISNULL(GETDATE(), Dt_Valid_To)
                            
                              TSBD.I_Student_Batch_ID=(SELECT MAX(tsbd1.I_Student_Batch_ID) FROM T_Student_Batch_Details TSBD1 WHERE 
                            tsbd1.I_Student_ID=TSBD.I_Student_ID
                            and GETDATE() >= ISNULL( TSBD1.Dt_Valid_From,GETDATE())
                            AND GETDATE() <= ISNULL(TSBD1.Dt_Valid_To,GETDATE())
                            AND tsbd1.I_Status IN (1,2)---Akash
                            AND tsbd1.Dt_Valid_From=(SELECT MAX(TSBD2.Dt_Valid_From) FROM dbo.T_Student_Batch_Details TSBD2 WHERE TSBD2.I_Student_ID=@iStudentDetailId AND TSBD2.I_Status IN (1,2))--akash
                            )
                ) TSCD
        WHERE   TSCD.I_Course_ID = CM.I_Course_ID
                AND CFM.I_CourseFamily_ID = CM.I_CourseFamily_ID
                AND TCDM.I_Course_ID = CM.I_Course_ID
                AND TCDM.I_Delivery_Pattern_ID = TSCD.I_Delivery_Pattern_ID                      

                       

   --Table[4] Enquiry Qualification Details                  

        SELECT  TEQD.I_Enquiry_Regn_ID ,
                TEQD.S_Name_Of_Exam ,
                TEQD.S_University_Name ,
                TEQD.S_Year_From ,
                TEQD.S_Year_To ,
                TEQD.S_Subject_Name ,
                TEQD.N_Marks_Obtained ,
                TEQD.N_Percentage ,
                TEQD.S_Division
        FROM    dbo.T_Enquiry_Qualification_Details AS TEQD --INNER JOIN dbo.T_Enquiry_Regn_Detail AS TERD ON TEQD.I_Enquiry_Regn_ID = TERD.I_Enquiry_Regn_ID                
                INNER JOIN dbo.T_Enquiry_Regn_Detail AS TERD ON TEQD.I_Enquiry_Regn_ID = TERD.I_Enquiry_Regn_ID
        WHERE   TEQD.I_Status = 1
                AND TERD.I_Enquiry_Regn_ID = @iEnquiryRegnId              

                    

        SELECT  STUFF(( SELECT  ', ' + CAST(S_StudyMaterial_No AS VARCHAR(20))
                        FROM    T_Student_StudyMaterial_Map
                        WHERE   ( I_Student_Detail_ID = @iStudentDetailId )
                      FOR
                        XML PATH('')
                      ), 1, 2, '') AS StudyMaterialNumbers                 

                                        

    END 