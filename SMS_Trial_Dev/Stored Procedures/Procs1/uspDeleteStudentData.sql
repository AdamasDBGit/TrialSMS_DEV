﻿-- =============================================  
  
-- =============================================  
CREATE PROCEDURE [dbo].[uspDeleteStudentData]   
(  
 @iStudentLoginID VARCHAR(MAX)  
)  
  
AS  
SET NOCOUNT OFF  
  
  
  
DECLARE @iEnquiryID INT  
DECLARE @iStudentDetailID INT  
DECLARE @Message VARCHAR(MAX)  
  
  
BEGIN TRY    
  
BEGIN TRANSACTION  
  
IF EXISTS( SELECT * FROM dbo.T_Student_Detail AS tsd WHERE S_Student_ID = @iStudentLoginID)  
  
BEGIN  
  
SELECT @iStudentDetailID = I_Student_Detail_ID,@iEnquiryID=I_Enquiry_Regn_ID FROM dbo.T_Student_Detail AS tsd WHERE S_Student_ID = @iStudentLoginID  
  
PRINT @iStudentDetailID  
PRINT @iEnquiryID  
---Delete Student Data  
---Start Script  
DELETE FROM dbo.T_Receipt_Tax_Detail WHERE I_Receipt_Comp_Detail_ID IN   
(SELECT I_Receipt_Comp_Detail_ID FROM dbo.T_Receipt_Component_Detail WHERE I_Receipt_Detail_ID IN   
( SELECT I_Receipt_Header_ID FROM [dbo].[T_Receipt_Header] WHERE I_Enquiry_Regn_ID IN (@iEnquiryID)))   
  
DELETE FROM dbo.T_Receipt_Component_Detail WHERE I_Receipt_Detail_ID IN ( SELECT I_Receipt_Header_ID FROM [dbo].[T_Receipt_Header] WHERE I_Enquiry_Regn_ID IN (@iEnquiryID))   
  
DELETE FROM dbo.T_OnAccount_Receipt_Tax WHERE I_Receipt_Header_ID IN (SELECT I_Receipt_Header_ID FROM [dbo].[T_Receipt_Header] WHERE I_Enquiry_Regn_ID IN (@iEnquiryID))   
  
DELETE FROM dbo.T_Student_Registration_Details WHERE I_Receipt_Header_ID IN (SELECT I_Receipt_Header_ID FROM [dbo].[T_Receipt_Header] WHERE I_Enquiry_Regn_ID IN (@iEnquiryID))   
  
DELETE from [dbo].[T_Receipt_Header] WHERE I_Enquiry_Regn_ID IN (SELECT I_Enquiry_Regn_ID FROM [dbo].[T_Student_Detail] where I_Student_Detail_ID in (@iStudentDetailID))  
  
DELETE FROM dbo.T_Receipt_Tax_Detail WHERE I_Receipt_Comp_Detail_ID IN   
(SELECT I_Receipt_Comp_Detail_ID FROM dbo.T_Receipt_Component_Detail WHERE I_Receipt_Detail_ID IN   
( SELECT I_Receipt_Header_ID FROM [dbo].[T_Receipt_Header] where I_Student_Detail_ID in (@iStudentDetailID)))   
  
DELETE FROM dbo.T_Receipt_Component_Detail WHERE I_Receipt_Detail_ID IN ( SELECT I_Receipt_Header_ID FROM [dbo].[T_Receipt_Header] WHERE I_Student_Detail_ID in (@iStudentDetailID))   
  
DELETE FROM dbo.T_OnAccount_Receipt_Tax WHERE I_Receipt_Header_ID IN (SELECT I_Receipt_Header_ID FROM [dbo].[T_Receipt_Header] WHERE  I_Student_Detail_ID in (@iStudentDetailID))   
  
  
DELETE FROM [dbo].[T_Receipt_Header] where I_Student_Detail_ID in (@iStudentDetailID)   
  
DELETE FROM [dbo].[T_Student_Term_Detail] where I_Student_Detail_ID in (@iStudentDetailID)  
  
