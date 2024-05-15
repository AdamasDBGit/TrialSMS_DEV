--exec [dbo].[USP_ERP_Dashboard_Loading] 107,35  
CREATE Proc [dbo].[USP_ERP_Dashboard_Loading](    
@brandID int,@sessionID int =Null    
)    
As     
Begin    
-------------Show Date Time---------    
DECLARE @currentDateTime DATETIME = GETDATE();      
DECLARE @currentDate DATE = CAST(@currentDateTime AS DATE);      
DECLARE @currentTime TIME(0) = CAST(@currentDateTime AS TIME);      
      
SELECT Convert(varchar(20),@currentDate) AS CurrentDate, CONVERT(varchar(10), @currentTime) AS CurrentTime;     
    
---------Todays Student Present    
Declare @TotalStudentCount int,@PresentStudent_Count int        
        
select @TotalStudentCount= COUNT(Distinct I_Student_Detail_ID)         
from T_Student_Class_Section where I_Status=1         
and I_Brand_ID=@brandID and (I_School_Session_ID=@sessionID  or @sessionID is null)      
--Select @TotalStudentCount        
        
select @PresentStudent_Count= COUNT(a.I_Student_Detail_ID)  from T_ERP_Attendance_Entry_Detail  a      
Inner Join T_Student_Class_Section b on a.I_Student_Detail_ID=b.I_Student_Detail_ID      
where convert(date,a.Dt_CreatedAt) =CONVERT(Date,getdate()) and a.I_IsPresent=1        
and b.I_Brand_ID=@brandID      
Select @PresentStudent_Count as Today_Present,@TotalStudentCount as TotalStudentCount    
    
-----Faculty Count Today------------------------------    
Declare @TotalfacultyCount int,@FacultyPresent_Today int      
Select @TotalfacultyCount= COUNT(I_Faculty_Master_ID)       
from T_Faculty_Master where I_Brand_ID=@BrandID      
and I_Status=1      
--Select @TotalfacultyCount      
      
select @FacultyPresent_Today= COUNT(Distinct a.I_Faculty_Master_ID)       
from T_ERP_Attendance_Entry_Header a      
Inner Join T_Faculty_Master f On a.I_Faculty_Master_ID=f.I_Faculty_Master_ID      
where CONVERT(date,dt_date)=Convert(date,GETDATE())      
and f.I_Brand_ID=@BrandID      
      
Select @TotalfacultyCount as Total_Faculty,@FacultyPresent_Today as Today_Present_faculty     
    
--------Student Total Bus Avail------------    
Declare @StudentTotalBusAvail int    
    
select @StudentTotalBusAvail= COUNT(distinct STH.I_Student_Detail_ID)     
from T_Student_Transport_History STH    
Inner Join T_BusRoute_Master BM on STH.I_Route_ID=BM.I_Route_ID    
Inner Join T_Route_Transport_Map RTM on RTM.I_PickupPoint_ID=STH.I_PickupPoint_ID    
Inner Join T_Student_Class_Section SCS on SCS.I_Student_Detail_ID=STH.I_Student_Detail_ID    
where BM.I_Status=1 and RTM.I_Status=1 and SCS.I_School_Session_ID=@sessionID     
and SCS.I_Status=1    
and SCS.I_Brand_ID=@brandID    
    
Select @TotalStudentCount as TotalStudentBusTravel,@StudentTotalBusAvail as Bustravelcount    
    
--------Total Class VS Class attendance done----    
Declare @TotalClass int     
Select @TotalClass= COUNT(I_Class_ID) from T_Class where I_Brand_ID=@brandID and I_Status=1    
Declare @Classattendencecount Int     
select @Classattendencecount =count(distinct RSH.I_Routine_Structure_Header_ID)    
from T_ERP_Routine_Structure_Header RSH     
Inner Join T_ERP_Routine_Structure_Detail RSD     
on RSH.I_Routine_Structure_Header_ID=RSD.I_Routine_Structure_Header_ID    
Inner Join T_Week_Day_Master WDM on WDM.I_Day_ID=RSD.I_Day_ID      
Inner Join T_ERP_Student_Class_Routine SCR     
on SCR.I_Routine_Structure_Detail_ID=RSD.I_Routine_Structure_Detail_ID    
Inner Join T_ERP_Attendance_Entry_Header AEH     
on AEH.I_Student_Class_Routine_ID=SCR.I_Student_Class_Routine_ID    
Inner Join T_School_Academic_Session_Master SM on SM.I_School_Session_ID=RSH.I_School_Session_ID    
where     
--I_Class_ID=13 and    
RSH.I_School_Session_ID=@sessionID and SM.I_Brand_ID=@brandID    
--and WDM.S_Day_Name=DATENAME(WEEKDAY, GETDATE())      
and convert(date,AEH.Dt_Date)=convert(date,GETDATE())    
Select @TotalClass as Total_Class ,@Classattendencecount as classattendanceCount     
  
exec USP_ERP_Dash_AdmissionStatus @sessionID,@brandID  
EXEC USP_ERP_Dash_FacultyUnavailability @brandID  
EXEC USP_ERP_Dash_Fee_Status @brandID,@sessionID  
End