﻿CREATE Proc USP_Stud_InstallmentWise_InvNo_Generate(@brandID int,@SessionID Int,@type varchar(10),  
@Inv_No_Out Varchar(100) OUTPUT)          
as          
begin          
--DECLARE @InvDt Date,@brandID int=110,@SessionID Int=1   
--Declare @inv varchar(100)  
--EXEC USP_Stud_TempInvNo_Generate 1,1,'INV',@Inv_No_Out=@inv OUTPUT  
--Select @inv  
Declare @InvGenNumber Varchar(12)        
        
Declare @IncrementPart int        
--SET @InvDt = Convert(Date,Getdate())        
Declare @YearPart Varchar(10)        
DECLARE @CurrentDate DATE = GETDATE();        
DECLARE @FinancialYearStart DATE;        
        
-- Determine the start date of the financial year based on your organization's fiscal year definition        
IF MONTH(@CurrentDate) >= 4        
    SET @FinancialYearStart = CONVERT(DATE, CONVERT(VARCHAR(4), YEAR(@CurrentDate)) + '-04-01');        
ELSE        
    SET @FinancialYearStart = CONVERT(DATE, CONVERT(VARCHAR(4), YEAR(@CurrentDate) - 1) + '-04-01');        
        
-- Fetch the current financial year        
SET @YearPart=(SELECT         
    Concat(Cast(YEAR(@FinancialYearStart) as Varchar(4)) ,'-',        
    Cast(YEAR(DATEADD(YEAR, 1, @FinancialYearStart)) as Varchar(4))) )        
          
If NOT Exists(select 1 from T_ERP_InvGenerateRepository         
where I_Brand_ID=@brandID and I_School_Session_ID=@SessionID  and Type='INV'    
and InstallmentwiseTempInv is Not Null)          
Begin          
Update  T_ERP_InvGenerateRepository Set InstallmentwiseTempInv=0    
Where     
I_Brand_ID=@brandID and I_School_Session_ID=@SessionID and Type=@type    
End        
Set @InvGenNumber=(select   dbo.GenerateInstallmentwise_InvoiceNumber(@brandID,@SessionID))        
--select @InvGenNumber        
select @Inv_No_Out=@InvGenNumber          
SET @IncrementPart =(select top 1 InstallmentwiseTempInv+1 from T_ERP_InvGenerateRepository         
where I_Brand_ID=@brandID and I_School_Session_ID=@SessionID and Type=@type)        
        
Update T_ERP_InvGenerateRepository set InstallmentwiseTempInv=@IncrementPart       
      
where I_Brand_ID=@brandID and I_School_Session_ID=@SessionID and Type=@type         
--Commit Tran          
end  