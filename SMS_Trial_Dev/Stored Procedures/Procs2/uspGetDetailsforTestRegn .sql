﻿--sp_helptext uspGetDetailsforTestRegn  
  
-- ======================================================================        
-- Author:  Swagatam Sarkar        
-- Create date: 10/04/2007        
-- Description: Get the Enquiry detail for Aptitude Test Registration        
-- ======================================================================        
CREATE PROCEDURE [dbo].[uspGetDetailsforTestRegn ]  --[dbo].[uspGetDetailsforTestRegn ] NULL,NULL,NULL,NULL,'1'  
    (    
      -- Add the parameters for the stored procedure here        
      @sFirstName VARCHAR(50) ,    
      @sMiddleName VARCHAR(50) ,    
      @sLastName VARCHAR(50) ,    
      @sEnquiryNo VARCHAR(20) ,    
      --@SComponentName VARCHAR(200),   
      @sCentreID INT        
    )    
AS     
    BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
        SET NOCOUNT OFF        
        
    -- Table[0]  Enquiry Details        
        SELECT  A.I_Enquiry_Regn_ID ,    
                A.S_First_Name ,    
                A.S_Middle_Name ,    
                A.S_Last_Name ,    
                A.Dt_Crtd_On ,    
                A.S_Enquiry_No ,    
                ECM.I_Exam_Component_ID ,    
                ECM.S_Component_Name ,    
                ET.Dt_Test_Date ,    
                ET.N_Marks ,    
                ET.bypass_Admission_Test    
        FROM    dbo.T_Enquiry_Regn_Detail A    
                LEFT JOIN dbo.T_Enquiry_Test AS ET ON ET.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID    
                LEFT JOIN dbo.T_Exam_Component_Master AS ECM ON ET.I_Exam_Component_ID = ECM.I_Exam_Component_ID    
        WHERE   A.S_Enquiry_No = ISNULL(@sEnquiryNo, A.S_Enquiry_No)    
                AND A.I_Centre_ID = @sCentreID   
                --AND ECM.S_Component_Name = ISNULL(@SComponentName, ECM.S_Component_Name)      
                AND A.S_First_Name LIKE ISNULL(@sFirstName, A.S_First_Name)    
                + '%'    
                AND A.S_Middle_Name LIKE ISNULL(@sMiddleName, A.S_Middle_Name)    
                + '%'    
                AND A.S_Last_Name LIKE ISNULL(@sLastName, A.S_Last_Name) + '%'    
                AND A.I_Enquiry_Status_Code IN ( 1, 2 )    
                --AND ISNULL(A.C_Skip_Test, 'N') <> 'Y'  
                AND ISNULL(A.C_Skip_Test, 'T') <> 'T'              
    END  
