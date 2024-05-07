-- =============================================    
-- Author:  <Parichoy Nandi>    
-- Create date: <14th September 2023>    
-- Description: <to check the feature for status master>    
-- =============================================  
--exec [usp_ERP_GetCongifMasterForStatus] 139  
CREATE PROCEDURE [dbo].[usp_ERP_GetCongifMasterForStatus]    
 @StatusValue int = null    
AS    
BEGIN    
 SET NOCOUNT ON;    
  DECLARE @SGST_Tax_ID int,@CGST_Tax_ID int,@IGST_Tax_ID int  
set @SGST_Tax_ID = (select top 1 I_Tax_ID  from T_Tax_Master where S_Tax_Code='SGST')  
set @CGST_Tax_ID = (select top 1 I_Tax_ID  from T_Tax_Master where S_Tax_Code='CGST')  
set @IGST_Tax_ID = (select top 1 I_Tax_ID  from T_Tax_Master where S_Tax_Code='IGST')  
    -- Insert statements for procedure here    
  select     
  SM.I_Status_Value as StatusValue,    
  SM.N_Amount as Amount,    
  ECM.S_config_code as ConfigCode,    
  ECM.S_config_Value as ConfigValue ,  
  Case When SM.N_Amount between  GICD.N_Start_Amount and GICD.N_End_Amount  
  Then Convert(Numeric(18,2),((SM.N_Amount * N_SGST / 100)))  
  end as SGST,  
  @SGST_Tax_ID SGST_Tax_ID,  
     Case When SM.N_Amount between  GICD.N_Start_Amount and GICD.N_End_Amount  
  Then Convert(Numeric(18,2),((SM.N_Amount * N_CGST / 100) ))
  end as CGST,  
  @CGST_Tax_ID CGST_Tax_ID,  
  Case When SM.N_Amount between  GICD.N_Start_Amount and GICD.N_End_Amount  
  Then Convert(Numeric(18,2),((SM.N_Amount * N_IGST / 100)))  
  end as IGST,  
  @IGST_Tax_ID IGST_Tax_ID  
  from [SMS].[dbo].[T_Status_Master] as SM   
  left join [SMS].[dbo].[T_ERP_Configuration_Master] as ECM   
   on SM.I_ConFig_ID=ECM.I_Config_ID   
  left Join T_ERP_GST_Item_Category GIC on GIC.I_Fee_Component_ID=SM.I_Status_Value  
  and  GIC.[type]=2  
  Inner Join T_ERP_GST_Configuration_Details GICD   
  on GICD.I_GST_FeeComponent_Catagory_ID=GIC.I_GST_FeeComponent_Catagory_ID  
   where SM.I_Status_Value=@StatusValue    
 END 