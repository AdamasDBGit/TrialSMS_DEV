﻿
CREATE PROCEDURE [dbo].[usp_ERP_GetCollectionRegister]  
    (  
      @iSelectedHierarchyId INT=NULL ,  
      @iSelectedBrandId INT,
      @dtDateTo DATETIME ,  
      @dtDateFrom DATETIME ,  
      @sFName VARCHAR(50)=NULL,  
      @sMName VARCHAR(50)=NULL,  
      @sLName VARCHAR(50)=NULL,  
      @sStudentCode VARCHAR(100) = NULL ,  
      @sEnquiryNo VARCHAR(50) = NULL           
    )  
AS   
    BEGIN            
        SET NOCOUNT ON ;            
        DECLARE @sSearchCriteria VARCHAR(100)            
             
        DECLARE @TempCenter TABLE ( I_Center_ID INT )            
             
        IF ( @dtDateTo IS NOT NULL )   
            SET @dtDateTo = DATEADD(dd, -1, @dtDateTo)            
            
        SELECT  @sSearchCriteria = S_Hierarchy_Chain  
        FROM    T_Hierarchy_Mapping_Details  
        WHERE   I_Hierarchy_detail_id = @iSelectedHierarchyId              
             
        IF @iSelectedBrandId = 0   
            BEGIN            
                INSERT  INTO @TempCenter  
                        SELECT  TCHD.I_Center_Id  
                        FROM    T_CENTER_HIERARCHY_DETAILS TCHD  
                        WHERE   TCHD.I_Hierarchy_Detail_ID IN (  
                                SELECT  I_HIERARCHY_DETAIL_ID  
                                FROM    T_Hierarchy_Mapping_Details  
                                WHERE   I_Status = 1  
                                        AND GETDATE() >= ISNULL(Dt_Valid_From,  
                                                              GETDATE())  
                                        AND GETDATE() <= ISNULL(Dt_Valid_To,  
                                                              GETDATE())  
                                        AND S_Hierarchy_Chain LIKE @sSearchCriteria  
                                        + '%' )             
            END            
        ELSE   
            BEGIN            
                INSERT  INTO @TempCenter  
                        SELECT  TCHD.I_Center_Id  
                        FROM    T_CENTER_HIERARCHY_DETAILS TCHD ,  
                                T_BRAND_CENTER_DETAILS TBCD  
                        WHERE   TBCD.I_Brand_ID = @iSelectedBrandId  
                                AND TBCD.I_Centre_Id = TCHD.I_Center_Id  
                                AND TCHD.I_Hierarchy_Detail_ID IN (  
                                SELECT  I_HIERARCHY_DETAIL_ID  
                                FROM    T_Hierarchy_Mapping_Details  
                                WHERE   I_Status = 1  
                                        AND GETDATE() >= ISNULL(Dt_Valid_From,  
                                                              GETDATE())  
                                        AND GETDATE() <= ISNULL(Dt_Valid_To,  
                                                              GETDATE())  
                                        AND S_Hierarchy_Chain LIKE @sSearchCriteria  
                                        + '%' )             
                   
            END            
            
            
        DECLARE @tempTable TABLE  
            (  
              N_Receipt_Amount NUMERIC(18, 2) ,  
              I_Receipt_Header_ID INT ,  
              S_First_Name VARCHAR(50) ,  
              S_Middle_Name VARCHAR(50) ,  
              S_Last_Name VARCHAR(50) ,  
              I_Enquiry_Regn_ID INT ,  
              I_Student_Detail_ID INT ,  
              S_Receipt_No VARCHAR(20) ,  
              Dt_Receipt_Date DATETIME ,  
              I_Invoice_Header_ID INT ,  
              I_Receipt_Type INT ,  
              I_Status INT ,  
              I_Centre_Id INT ,
              OnAccountInvoiceNo VARCHAR(100)
            )            
       
        INSERT  INTO @tempTable  
                SELECT  RH.N_Receipt_Amount ,  
                        RH.I_Receipt_Header_ID ,  
                        SD.S_First_Name ,  
                        SD.S_Middle_Name ,  
                        SD.S_Last_Name ,  
                        RH.I_Enquiry_Regn_ID ,  
                        RH.I_Student_Detail_ID ,  
                        RH.S_Receipt_No ,  
                        RH.Dt_Receipt_Date ,  
                        RH.I_Invoice_Header_ID ,  
                        RH.I_Receipt_Type ,  
                        1 ,  
                        RH.I_Centre_Id,
                        IOAD.S_Invoice_Number
                FROM    dbo.T_Receipt_Header RH WITH ( NOLOCK )  
                        INNER JOIN @TempCenter TC ON RH.I_Centre_Id = TC.I_Center_ID  
                        LEFT OUTER JOIN dbo.T_Student_Detail SD WITH ( NOLOCK ) ON SD.I_Student_Detail_ID = RH.I_Student_Detail_ID  
                        LEFT OUTER JOIN dbo.T_Invoice_Parent IP WITH ( NOLOCK ) ON ISNULL(IP.I_Invoice_Header_ID,  '') = ISNULL(RH.I_Invoice_Header_ID,'')  
                        LEFT OUTER JOIN dbo.T_Invoice_OnAccount_Details IOAD ON IOAD.I_Receipt_Header_ID= RH.I_Receipt_Header_ID AND IOAD.I_Status=1                                                                                                                        
                WHERE   RH.I_Student_Detail_ID IS NOT NULL            
          
                        AND DATEDIFF(dd, RH.Dt_Receipt_Date, @dtDateFrom) <= 0  
                        AND DATEDIFF(dd, RH.Dt_Receipt_Date, @dtDateTo) >= 0  
                        AND ISNULL(SD.S_First_Name, '') LIKE ISNULL(@sFName,  
                                                              '') + '%'  
                        AND ISNULL(SD.S_Middle_Name, '') LIKE ISNULL(@sMName,  
                                                              '') + '%'  
                        AND ISNULL(SD.S_Last_Name, '') LIKE ISNULL(@sLName, '')  
                        + '%'  
                        AND SD.S_Student_ID = ISNULL(@sStudentCode,  
                                                     SD.S_Student_ID)  
                        AND SD.I_Enquiry_Regn_ID = ISNULL(@sEnquiryNo,  
                                                          SD.I_Enquiry_Regn_ID)  
                UNION ALL  
                SELECT  RH.N_Receipt_Amount ,  
                        RH.I_Receipt_Header_ID ,  
                        SD.S_First_Name ,  
                        SD.S_Middle_Name ,  
                        SD.S_Last_Name ,  
                        RH.I_Enquiry_Regn_ID ,  
                        RH.I_Student_Detail_ID ,  
                        RH.S_Receipt_No ,  
                        RH.Dt_Upd_On AS Dt_Receipt_Date ,  
                        RH.I_Invoice_Header_ID ,  
                        RH.I_Receipt_Type ,  
                        0 ,  
                        RH.I_Centre_Id,
                        IOAD.S_Invoice_Number  
                FROM    dbo.T_Receipt_Header RH WITH ( NOLOCK )  
                        INNER JOIN @TempCenter TC ON RH.I_Centre_Id = TC.I_Center_ID  
                        LEFT OUTER JOIN dbo.T_Student_Detail SD WITH ( NOLOCK ) ON SD.I_Student_Detail_ID = RH.I_Student_Detail_ID  
                        LEFT OUTER JOIN dbo.T_Invoice_Parent IP WITH ( NOLOCK ) ON ISNULL(IP.I_Invoice_Header_ID,  
                                                              '') = ISNULL(RH.I_Invoice_Header_ID,  
                                                              '') 
                        LEFT OUTER JOIN dbo.T_Invoice_OnAccount_Details IOAD ON IOAD.I_Receipt_Header_ID= RH.I_Receipt_Header_ID AND IOAD.I_Status=0                                                                                        
                WHERE   RH.I_Student_Detail_ID IS NOT NULL  
                        AND RH.I_Status = 0             
                        AND DATEDIFF(dd, RH.Dt_Upd_On, @dtDateFrom) <= 0  
                        AND DATEDIFF(dd, RH.Dt_Upd_On, @dtDateTo) >= 0  
                        AND ISNULL(SD.S_First_Name, '') LIKE ISNULL(@sFName,  
                                                              '') + '%'  
                        AND ISNULL(SD.S_Middle_Name, '') LIKE ISNULL(@sMName,  
                                                              '') + '%'  
                        AND ISNULL(SD.S_Last_Name, '') LIKE ISNULL(@sLName, '')  
                        + '%'  
                        AND SD.S_Student_ID = ISNULL(@sStudentCode,  
                                                     SD.S_Student_ID)  
                        AND SD.I_Enquiry_Regn_ID = ISNULL(@sEnquiryNo,  
                                                          SD.I_Enquiry_Regn_ID)        
              
        INSERT  INTO @tempTable  
                SELECT  RH.N_Receipt_Amount ,  
                        RH.I_Receipt_Header_ID ,  
                        EQ.S_First_Name ,  
                        EQ.S_Middle_Name ,  
                        EQ.S_Last_Name ,  
                        RH.I_Enquiry_Regn_ID ,  
                        RH.I_Student_Detail_ID ,  
                        RH.S_Receipt_No ,  
                        RH.Dt_Receipt_Date ,  
                        RH.I_Invoice_Header_ID ,  
                        RH.I_Receipt_Type ,  
                        1 ,  
                        RH.I_Centre_Id,
                        IOAD.S_Invoice_Number 
                FROM    dbo.T_Receipt_Header RH WITH ( NOLOCK )  
                        INNER JOIN @TempCenter TC ON RH.I_Centre_Id = TC.I_Center_ID  
                        LEFT OUTER JOIN dbo.T_Enquiry_Regn_Detail EQ WITH ( NOLOCK ) ON EQ.I_Enquiry_Regn_ID = RH.I_Enquiry_Regn_ID  
                        LEFT OUTER JOIN dbo.T_Invoice_Parent IP WITH ( NOLOCK ) ON ISNULL(IP.I_Invoice_Header_ID,  
                                                              '') = ISNULL(RH.I_Invoice_Header_ID,  
                                                              '')   
						LEFT OUTER JOIN dbo.T_Invoice_OnAccount_Details IOAD ON IOAD.I_Receipt_Header_ID= RH.I_Receipt_Header_ID AND IOAD.I_Status=1                                                                                                      
      LEFT OUTER JOIN    T_Student_Detail sd ON RH.I_Student_Detail_ID = sd.I_Student_Detail_ID         
                WHERE   RH.I_Receipt_Header_ID NOT IN (  
                        SELECT  I_Receipt_Header_ID  
                        FROM    @tempTable )  
                        AND RH.I_Student_Detail_ID IS NULL                        
                        AND DATEDIFF(dd, RH.Dt_Receipt_Date, @dtDateFrom) <= 0  
                        AND DATEDIFF(dd, RH.Dt_Receipt_Date, @dtDateTo) >= 0  
                        AND ISNULL(EQ.S_First_Name, '') LIKE ISNULL(@sFName,  
                                                              '') + '%'  
                        AND ISNULL(EQ.S_Middle_Name, '') LIKE ISNULL(@sMName,  
                                                              '') + '%'  
                        AND ISNULL(EQ.S_Last_Name, '') LIKE ISNULL(@sLName, '')  
                        + '%'  
                        AND EQ.S_Enquiry_No = ISNULL(@sEnquiryNo,  
                                                     EQ.S_Enquiry_No)     
      AND ISNULL(sd.S_Student_ID,'') = ISNULL(@sStudentCode,ISNULL(sd.S_Student_ID,''))          
                UNION ALL  
                SELECT  RH.N_Receipt_Amount ,  
                        RH.I_Receipt_Header_ID ,  
                        EQ.S_First_Name ,  
                        EQ.S_Middle_Name ,  
                        EQ.S_Last_Name ,  
                        RH.I_Enquiry_Regn_ID ,  
                        RH.I_Student_Detail_ID ,  
                        RH.S_Receipt_No ,  
                        RH.Dt_Upd_On AS Dt_Receipt_Date ,  
                        RH.I_Invoice_Header_ID ,  
                        RH.I_Receipt_Type ,  
                        0 ,  
                        RH.I_Centre_Id,
                        IOAD.S_Invoice_Number  
                FROM    dbo.T_Receipt_Header RH WITH ( NOLOCK )  
                        INNER JOIN @TempCenter TC ON RH.I_Centre_Id = TC.I_Center_ID  
                        LEFT OUTER JOIN dbo.T_Enquiry_Regn_Detail EQ WITH ( NOLOCK ) ON EQ.I_Enquiry_Regn_ID = RH.I_Enquiry_Regn_ID  
                        LEFT OUTER JOIN dbo.T_Invoice_Parent IP WITH ( NOLOCK ) ON ISNULL(IP.I_Invoice_Header_ID,  
                                                              '') = ISNULL(RH.I_Invoice_Header_ID,  
                                                              '') 
                        LEFT OUTER JOIN dbo.T_Invoice_OnAccount_Details IOAD ON IOAD.I_Receipt_Header_ID= RH.I_Receipt_Header_ID AND IOAD.I_Status=0                                           
      LEFT OUTER JOIN T_Student_Detail sd ON RH.I_Student_Detail_ID = sd.I_Student_Detail_ID         
                WHERE   RH.I_Receipt_Header_ID NOT IN (  
                        SELECT  I_Receipt_Header_ID  
                        FROM    @tempTable )  
                        AND RH.I_Student_Detail_ID IS NULL  
                        AND RH.I_Status = 0                      
                        AND DATEDIFF(dd, RH.Dt_Upd_On, @dtDateFrom) <= 0  
                        AND DATEDIFF(dd, RH.Dt_Upd_On, @dtDateTo) >= 0  
                        AND ISNULL(EQ.S_First_Name, '') LIKE ISNULL(@sFName,  
                                                              '') + '%'  
                        AND ISNULL(EQ.S_Middle_Name, '') LIKE ISNULL(@sMName,  
                                                              '') + '%'  
                        AND ISNULL(EQ.S_Last_Name, '') LIKE ISNULL(@sLName, '')  
                        + '%'  
                        AND EQ.S_Enquiry_No = ISNULL(@sEnquiryNo,  
                                                     EQ.S_Enquiry_No)          
      AND ISNULL(sd.S_Student_ID,'') = ISNULL(@sStudentCode,ISNULL(sd.S_Student_ID,''))        
        

