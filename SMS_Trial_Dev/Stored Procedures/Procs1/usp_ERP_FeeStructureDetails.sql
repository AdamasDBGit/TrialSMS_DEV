CREATE PROCEDURE [dbo].[usp_ERP_FeeStructureDetails]        
(        
@schoolGroupID int = null,        
@enquiryID int = null        
)        
 -- Add the parameters for the stored procedure here        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
    -- Insert statements for procedure here        
     
   Declare @ClassID int,@streamID int  
  
   SET  @ClassID=(Select I_Class_ID  from T_Enquiry_Regn_Detail   
   where I_Enquiry_Regn_ID=@enquiryID  )
     
   SET  @streamID=(Select I_Stream_ID  from T_Enquiry_Regn_Detail   
   where I_Enquiry_Regn_ID=@enquiryID  )
  
--select @ClassID,@streamID  
If @streamID is  null
Begin
 SELECT         
 TEFS.S_Fee_Structure_Name+' (' +TEFS.S_Fee_Code+')' FeeStructureName         
,TEFS.S_Fee_Code FeeCode        
,TEFS.I_Fee_Structure_ID FeeStructureID        
,TEFS.N_Total_OneTime_Amount TotalAmount        
,TEFS.Is_Late_Fine_Applicable IsLateFineApplicable        
      
 FROM T_ERP_Fee_Structure TEFS       
 where Is_Active =1   and TEFS.I_Class_ID=@ClassID  
 End
 Else
 Begin
  SELECT         
 TEFS.S_Fee_Structure_Name+' (' +TEFS.S_Fee_Code+')' FeeStructureName         
,TEFS.S_Fee_Code FeeCode        
,TEFS.I_Fee_Structure_ID FeeStructureID        
,TEFS.N_Total_OneTime_Amount TotalAmount        
,TEFS.Is_Late_Fine_Applicable IsLateFineApplicable        
      
 FROM T_ERP_Fee_Structure TEFS       
 where Is_Active =1   and TEFS.I_Class_ID=@ClassID  and TEFS.I_Stream_ID=@streamID
 End 
   
          
        
END 