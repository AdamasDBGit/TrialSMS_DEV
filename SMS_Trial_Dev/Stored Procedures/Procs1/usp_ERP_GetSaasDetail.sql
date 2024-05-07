CREATE PROCEDURE [dbo].[usp_ERP_GetSaasDetail]  
 @Brandid int = null  
AS  
BEGIN  
 SET NOCOUNT ON;  
  
   select BM.S_Brand_Code as BrandCode,  
BM.S_Brand_Name as BrandName,  
BM.S_Short_Code as ShortCode,  
BM.I_Brand_ID as BrandID  

from T_Brand_Master as BM where BM.I_Brand_ID=@Brandid  
  
SELECT   
    SPH.I_Pattern_HeaderID as PatternHeaderID,  
    SPH.S_Property_Type as PropertyType,   
    SPH.S_Property_Name as PropertyName,  
    SPH.N_help as help,  
    CASE   
        WHEN PCH.Is_Active = 1 THEN PCH.N_Value  
        ELSE NULL  
    END as PropertyValue,  
 PCH.I_Saas_Pattern_Child_Header_ID  as ChildHeaderID,  
 PCH.Pattern1 as Pattern1,  
 PCH.Pattern2 as Pattern2,  
 PCH.Pattern3 as Pattern3,
 SPH.S_Screen as Screen
   
FROM   
    T_ERP_Saas_Pattern_Header as SPH   
LEFT JOIN   
    T_ERP_Saas_Pattern_Child_Header as PCH on SPH.I_Pattern_HeaderID = PCH.I_Pattern_HeaderID  
WHERE   
    SPH.I_Brand_ID = @Brandid  
    AND SPH.Is_Active = 1   
  
 END  