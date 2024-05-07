﻿CREATE Proc USP_Stud_InvNo_Generate_and_Update(@InvDt Date,@brandID int,@SessionID Int,@type varchar(10),@Inv_No_Out Varchar(12) OUTPUT)    
as    
begin    
--DECLARE @InvDt Date,@brandID int=110,@SessionID Int=1  
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
    
If Not Exists(select 1 from T_ERP_InvGenerateRepository   
where I_Brand_ID=@brandID and I_School_Session_ID=@SessionID and Type=@type)    
Begin    
Insert Into T_ERP_InvGenerateRepository    
(    
  S_Curr_Year    
 ,I_Brand_ID  
 ,I_School_Session_ID  
,I_IncrementID    
,Dtt_Lst_Update 
,Type
)    
values (@YearPart,@brandID,@SessionID,0,GETDATE(),@type)    
End  
Set @InvGenNumber=(select   dbo.GenerateInvoiceNumber(@InvDt,@brandID,@SessionID,@type))  
--select @InvGenNumber  
select @Inv_No_Out=@InvGenNumber    
SET @IncrementPart =(select top 1 I_IncrementID+1 from T_ERP_InvGenerateRepository   
where I_Brand_ID=@brandID and I_School_Session_ID=@SessionID and Type=@type)  
  
Update T_ERP_InvGenerateRepository set I_IncrementID=@IncrementPart ,
Dtt_Lst_Update=getdate()  
where I_Brand_ID=@brandID and I_School_Session_ID=@SessionID and Type=@type   
--Commit Tran    
end