-------------------Default Currency Details---------------------------------
DECLARE @DEFAULTCurrencyID INT
DECLARE @DEFAULTCurrencyCode varchar(max)

select 
@DEFAULTCurrencyID=CurM.I_Currency_ID,
@DEFAULTCurrencyCode=CurM.S_Currency_Code 
from @tempTable T 
INNER JOIN dbo.T_Centre_Master CM ON T.I_Centre_Id = CM.I_Centre_Id  
INNER JOIN dbo.T_Country_Master COU ON CM.I_Country_ID = COU.I_Country_ID
INNER JOIN
T_Currency_Master as CurM on CurM.I_Currency_ID=COU.I_Currency_ID
where Is_Default=1

---------------------------------------------------------------------------


              
        SELECT  T.N_Receipt_Amount ReceiptAmount,  
                RH.N_Tax_Amount TaxAmount,  
                T.I_Receipt_Header_ID ReceiptHeaderID,  
                T.S_First_Name FirstName,  
                T.S_Middle_Name MiddleName,  
                T.S_Last_Name LastName,  
                T.I_Enquiry_Regn_ID EnquiryRegnID,  
                T.I_Student_Detail_ID StudentDetailID,  
                T.S_Receipt_No ReceiptNo,  
                T.Dt_Receipt_Date ReceiptDate,  
                T.I_Invoice_Header_ID InvoiceHeaderID,  
                T.I_Receipt_Type ReceiptType, 
				SM.S_Status_Desc as ReceiptTypeDesc,
                T.I_Status IStatus,  
                T.I_Centre_Id CentreId,  
                CM.S_Center_Code CenterCode,  
                CM.S_Center_Short_Name CenterShortName,  
                ISNULL(CM2.I_Currency_ID,@DEFAULTCurrencyID) as CurrencyID,
				ISNULL(CM2.S_Currency_Code,@DEFAULTCurrencyCode) as CurrencyCode,
                T.OnAccountInvoiceNo  
        FROM    @tempTable T  
                INNER JOIN dbo.T_Centre_Master CM ON T.I_Centre_Id = CM.I_Centre_Id  
                --INNER JOIN dbo.T_Country_Master COU ON CM.I_Country_ID = COU.I_Country_ID  
                INNER JOIN dbo.T_Receipt_Header RH ON T.I_Receipt_Header_ID = RH.I_Receipt_Header_ID
				left join
				T_Currency_Master as CM2 on CM2.I_Currency_ID=ISNULL(RH.I_Currency_ID,0)
				inner join
				T_Brand_Center_Details as BCD on BCD.I_Centre_Id=CM.I_Centre_Id
				left join T_Status_Master as SM on SM.I_Status_Value=T.I_Receipt_Type and (BCD.I_Brand_ID=SM.I_Brand_ID OR SM.I_Brand_ID IS NULL) and SM.S_Status_Type='ReceiptType'
				

        ORDER BY T.I_Receipt_Header_ID DESC            
    END   
