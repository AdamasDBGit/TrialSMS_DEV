﻿CREATE PROCEDURE [dbo].[ERP_uspInsertDuePaymentDetails]      
    (      
      @iBrandID VARCHAR(MAX) ,      
      @sStudentID VARCHAR(MAX) ,      
      @iInvoiceHeaderID INT ,      
      @iCentreId INT ,      
      @ReceiptAmount NUMERIC(18, 2) ,      
      @ReceiptTaxAmount NUMERIC(18, 2) ,      
      @iReceiptType INT = 2 ,      
      @sPaymentDetailsXML XML ,      
      @sTransactionCode VARCHAR(MAX) ,      
      @sSource VARCHAR(MAX),    
   -------New Parameter Added for Payment Information-----        
      @nCreditCardNo NUMERIC(18, 0)=Null ,        
      @dCreditCardExpiry VARCHAR(12)=null ,        
      @sCreditCardIssuer VARCHAR(500) =null,        
      @sChequeDDNo VARCHAR(20) =null,        
      @dChequeDDDate VARCHAR(12)=null ,        
      @sBankName VARCHAR(50)=null ,        
      @sBranchName VARCHAR(20)=null ,        
      @sNarration VARCHAR(500)=null,    
      @paymentmodeid int    
    )      
AS      
    SET NOCOUNT ON       
          
    --SET TRANSACTION ISOLATION LEVEL SERIALIZABLE      
         
      
      
       Insert into tEst(Test) Values('uspInsertDuePaymentDetails'+GETDATE())  
  
       
    BEGIN TRY      
      
       BEGIN TRANSACTION      
              
              
      
              
        DECLARE @sReceiptNo VARCHAR(MAX)= NULL      
        DECLARE @iStudentDetailID INT      
        DECLARE @iReceiptHeader INT= 0      
        --DECLARE @paymentmodeid INT      
  DECLARE @rdate DATETIME=GETDATE()      
              
              
              
   --     IF @sSource='Online-SelfService'      
   --SET @paymentmodeid=26       
              
                  
                  
                  
        --IF NOT EXISTS(SELECT * FROM dbo.T_Student_Detail AS TSD      
        --        INNER JOIN dbo.T_Student_Center_Detail AS TSCD ON TSCD.I_Student_Detail_ID = TSD.I_Student_Detail_ID      
        --        INNER JOIN dbo.T_Center_Hierarchy_Name_Details AS TCHND ON TCHND.I_Center_ID=TSCD.I_Centre_Id      
        --        WHERE   TSD.S_Student_ID = @sStudentID AND TSD.I_Status=1 AND TCHND.I_Brand_ID=@iBrandID AND TSCD.I_Status=1)      
        --BEGIN      
              
        --RAISERROR('Invalid Student ID! Please contact your institution.',11,1)       
              
        --END      
              
                 
                  
                  
        --IF EXISTS ( SELECT  *      
        --            FROM    dbo.T_OnlinePayment_Receipt_Mapping AS TOPRM      
        --            WHERE   TOPRM.S_Transaction_No = @sTransactionCode      
        --                    AND TOPRM.S_Crtd_By = @sSource )      
        --    RAISERROR('Duplicate Transaction Code',11,1)       
                  
                  
                  
                       
       
      
        
        SELECT  @iStudentDetailID = TSD.I_Student_Detail_ID      
        FROM    dbo.T_Student_Detail AS TSD      
        INNER JOIN dbo.T_Student_Center_Detail AS TSCD ON TSCD.I_Student_Detail_ID = TSD.I_Student_Detail_ID      
        INNER JOIN dbo.T_Center_Hierarchy_Name_Details AS TCHND ON TCHND.I_Center_ID=TSCD.I_Centre_Id      
        WHERE   TSD.S_Student_ID = @sStudentID AND TSD.I_Status=1 AND TCHND.I_Brand_ID=@iBrandID AND TSCD.I_Status=1      
                                  
                                  
                              
                                      
  EXEC dbo.uspInsertReceiptHeaderFromAPI @sReceiptNo, -- varchar(20)      
   @iInvoiceHeaderID, -- int      
   @rdate, -- datetime      
   @iStudentDetailID, -- int      
   @paymentmodeid, -- int      
   @iCentreId, -- int      
   @ReceiptAmount, -- numeric      
   @ReceiptTaxAmount, -- numeric      
   'N', -- char(1)      
   'rice-group-admin', -- varchar(20)      
   @rdate, -- datetime      
   Null,--@nCreditCardNo, -- varchar(12)      
   Null,--@dCreditCardExpiry, -- varchar(500)      
   Null,--@sCreditCardIssuer, -- varchar(20)      
   Null,--@sChequeDDNo, -- varchar(12)      
   Null,--@dChequeDDDate, -- varchar(50)      
   Null,--@sBankName,    
   Null,--@sBranchName,    
   @iReceiptType,    
   @iBrandID,    
   Null,--@sNarration,     
   @sPaymentDetailsXML,     
   @iReceiptHeader OUTPUT      
                                                  
                                                  
            PRINT @iReceiptHeader      
      
   IF(@iReceiptHeader>0)      
   BEGIN      
      
    update SelfService.T_Online_Payment_Master set ReceiptHeaderID=@iReceiptHeader,ReceiptDate=@rdate      
    where      
    TransactionNo=@sTransactionCode and InvoiceHeaderID=@iInvoiceHeaderID and StatusID=1      
      
   END      
   ELSE      
   BEGIN      
      
    RAISERROR('Receipt could not be created',11,1)      
      
   END      
      
   select @iReceiptHeader as ReceiptHeaderID    
      --select 1 as ReceiptHeaderID    
   Insert into tEst(Test) Values('uspInsertDuePaymentDetails')  
         
        -- DECLARE @ErrorMessage NVARCHAR(4000);  
        --DECLARE @ErrorSeverity INT;  
        --DECLARE @ErrorState INT;  
  
        --SELECT  
        --    @ErrorMessage = ERROR_MESSAGE(),  
        --    @ErrorSeverity = ERROR_SEVERITY(),  
        --    @ErrorState = ERROR_STATE();  
        --INSERT INTO ERP_ErrorLogTable (ErrorMessage, ErrorSeverity, ErrorState, ErrorProcedure)  
        --VALUES (@ErrorMessage, @ErrorSeverity, @ErrorState, 'ERP_uspInsertDuePaymentDetails_1');            
     
        COMMIT TRANSACTION      
              
        --EXEC dbo.uspSendSMSForOnlinePayments @iBrandID = @iBrandID, -- int      
        --    @sTransactionNo = @sTransactionCode -- varchar(max)       
              
    END TRY      
    BEGIN CATCH      
      
 --Error occurred:   
        DECLARE @ErrorMessage NVARCHAR(4000);  
        DECLARE @ErrorSeverity INT;  
        DECLARE @ErrorState INT;  
  
        SELECT  
            @ErrorMessage = ERROR_MESSAGE(),  
            @ErrorSeverity = ERROR_SEVERITY(),  
            @ErrorState = ERROR_STATE();  
        --INSERT INTO ERP_ErrorLogTable (ErrorMessage, ErrorSeverity, ErrorState, ErrorProcedure)  
        --VALUES (@ErrorMessage, @ErrorSeverity, @ErrorState, 'ERP_uspInsertDuePaymentDetails');  
        ROLLBACK TRANSACTION          
        DECLARE @ErrMsg NVARCHAR(4000) ,      
        @ErrSeverity INT          
        SELECT  @ErrMsg = ERROR_MESSAGE() ,      
                @ErrSeverity = ERROR_SEVERITY()    
    Select @ErrMsg  as ErrorMessage   
          
       RAISERROR(@ErrMsg, @ErrSeverity, 1)       
      
    END CATCH      