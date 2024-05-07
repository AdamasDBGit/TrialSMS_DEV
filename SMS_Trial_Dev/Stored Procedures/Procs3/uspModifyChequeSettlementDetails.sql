CREATE PROCEDURE [dbo].[uspModifyChequeSettlementDetails]  --[dbo].[uspModifyChequeSettlementDetails] '<Root><StudentCheque I_Student_ID="485" I_Cheque_No="379269" I_Deposite_Date="12/12/2012 12:00:00 AM" I_BankName="1" I_Receipt_Header_ID="1259937" /><StudentCheque I_Student_ID="486" I_Cheque_No="530969" I_Deposite_Date="12/12/2012 12:00:00 AM" I_BankName="1" I_Receipt_Header_ID="1259938" /></Root>' 
(  
  
 @sChequeXML xml 
 )  
  
AS  
BEGIN  
 SET NOCOUNT OFF  
    BEGIN TRY   
        BEGIN TRANSACTION 
        			
        CREATE TABLE #temp1
            (
              I_Student_ID INT ,
              S_Cheque_No VARCHAR(50) ,
              Dt_Deposite_Date DATETIME ,
              S_BankName VARCHAR(500) ,
              I_Receipt_Header_ID INT          
              )
				
        INSERT  INTO #temp1
                SELECT  T.c.value('@I_Student_ID', 'INT') ,
                        T.c.value('@I_Cheque_No', 'VARCHAR(50)') ,
                        T.c.value('@I_Deposite_Date', 'datetime') ,
                        T.c.value('@I_BankName', 'VARCHAR(500)') ,                      
                        T.c.value('@I_Receipt_Header_ID', 'int') 
                FROM    @sChequeXML.nodes('/Root/StudentCheque') T ( c )
                
                
                
				INSERT INTO dbo.T_Receipt_Header_Deposit_Audit
				SELECT TRH.*,GETDATE() FROM dbo.T_Receipt_Header AS TRH
				INNER JOIN #temp1 AS T1 ON T1.I_Receipt_Header_ID = TRH.I_Receipt_Header_ID
				WHERE
				TRH.Dt_Deposit_Date IS NOT NULL AND TRH.Bank_Account_Name IS NOT NULL
				AND
				( 
				(MONTH(TRH.Dt_Deposit_Date)<>MONTH(T1.Dt_Deposite_Date) AND YEAR(TRH.Dt_Deposit_Date)<>YEAR(T1.Dt_Deposite_Date)) 
				OR
				(MONTH(TRH.Dt_Deposit_Date)=MONTH(T1.Dt_Deposite_Date) AND YEAR(TRH.Dt_Deposit_Date)<>YEAR(T1.Dt_Deposite_Date))
				OR
				(MONTH(TRH.Dt_Deposit_Date)<>MONTH(T1.Dt_Deposite_Date) AND YEAR(TRH.Dt_Deposit_Date)=YEAR(T1.Dt_Deposite_Date)) 
				)      
				
				
				
                UPDATE dbo.T_Receipt_Header SET Dt_Deposit_Date = t.Dt_Deposite_Date ,Bank_Account_Name= t.S_BankName 
                FROM dbo.T_Receipt_Header AS TRH INNER JOIN #temp1 AS T ON TRH.I_Receipt_Header_ID = T.I_Receipt_Header_ID
                WHERE TRH.I_Status=1
                 
				DROP TABLE #temp1 
                
                COMMIT TRANSACTION
      
    END TRY      
    BEGIN CATCH      
        ROLLBACK TRANSACTION  
        DECLARE @ErrMsg NVARCHAR(4000) ,
            @ErrSeverity INT      
        SELECT  @ErrMsg = ERROR_MESSAGE() ,
                @ErrSeverity = ERROR_SEVERITY()      
      
        RAISERROR(@ErrMsg, @ErrSeverity, 1)      
    END CATCH
    END
