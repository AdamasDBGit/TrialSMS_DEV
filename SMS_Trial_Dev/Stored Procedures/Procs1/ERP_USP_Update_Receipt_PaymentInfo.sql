
CREATE Proc ERP_USP_Update_Receipt_PaymentInfo(
@ReceiptID bigint,
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
As
Begin
If @ReceiptID >0
begin
Update T_Receipt_Header 
set N_CreditCard_No=@nCreditCardNo,
Dt_CreditCard_Expiry=@dCreditCardExpiry,
S_CreditCard_Issuer=@sCreditCardIssuer,
S_ChequeDD_No=@sChequeDDNo,
Dt_ChequeDD_Date=@dChequeDDDate,
S_Bank_Name=@sBankName,
S_Branch_Name=@sBranchName,
S_Narration=@sNarration,
I_PaymentMode_ID=@paymentmodeid
Where I_Receipt_Header_ID=@ReceiptID
End
End