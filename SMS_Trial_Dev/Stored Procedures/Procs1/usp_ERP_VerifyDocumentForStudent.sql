-- =============================================    
-- Author:  <Author,,Name>    
-- Create date: <Create Date,,>    
-- Description: <Description,,>    
--exec [usp_ERP_GetAllDocumentForStudent] 6    
-- =============================================    
CREATE PROCEDURE [dbo].[usp_ERP_VerifyDocumentForStudent]    
 (    
 @DocumentStudRegnID int,    
 @Status int    
 )    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
     
 UPDATE T_ERP_Document_Student_Map set Is_verified = @Status ,Dtt_Verified_date= GETDATE()    
 where     
 I_Document_StudRegn_ID = @DocumentStudRegnID    
  
   
 Update T_Enquiry_Regn_Detail SET R_I_AdmStgTypeID = 5 WHERE I_Enquiry_Regn_ID =   
 (select R_I_Enquiry_Regn_ID from T_ERP_Document_Student_Map   
 where I_Document_StudRegn_ID = @DocumentStudRegnID)  
     
 select @Status StatusFlag,'Status Updated' Message    
     
END 