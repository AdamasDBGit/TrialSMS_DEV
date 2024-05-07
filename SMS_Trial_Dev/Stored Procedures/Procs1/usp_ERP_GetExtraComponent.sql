-- =============================================  
-- Author:  <Parichoy Nandi>  
-- Create date: <23-11-2023>  
-- Description: <get the listing for fee structure>  
-- exec [dbo].[usp_ERP_GetExtraComponent] 2  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_ERP_GetExtraComponent]  
(  
@sessionID int = null  
)  
 -- Add the parameters for the stored procedure here  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 select   
 S_Component_Name as FeeComponentName ,  
 I_Fee_Component_ID as FeeComponentID ,  
 I_Extracomponent_Ref_Type as ExtracomponentRef  
 from T_Fee_Component_Master  
 WHERE Is_individual = 1  and I_Status = 1
END  