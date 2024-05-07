﻿/*--------------------------------------------------------------------------------------------------------------------------------------  
SP NAME        -  [dbo].[uspGetIndividualIstallmentInvoice]  
CREATED DATE   -  26th Jume 2017  
EXEC EXAMPLE   -  [dbo].[uspGetIndividualIstallmentInvoice] 161389,4,0.00,2800.00  
      [dbo].[uspGetIndividualIstallmentInvoice] 161389,4,1800.00,0.00  
      [dbo].[uspGetIndividualIstallmentInvoice] 'RICE/932890'  
      [dbo].[uspGetIndividualIstallmentInvoice] 'RC19C04170452395', 'C'             
--------------------------------------------------------------------------------------------------------------------------------------*/  
CREATE PROCEDURE [ECOMMERCE].[uspGetIndividualIstallmentInvoice]  
(   
 @SInvoiceNo VARCHAR(256)  
 ,@InvoiceType VARCHAR(256)  
)  
AS  
BEGIN  
 DECLARE @row INT = 1 --ROW COUNTER FOR WHILE LOOP  
 DECLARE @count INT --TOTAL ROW COUNT OF #T  
   
 CREATE TABLE #TRIN  
 (  
  ID INT IDENTITY(1,1),  
  S_Reff_Invoice_No VARCHAR(256),  
  --09/05/2017  
  S_Reff_Invoice_Date VARCHAR(256)   
 )  
  
 IF (@InvoiceType='C')  
 BEGIN  
  CREATE TABLE #T  
  (  
   ID INT IDENTITY(1,1),  
   I_Credit_Note_Invoice_Child_Detail_ID INT,  
   I_Invoice_Detail_ID INT,  
   I_Invoice_Child_Header_ID INT,  
   I_Installment_No INT,  
   Dt_Installment_Date DATETIME,  
   N_Amount_Due NUMERIC(18,2),  
   N_Discount_Amount NUMERIC(18,2),  
   N_Amount_Adv_Coln NUMERIC(18,2),  
   S_Invoice_No VARCHAR(256),  
   S_Reff_Invoice_No VARCHAR(256),  
   --09/05/2017  
   S_Reff_Invoice_Date VARCHAR(256)   
  )  
    
  --SECOND TEMPORARY TABLE FOR INCLUSION OF INSTALLMENT WISE TAX DETAILS  
  CREATE TABLE #TT  
  (  
   ID INT IDENTITY(1,1),  
   I_Invoice_Detail_ID INT,  
   I_Tax_ID INT NULL,  
   N_TAX_Amount NUMERIC(18,2) NULL  
  )  
  INSERT INTO #T   
  (  
   I_Credit_Note_Invoice_Child_Detail_ID,  
   I_Invoice_Detail_ID,  
   I_Invoice_Child_Header_ID,  
   I_Installment_No,  
   Dt_Installment_Date,  
   N_Amount_Due,  
   N_Discount_Amount,  
   N_Amount_Adv_Coln,  
   S_Invoice_No,  
   S_Reff_Invoice_No,  
   --09/05/2017  
   S_Reff_Invoice_Date  
  )  
  SELECT   
   ICCD.I_Credit_Note_Invoice_Child_Detail_ID,  
   ICD.I_Invoice_Detail_ID,  
   ICD.I_Invoice_Child_Header_ID,  
   ICD.I_Installment_No,  
   CONVERT(DATE,CASE WHEN CONVERT(DATE, ICD.Dt_Installment_Date) > CONVERT(DATE, ICCD.Dt_Crtd_On) THEN ICD.Dt_Installment_Date  
     ELSE ICCD.Dt_Crtd_On  
   END) AS Dt_Installment_Date,  
   CASE WHEN ISNULL(ICD.Flag_IsAdvanceTax,'N') = 'N' THEN ISNULL(ICCD.N_Amount_Due,0.00)  
     ELSE 0.00  
   END N_Amount_Due,  
   ICD.N_Discount_Amount,  
   CASE WHEN ISNULL(ICD.Flag_IsAdvanceTax,'N') = 'N' THEN ISNULL(ICCD.N_Amount_Adv,0.00)  
     ELSE ISNULL(ICCD.N_Amount,0.00)  
   END,  
   ICCD.S_Invoice_Number,  
   ICD.S_Invoice_Number AS S_Reff_Invoice_No,  
   --09/05/2017  
   --CONVERT(DATE, ICD.Dt_Installment_Date) as S_Reff_Invoice_Date  
   REPLACE(CONVERT(NVARCHAR(256),ICD.Dt_Installment_Date,106),' ','/')as S_Reff_Invoice_Date  
  FROM dbo.T_Credit_Note_Invoice_Child_Detail ICCD   
  INNER JOIN dbo.T_Invoice_Child_Detail ICD ON ICCD.I_Invoice_Detail_ID = ICD.I_Invoice_Detail_ID  
  INNER JOIN dbo.T_Invoice_Child_Header ICH  
  ON ICD.I_Invoice_Child_Header_ID = ICH.I_Invoice_Child_Header_ID   
  AND ICCD.S_Invoice_Number = @SInvoiceNo  
    
  DECLARE @ICreditNoteInvoiceChildDetailID INT  
    
  SET @row = 1  
  SELECT @count=COUNT(ID) FROM #T  
  
  WHILE(@row <= @count)  
  BEGIN   
   --SELECTION OF INVOICE DETAIL ID FOR EACH ROW IN TEMP TABLE #T  
   SELECT @ICreditNoteInvoiceChildDetailID = I_Credit_Note_Invoice_Child_Detail_ID FROM #T WHERE ID = @row    
   --INSERTION OF TAX DETAIL AGAINST EVERY INSTALLMENT  
   INSERT INTO #TT   
   (    
    I_Invoice_Detail_ID,  
    I_Tax_ID,  
    N_TAX_Amount  
   )  
   SELECT   
    T.I_Invoice_Detail_ID,  
    ISNULL(IDT.I_Tax_ID,0),  
    ISNULL(IDT.N_Tax_Value,0.00)  
   FROM #T AS T  
   INNER JOIN dbo.T_Credit_Note_Invoice_Child_Detail_Tax AS IDT ON T.I_Credit_Note_Invoice_Child_Detail_ID = IDT.I_Credit_Note_Invoice_Child_Detail_ID  
   WHERE T.I_Credit_Note_Invoice_Child_Detail_ID = @ICreditNoteInvoiceChildDetailID    
   --WHILE LOOP COUNTER  
   SET @row = @row + 1   
  END  
    
  DECLARE @CGSTAmt NUMERIC(18,2)  
  DECLARE @SGSTAmt NUMERIC(18,2)  
  DECLARE @IGSTAmt NUMERIC(18,2)  
  DECLARE @TAXAmt NUMERIC(18,2)  
    
  SELECT  
   @SGSTAmt = SUM(ISNULL(T.N_SGST_Amount,0.00)),  
   @CGSTAmt = SUM(ISNULL(T.N_CGST_Amount,0.00)),  
   @IGSTAmt = SUM(ISNULL(T.N_IGST_Amount,0.00)),  
   @TAXAmt = SUM(ISNULL(T.N_Tax_Amount,0.00))   
  FROM(SELECT    
   T.I_Invoice_Detail_ID,  
   CASE WHEN TM.S_Tax_Code = 'SGST'  
    THEN  T.N_TAX_Amount END N_SGST_Amount,  
   CASE WHEN TM.S_Tax_Code = 'CGST'  
    THEN  T.N_TAX_Amount END N_CGST_Amount,  
   CASE WHEN TM.S_Tax_Code = 'IGST'  
    THEN  T.N_TAX_Amount END N_IGST_Amount,  
   CASE WHEN TM.S_Tax_Code NOT IN ('SGST','CGST')  
    THEN  T.N_TAX_Amount END N_Tax_Amount    
  FROM #TT AS T  
  LEFT OUTER JOIN dbo.T_Tax_Master AS TM ON T.I_Tax_ID = TM.I_Tax_ID) T  
    
  SELECT FST.I_Installment_No,  
   REPLACE(CONVERT(NVARCHAR(256),FST.Dt_Installment_Date,106),' ','/') Dt_Installment_Date,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FST.N_Amount_Due,0)) N_Amount_Due,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FST.N_Discount_Amount,0)) N_Discount_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FST.N_Amount_Adv_Coln,0)) N_Amount_Adv_Coln,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * ISNULL(@SGSTAmt,0) N_SGST_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * ISNULL(@CGSTAmt,0) N_CGST_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * ISNULL(@IGSTAmt,0) N_IGST_Amount ,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * ISNULL(@TAXAmt,0) N_Tax_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END *   
   CASE WHEN SUM(ISNULL(FST.N_Amount_Due,0.00)) > 0   
   THEN (SUM(ISNULL(FST.N_Amount_Due,0.00))-SUM(ISNULL(FST.N_Discount_Amount,0.00))) - SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00))  
   ELSE SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00)) END N_Net_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END *   
   CASE WHEN SUM(ISNULL(FST.N_Amount_Due,0.00)) > 0   
   THEN (SUM(ISNULL(FST.N_Amount_Due,0.00))-SUM(ISNULL(FST.N_Discount_Amount,0.00))) - SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00)) + ISNULL(@SGSTAmt,0) + ISNULL(@CGSTAmt,0) + ISNULL(@IGSTAmt,0) + ISNULL(@TAXAmt,0)  
   ELSE SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00)) + ISNULL(@SGSTAmt,0) + ISNULL(@CGSTAmt,0) + ISNULL(@IGSTAmt,0) + ISNULL(@TAXAmt,0)  
   END N_Total_Amount  
  FROM #T AS FST  
  GROUP BY FST.I_Installment_No, REPLACE(CONVERT(NVARCHAR(256),FST.Dt_Installment_Date,106),' ','/')  
    
  --09/05/2017  
  --INSERT INTO #TRIN(S_Reff_Invoice_No)  
  --SELECT DISTINCT S_Reff_Invoice_No FROM #T  
  INSERT INTO #TRIN(S_Reff_Invoice_No,S_Reff_Invoice_Date)  
  SELECT DISTINCT S_Reff_Invoice_No,REPLACE(CONVERT(NVARCHAR(256),S_Reff_Invoice_Date,106),' ','/')FROM #T  
    
  DROP TABLE #T  
  DROP TABLE #TT  
 END  
 ELSE  
 BEGIN  
  CREATE TABLE #T1  
  (  
   ID INT IDENTITY(1,1),  
   I_Invoice_Detail_ID INT,  
   I_Invoice_Child_Header_ID INT,  
   I_Installment_No INT,  
   Dt_Installment_Date DATETIME,  
   N_Amount_Due NUMERIC(18,2),  
   N_Discount_Amount NUMERIC(18,2),  
   N_Amount_Adv_Coln NUMERIC(18,2),  
   S_Invoice_No VARCHAR(256)    
  )  
    
  --SECOND TEMPORARY TABLE FOR INCLUSION OF INSTALLMENT WISE TAX DETAILS  
  CREATE TABLE #TT1  
  (  
   ID INT IDENTITY(1,1),  
   I_Invoice_Detail_ID INT,  
   I_Tax_ID INT NULL,  
   N_TAX_Amount NUMERIC(18,2) NULL  
  )  
  INSERT INTO #T1  
  (  
   I_Invoice_Detail_ID,  
   I_Invoice_Child_Header_ID,  
   I_Installment_No,  
   Dt_Installment_Date,  
   N_Amount_Due,  
   N_Discount_Amount,  
   N_Amount_Adv_Coln,  
   S_Invoice_No  
  )  
  SELECT   
   ICD.I_Invoice_Detail_ID,  
   ICD.I_Invoice_Child_Header_ID,  
   ICD.I_Installment_No,  
   CONVERT(DATE,ICD.Dt_Installment_Date),  
   ISNULL(ICD.N_Amount_Due,0.00),  
   ICD.N_Discount_Amount,  
   ISNULL(ICD.N_Amount_Adv_Coln,0.00),  
   ICD.S_Invoice_Number  
  FROM dbo.T_Invoice_Child_Detail ICD  
  INNER JOIN dbo.T_Invoice_Child_Header ICH  
  ON ICD.I_Invoice_Child_Header_ID = ICH.I_Invoice_Child_Header_ID   
  AND ICD.S_Invoice_Number = @SInvoiceNo   
    
  DECLARE @InvoiceDetailID INT  
  
  SET @row = 1  
  SELECT @count=COUNT(ID) FROM #T1  
  
  WHILE(@row <= @count)  
  BEGIN   
   --SELECTION OF INVOICE DETAIL ID FOR EACH ROW IN TEMP TABLE #T  
   SELECT @InvoiceDetailID = I_Invoice_Detail_ID FROM #T1 WHERE ID = @row    
   --INSERTION OF TAX DETAIL AGAINST EVERY INSTALLMENT  
   INSERT INTO #TT1  
   (    
    I_Invoice_Detail_ID,  
    I_Tax_ID,  
    N_TAX_Amount  
   )  
   SELECT   
    T.I_Invoice_Detail_ID,  
    ISNULL(IDT.I_Tax_ID,0),  
    ISNULL(IDT.N_Tax_Value_Scheduled,0.00)  
   FROM #T1 AS T  
   INNER JOIN dbo.T_Invoice_Detail_Tax AS IDT  
   ON T.I_Invoice_Detail_ID = IDT.I_Invoice_Detail_ID  
   WHERE T.I_Invoice_Detail_ID = @InvoiceDetailID    
   --WHILE LOOP COUNTER  
   SET @row = @row + 1   
  END  
    
  SELECT  
   FST.I_Installment_No,  
   REPLACE(CONVERT(NVARCHAR(256),FST.Dt_Installment_Date,106),' ','/') Dt_Installment_Date,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FST.N_Amount_Due,0)) N_Amount_Due,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FST.N_Discount_Amount,0)) N_Discount_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FST.N_Amount_Adv_Coln,0)) N_Amount_Adv_Coln,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FT.N_SGST_Amount,0)) N_SGST_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FT.N_CGST_Amount,0)) N_CGST_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FT.N_IGST_Amount,0)) N_IGST_Amount ,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END * SUM(ISNULL(FT.N_Tax_Amount,0)) N_Tax_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END *   
   CASE WHEN SUM(ISNULL(FST.N_Amount_Due,0.00)) > 0   
   THEN (SUM(ISNULL(FST.N_Amount_Due,0.00))-SUM(ISNULL(FST.N_Discount_Amount,0.00))) - SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00))  
   ELSE SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00)) END N_Net_Amount,  
   CASE WHEN @InvoiceType = 'C' THEN (-1) ELSE 1 END *   
   CASE WHEN SUM(ISNULL(FST.N_Amount_Due,0.00)) > 0   
   THEN (SUM(ISNULL(FST.N_Amount_Due,0.00))-SUM(ISNULL(FST.N_Discount_Amount,0.00))) - SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00)) + SUM(ISNULL(FT.N_SGST_Amount,0.00)) + SUM(ISNULL(FT.N_CGST_Amount,0.00)) + SUM(ISNULL(FT.N_IGST_Amount,0.00)) + SUM(ISNULL(FT.N_Tax_Amount,0.00))  
   ELSE SUM(ISNULL(FST.N_Amount_Adv_Coln,0.00)) + SUM(ISNULL(FT.N_SGST_Amount,0.00)) + SUM(ISNULL(FT.N_CGST_Amount,0.00)) + SUM(ISNULL(FT.N_IGST_Amount,0.00)) + SUM(ISNULL(FT.N_Tax_Amount,0.00))  
   END N_Total_Amount  
  FROM #T1 AS FST  
  LEFT JOIN (SELECT   
   T.I_Invoice_Detail_ID,  
   SUM(ISNULL(T.N_SGST_Amount,0.00)) AS N_SGST_Amount,  
   SUM(ISNULL(T.N_CGST_Amount,0.00)) AS N_CGST_Amount,  
   SUM(ISNULL(T.N_IGST_Amount,0.00)) AS N_IGST_Amount,  
   SUM(ISNULL(T.N_Tax_Amount,0.00)) AS N_Tax_Amount   
  FROM(SELECT    
   T.I_Invoice_Detail_ID,  
   CASE WHEN TM.S_Tax_Code = 'SGST'  
    THEN  T.N_TAX_Amount END N_SGST_Amount,  
   CASE WHEN TM.S_Tax_Code = 'CGST'  
    THEN  T.N_TAX_Amount END N_CGST_Amount,  
   CASE WHEN TM.S_Tax_Code = 'IGST'  
    THEN  T.N_TAX_Amount END N_IGST_Amount,  
   CASE WHEN TM.S_Tax_Code NOT IN ('SGST','CGST')  
    THEN  T.N_TAX_Amount END N_Tax_Amount    
  FROM #TT1 AS T  
  LEFT OUTER JOIN dbo.T_Tax_Master AS TM ON T.I_Tax_ID = TM.I_Tax_ID) T  
  GROUP BY T.I_Invoice_Detail_ID  
  ) FT ON FST.I_Invoice_Detail_ID = FT.I_Invoice_Detail_ID  
  GROUP BY FST.I_Installment_No, REPLACE(CONVERT(NVARCHAR(256),FST.Dt_Installment_Date,106),' ','/')  
    
  DROP TABLE #T1  
  DROP TABLE #TT1  
 END  
   
 CREATE TABLE #TTT  
 (  
  ID INT IDENTITY(1,1),  
  S_Receipt_No VARCHAR(256),  
  Dt_Receipt_Date DATE  
 )  
 INSERT INTO #TTT  
    
 SELECT DISTINCT B.S_Receipt_No,REPLACE(CONVERT(NVARCHAR(256),B.Dt_Receipt_Date,106),' ','/') Dt_Receipt_Date   
 FROM T_Invoice_Child_Detail A   
 INNER JOIN T_Advance_Receipt_Mapping ACM ON A.I_Invoice_Detail_ID = ACM.I_Invoice_Detail_ID  
 INNER JOIN T_Receipt_Header B ON ACM.I_Receipt_Header_ID=B.I_Receipt_Header_ID  
 WHERE S_Invoice_Number=@SInvoiceNo  
 AND A.Flag_IsAdvanceTax='Y'  
  
 DECLARE @rnrow int = 1  
 DECLARE @rncount INT  
 DECLARE @srecptNO VARCHAR(256)  
 DECLARE @recptNO VARCHAR(256)  
 DECLARE @recptDate VARCHAR(256)  
  
 SELECT @rncount = COUNT(ID) FROM #TTT  
 SET @srecptNO = '';  
 WHILE (@rnrow <= @rncount)  
 BEGIN  
  SELECT @recptNO = S_Receipt_No,  
    @recptDate = Dt_Receipt_Date  
  FROM #TTT WHERE ID = @rnrow  
  IF (@rnrow=1)  
   SET @srecptNO = @srecptNO + @recptNO  
  ELSE  
   SET @srecptNO = @srecptNO + ',' + @recptNO  
  SET @rnrow = @rnrow + 1  
 END  
   
 --SELECT @srecptNO AS S_Receipt_No, @recptDate AS Dt_Receipt_Date  
   
   
 SET @rnrow = 1  
 DECLARE @S_Tot_Reff_Invoice_No VARCHAR(256) = ''  
 DECLARE @S_Reff_Invoice_No NVARCHAR(256) = ''  
 --09/05/2017  
 DECLARE @S_Tot_Reff_Invoice_Date VARCHAR(256) = ''  
 DECLARE @S_Reff_Invoice_Date NVARCHAR(256) = ''  
   
 SELECT @rncount = COUNT(ID) FROM #TRIN  
   
 WHILE (@rnrow <= @rncount)  
 BEGIN  
  SELECT @S_Reff_Invoice_No = S_Reff_Invoice_No,  
    @S_Reff_Invoice_Date = S_Reff_Invoice_Date  
  FROM #TRIN WHERE ID = @rnrow  
  IF (@rnrow=1)  
   BEGIN  
    SET @S_Tot_Reff_Invoice_No = @S_Tot_Reff_Invoice_No + @S_Reff_Invoice_No  
    --09/05/2017  
    SET @S_Tot_Reff_Invoice_Date = @S_Tot_Reff_Invoice_Date + @S_Reff_Invoice_Date  
   END  
  ELSE  
   BEGIN  
    SET @S_Tot_Reff_Invoice_No = @S_Tot_Reff_Invoice_No + ',' + @S_Reff_Invoice_No  
    --09/05/2017  
    SET @S_Tot_Reff_Invoice_Date = @S_Tot_Reff_Invoice_Date + ',' + @S_Reff_Invoice_Date  
   END  
  SET @rnrow = @rnrow + 1  
 END  
   
 --SELECT @S_Tot_Reff_Invoice_No AS S_Reff_Invoice_Nos,REPLACE(CONVERT(NVARCHAR(256),@S_Tot_Reff_Invoice_Date,106),' ','/') AS S_Reff_Invoice_Date  
 --@S_Tot_Reff_Invoice_Date AS S_Reff_Invoice_Date   
   
 --DROPING THE CREATED TEMP TABLES   
 DROP TABLE #TTT  
 DROP TABLE #TRIN  
END  
