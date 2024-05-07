﻿CREATE PROCEDURE [dbo].[uspGetStudentBatchFromHierarchy] 
(
@sHierarchyList VARCHAR(100),
@iBrandID int
)         
AS             
    BEGIN                                  
        SELECT  C.I_Brand_ID ,            
                C.I_Course_ID ,            
                C.S_Course_Name ,            
                C.I_CourseFamily_ID ,            
                CFM.S_CourseFamily_Name ,            
                C.S_Course_Code ,            
                C.S_Course_Desc ,            
                         
                E.I_Delivery_Pattern_ID ,            
                E.S_Pattern_Name ,            
                E.S_DaysOfWeek ,            
                F.I_Course_Fee_Plan_ID ,            
                F.S_Fee_Plan_Name ,            
                F.N_TotalInstallment ,            
                F.N_TotalLumpSum ,            
                F.N_No_Of_Installments,            
                A.I_Batch_ID ,            
                A.S_Batch_Code ,            
                A.S_Batch_Name ,            
                A.Dt_BatchStartDate ,          
                A.Dt_BatchIntroductionDate,          
                A.s_BatchIntroductionTime,            
                ISNULL(B.I_Status, A.I_Status) AS I_Status ,            
                A.Dt_Course_Expected_End_Date ,            
                A.Dt_Course_Actual_End_Date ,            
                B.I_Centre_Id ,            
                B.Max_Strength ,            
                B.I_Min_Strength ,            
                B.I_Minimum_Regn_Amt ,            
                ISNULL(B.I_Employee_ID, A.I_User_ID) AS I_Employee_ID ,            
                A.b_IsHOBatch ,            
                A.b_IsApproved ,            
                A.I_Admission_GraceDays ,            
                A.b_IsCorporateBatch ,            
                A.I_Latefee_Grace_Day ,    
                tcm.S_Center_Name,  
                CFM.I_IsMTech           
        FROM    T_Student_Batch_Master A            
                inner JOIN dbo.T_Center_Batch_Details B ON A.I_Batch_ID = B.I_Batch_ID            
                INNER JOIN dbo.T_Course_Master C ON A.I_Course_ID = C.I_Course_ID            
                INNER JOIN dbo.T_CourseFamily_Master CFM ON C.I_CourseFamily_ID = CFM.I_CourseFamily_ID   
                INNER JOIN dbo.T_Delivery_Pattern_Master E ON A.I_Delivery_Pattern_ID = E.I_Delivery_Pattern_ID            
                LEFT OUTER JOIN dbo.T_Course_Fee_Plan F ON B.I_Course_Fee_Plan_ID = F.I_Course_Fee_Plan_ID           
                LEFT OUTER JOIN dbo.T_Centre_Master AS tcm ON tcm.I_Centre_Id=b.I_Centre_Id 
                INNER JOIN [dbo].[fnGetCentersForReports](@sHierarchyList, @iBrandID) FN1  
   ON B.I_Centre_Id=FN1.CenterID  
        ORDER BY B.I_Centre_Id,        
    C.I_Brand_ID ,            
                C.I_CourseFamily_ID ,            
                C.I_Course_ID,
                A.Dt_BatchStartDate DESC,--akash        
                A.S_Batch_Name           
    END   