﻿  
-- =============================================  
-- Author:  <Susmita Paul>  
-- Create date: <2024-Jan-20>  
-- Description: <to get Fee components Master from Old to new>  

-- exec [dbo].[usp_ERP_GetFeeComponent_Master] null, 107, null, null
-- =============================================  
  
CREATE PROCEDURE [dbo].[usp_ERP_GetFeeComponent_Master]  
 @FeeHeadId int null,  
 @iBrand int,  
 @isindividual bit = NULL,  
 @isadhoc bit =NULL  
  
  
AS   
    BEGIN    
   
  
 DECLARE @sFeeComponentTypeID INT=NULL;  
   
 IF @isindividual IS NOT NULL  
  BEGIN  
  
   IF @isindividual ='true'  
   BEGIN  
    SET @sFeeComponentTypeID=2  
   END  
   ELSE  
   BEGIN  
    SET @sFeeComponentTypeID=1  
   END  
  
  
  END  
  
  SELECT 
    FeeHeadID,  
    FeeComponentCode,  
    FeeComponent,  
    FeeComponentTypeID,  
    FeeComponentTypeName,  
    TypeOfComponent,  
    Activestatus,  
    Createdby,  
    updatedby,  
    CreatedOn,  
    UpdatedOn,  
    BrandID,
    Is_GST_Applicable,
    GST_config,
	CONVERT(date, Valid_from) AS Valid_from,
	CONVERT(date, Valid_from) AS Valid_to
FROM
(
    SELECT 
        a.I_Fee_Component_ID AS FeeHeadID,  
        S_Component_Code AS FeeComponentCode,  
        S_Component_Name AS FeeComponent,  
        A.I_Fee_Component_Type_ID AS FeeComponentTypeID,  
        TFCT.S_Fee_Component_Type_Name AS FeeComponentTypeName,  
        A.S_Type_Of_Component AS TypeOfComponent,  
        A.I_Status AS Activestatus,  
        A.S_Crtd_By AS Createdby,  
        A.S_Upd_By AS updatedby,  
        A.Dt_Crtd_On AS CreatedOn,  
        A.Dt_Upd_On AS UpdatedOn,  
        a.I_Brand_ID AS BrandID,
        Is_GST_Applicable,
        I_GST_FeeComponent_Catagory_ID AS GST_config,
        ROW_NUMBER() OVER (PARTITION BY a.I_Fee_Component_ID ORDER BY Dt_Valid_From) AS RowNum,
        --Dt_Valid_From AS Valid_from,
        --Dt_Valid_To AS Valid_to
		CONVERT(date, Dt_Valid_From) AS Valid_from,
        CONVERT(date, Dt_Valid_To) AS Valid_to
    FROM    
        dbo.T_Fee_Component_Master A  
    INNER JOIN 
        dbo.T_Fee_Component_Type AS TFCT ON A.I_Fee_Component_Type_ID = TFCT.I_Fee_Component_Type_ID
    LEFT JOIN 
        T_ERP_GST_Item_Category AS TEGIC ON a.I_Fee_Component_ID = TEGIC.I_Fee_Component_ID
    LEFT JOIN 
        T_Tax_Country_Fee_Component AS TTCFC ON a.I_Fee_Component_ID = TTCFC.I_Fee_Component_ID
    WHERE   
        A.I_Status <> 0 
        AND A.I_Brand_ID = @iBrand 
        AND a.I_Fee_Component_ID = ISNULL(@FeeHeadId, a.I_Fee_Component_ID)
        AND A.I_Fee_Component_Type_ID = ISNULL(@sFeeComponentTypeID, A.I_Fee_Component_Type_ID)  
) AS Subquery
WHERE
    RowNum = 1
ORDER BY 
    FeeComponentCode,  
    FeeComponent;

  
  --SELECT a.I_Fee_Component_ID FeeHeadID ,  
  --   S_Component_Code FeeComponentCode,  
  --              S_Component_Name FeeComponent,  
  --              A.I_Fee_Component_Type_ID  as FeeComponentTypeID,  
  --  TFCT.S_Fee_Component_Type_Name FeeComponentTypeName,  
  --  A.S_Type_Of_Component as TypeOfComponent,  
  --              A.I_Status Activestatus,  
  --              A.S_Crtd_By Createdby,  
  --              A.S_Upd_By updatedby,  
  --              A.Dt_Crtd_On CreatedOn,  
  --              A.Dt_Upd_On UpdatedOn,  
  --              a.I_Brand_ID as BrandID,
		--		Is_GST_Applicable,
		--		I_GST_FeeComponent_Catagory_ID as GST_config,
		--		offset(Dt_Valid_From as Valid_from),
		--		Dt_Valid_To as Valid_to
  --      FROM    dbo.T_Fee_Component_Master A  
  --              INNER JOIN dbo.T_Fee_Component_Type AS TFCT ON A.I_Fee_Component_Type_ID = TFCT.I_Fee_Component_Type_ID
		--		left join T_ERP_GST_Item_Category as TEGIC on a.I_Fee_Component_ID = TEGIC.I_Fee_Component_ID
		--		left join T_Tax_Country_Fee_Component as TTCFC on a.I_Fee_Component_ID = TTCFC.I_Fee_Component_ID
  --      WHERE   A.I_Status <> 0 and A.I_Brand_ID=@iBrand AND a.I_Fee_Component_ID = ISNULL(@FeeHeadId, a.I_Fee_Component_ID)
		--		and  A.I_Fee_Component_Type_ID = ISNULL(@sFeeComponentTypeID, A.I_Fee_Component_Type_ID)  
  --      ORDER BY S_Component_Code ,  
  --              S_Component_Name      
      
    END  