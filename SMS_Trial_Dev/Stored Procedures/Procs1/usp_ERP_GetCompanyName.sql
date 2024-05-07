
CREATE PROCEDURE [dbo].[usp_ERP_GetCompanyName] ---738  
  
 @iCentreID INT  
  
AS  
BEGIN  
  
 SET NOCOUNT OFF;  
  
 SELECT TCM.I_Centre_Id CentreId,TCM.S_Center_Name CenterName,TAC.I_Agreement_Center_ID AgreementCenterID,TBM.S_Brand_Name AS CompanyName 
 ,ECM.S_config_Value as ImageUrl
 FROM dbo.T_Centre_Master AS TCM  
 INNER JOIN NETWORK.T_Agreement_Center AS TAC  
 ON TCM.I_Centre_Id = TAC.I_Centre_Id  
 INNER JOIN NETWORK.T_Agreement_Details AS TAD  
 ON TAC.I_Agreement_ID = TAD.I_Agreement_ID  
 INNER JOIN dbo.T_Brand_Master TBM ON  TAD.I_Brand_ID = TBM.I_Brand_ID
 LEFT JOIN T_ERP_Configuration_Master as ECM 
 on ECM.I_Brand_ID=TBM.I_Brand_ID and ECM.S_config_code='BRAND_LOGO' and ECM.S_Screen IS NULL
 WHERE TCM.I_Centre_Id = @iCentreID  
   
END

