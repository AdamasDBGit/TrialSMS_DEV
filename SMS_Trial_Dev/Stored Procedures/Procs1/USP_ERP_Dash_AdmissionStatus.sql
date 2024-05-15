--EXEC [USP_ERP_Dash_AdmissionStatus] 35,107  
CREATE Proc [dbo].[USP_ERP_Dash_AdmissionStatus](    
@sessionID int=Null,    
@brandID int    
)    
As     
Begin    
Declare @Sdate date, @EDate date    
--SET @sessionID=35    
--SET @brandID=107    
Select @Sdate= Convert(date,Dt_Session_Start_Date),@EDate=convert(date,Dt_Session_End_Date)    
from T_School_Academic_Session_Master     
where I_School_Session_ID=@sessionID     
and I_Brand_ID=@brandID    
--Select @Sdate,@EDate    
-----For Pre Enquiry--------------    
SELECT    
    MONTH(Dt_Crtd_On) AS MonthNumber,    
    DATENAME(MONTH, Dt_Crtd_On) AS MonthName,    
    COUNT(I_Enquiry_Regn_ID) AS RecordCount    
 Into #Temp_Pre_Enq    
FROM    
    T_Enquiry_Regn_Detail where I_ERP_Entry=1    
 and I_Enquiry_Status_Code is null     
And     
    convert(date,Dt_Crtd_On) >= @Sdate    
    AND convert(date,Dt_Crtd_On) < @EDate    
GROUP BY    
    MONTH(Dt_Crtd_On), DATENAME(MONTH, Dt_Crtd_On)    
ORDER BY    
    MonthNumber;    
 ------For Enquiry--------------    
 SELECT    
    MONTH(Dt_Crtd_On) AS MonthNumber,    
    DATENAME(MONTH, Dt_Crtd_On) AS MonthName,    
    COUNT(I_Enquiry_Regn_ID) AS RecordCount    
  Into #Temp_Enq    
FROM    
    T_Enquiry_Regn_Detail where I_ERP_Entry=1    
 and I_Enquiry_Status_Code =1    
And     
    convert(date,Dt_Crtd_On) >= @Sdate    
    AND convert(date,Dt_Crtd_On) < @EDate    
GROUP BY    
    MONTH(Dt_Crtd_On), DATENAME(MONTH, Dt_Crtd_On)    
ORDER BY    
    MonthNumber;    
 -----For Admission -------    
 SELECT    
    MONTH(Dt_Crtd_On) AS MonthNumber,    
    DATENAME(MONTH, Dt_Crtd_On) AS MonthName,    
    COUNT(I_Enquiry_Regn_ID) AS RecordCount    
 Into #Temp_Adm    
FROM    
    T_Enquiry_Regn_Detail where I_ERP_Entry=1    
 and I_Enquiry_Status_Code =3    
And     
    convert(date,Dt_Crtd_On) >= @Sdate    
    AND convert(date,Dt_Crtd_On) < @EDate    
GROUP BY    
    MONTH(Dt_Crtd_On), DATENAME(MONTH, Dt_Crtd_On)    
ORDER BY    
    MonthNumber;    
 ---------------------------    
 ;WITH Months AS (    
    SELECT DATEADD(MONTH, number, '2023-04-01') AS MonthStart    
    FROM master..spt_values    
    WHERE type = 'P'     
    AND number BETWEEN 0 AND 11 -- Months from April to March    
)    
select Convert(Varchar,(FORMAT(Months.MonthStart, 'MMMM'))) AS MonthName    
Into #AllMonth    
    
from Months    
    
 Select SUBSTRING(am.MonthName,1,3) as Month_Name,a.RecordCount as Pre_Enq_Count,    
 b.RecordCount As Enq_Count,c.RecordCount As Adm_Count    
     
 from #AllMonth am    
 Left Join #Temp_Pre_Enq a on a.MonthName=am.MonthName    
 Left Join #Temp_Enq b on a.MonthName=b.MonthName    
 Left Join #Temp_Adm c on c.MonthName=a.MonthName    
     
    
 drop Table #Temp_Pre_Enq    
 drop table #Temp_Adm    
 DROP TABLE #Temp_Enq    
 drop table #AllMonth    
 End 