DELETE FROM [dbo].[T_Student_Center_Detail] where I_Student_Detail_ID in (@iStudentDetailID)   
  
DELETE FROM [dbo].[T_Student_Module_Detail] where I_Student_Detail_ID in (@iStudentDetailID)   

delete from T_Student_StudyMaterial_Map where I_Student_Detail_ID IN (@iStudentDetailID) 
  
DELETE FROM [dbo].[T_Student_Detail] where I_Student_Detail_ID in (@iStudentDetailID)   
  
DELETE FROM [dbo].[T_Enquiry_Course] WHERE I_Enquiry_Regn_ID IN (@iEnquiryID)  
  
DELETE FROM [dbo].[T_Enquiry_Regn_Followup] WHERE I_Enquiry_Regn_ID IN (@iEnquiryID)  
  
DELETE FROM [dbo].[T_Enquiry_Regn_Detail] WHERE I_Enquiry_Regn_ID IN (@iEnquiryID)  
  
  
DELETE FROM dbo.T_Invoice_Detail_Tax WHERE I_Invoice_Detail_ID IN (SELECT I_Invoice_Detail_ID FROM dbo.T_Invoice_Child_Detail WHERE I_Invoice_Child_Header_ID IN (SELECT I_Invoice_Child_Header_ID FROM dbo.T_Invoice_Child_Header WHERE I_Invoice_Header_ID IN
 (SELECT I_Invoice_Header_ID FROM [dbo].[T_Invoice_Parent] where I_Student_Detail_ID in (@iStudentDetailID))) )  
  
DELETE FROM dbo.T_Invoice_Child_Detail WHERE I_Invoice_Child_Header_ID IN (SELECT I_Invoice_Child_Header_ID FROM dbo.T_Invoice_Child_Header WHERE I_Invoice_Header_ID IN (SELECT I_Invoice_Header_ID FROM [dbo].[T_Invoice_Parent] where I_Student_Detail_ID in
 (@iStudentDetailID)))   

delete from T_Invoice_Batch_Map where I_Invoice_Child_Header_ID IN (SELECT I_Invoice_Child_Header_ID FROM dbo.T_Invoice_Child_Header WHERE I_Invoice_Header_ID IN (SELECT I_Invoice_Header_ID FROM [dbo].[T_Invoice_Parent] where I_Student_Detail_ID in
 (@iStudentDetailID))) 

DELETE FROM dbo.T_Invoice_Child_Header WHERE I_Invoice_Header_ID IN (SELECT I_Invoice_Header_ID FROM [dbo].[T_Invoice_Parent] where I_Student_Detail_ID in (@iStudentDetailID))   
  
DELETE from [dbo].[T_Invoice_Parent] where I_Student_Detail_ID in (@iStudentDetailID)   
  
  
DELETE from dbo.T_Student_Batch_Details where I_Student_ID in (@iStudentDetailID)   
  
DELETE FROM dbo.T_User_Role_Details WHERE I_User_ID IN (SELECT I_User_ID FROM dbo.T_User_Master WHERE I_Reference_ID IN (@iStudentDetailID))  
  
DELETE FROM dbo.T_Login_Trail WHERE I_User_ID IN (SELECT I_User_ID FROM dbo.T_User_Master WHERE I_Reference_ID IN (@iStudentDetailID))  
  
DELETE FROM dbo.T_User_Master WHERE I_Reference_ID IN (@iStudentDetailID)   
  
---End Script  
SET @Message = 'No Student Data Deleted Successfully .'  
PRINT @Message  
    
END  
ELSE  
BEGIN   
  
  SET @Message = 'No Student LoginId Found.'  
  PRINT @Message  
    
END  
  
COMMIT TRANSACTION  
  
  
END TRY  
  
BEGIN CATCH  
 --Error occurred:    
    ROLLBACK TRANSACTION  
  
 DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int  
 SELECT @ErrMsg = ERROR_MESSAGE(),  
   @ErrSeverity = ERROR_SEVERITY()  
  
 RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH  