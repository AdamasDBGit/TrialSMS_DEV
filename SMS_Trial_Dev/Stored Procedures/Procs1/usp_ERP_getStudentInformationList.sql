-- =============================================
-- Author:		Parichoy Nandi
-- Create date: 4th Jan 2024
-- Description:	to get the details of student info list
-- exec [usp_ERP_getStudentInformationList] 107, 2, 1, 15, null, null, '24', null, 500, 0, 0, 'asc', null
-- =============================================

CREATE PROCEDURE [dbo].[usp_ERP_getStudentInformationList]
	-- Add the parameters for the stored procedure here
	@brandid int,
	@Session int,
	@SchoolGroup int,
	@class int,
	@section int = null,
	@stream int = null,
	@StudentID varchar(max) = null,
	@StudentName varchar(max) = null,
	@Limit INT,    
    @Offset INT,    
    @SortCol INT,    
    @SortDir varchar(10),    
    @Search varchar(max) = NULL   	
AS
BEGIN	
	SET NOCOUNT ON;

	declare @TotalRecords int, @FilteredRecords int   
	
	-- start
	SELECT @TotalRecords = COUNT(*)    
	 from [SMS].[dbo].[T_Student_Detail] as SD
	 join [SMS].[dbo].[T_Student_Class_Section] as SCS on SD.I_Student_Detail_ID = SCS.I_Student_Detail_ID 
	  --and SD.S_Student_ID= SCS.S_Student_ID
	  inner join [SMS].[dbo].[T_School_Group_Class]as SGC 
	  on SCS.I_School_Group_Class_ID = SGC.I_School_Group_Class_ID
	  inner join [SMS].[dbo].[T_School_Group] as SG on SGC.I_School_Group_ID = SG.I_School_Group_ID
	  inner join [SMS].[dbo].[T_Class] as TC on TC.I_Class_ID = SGC.I_Class_ID 
	  --inner join [SMS].[dbo].[T_ERP_Enquiry_Regn_Guardian_Master] as ERGM on ERGM.I_Enquiry_Regn_ID = SD.I_Enquiry_Regn_ID
	  --inner join [SMS].[dbo].[T_Enquiry_Regn_Detail] as ERD on ERD.I_Enquiry_Regn_ID = SD.I_Enquiry_Regn_ID
	  where SCS.I_Brand_ID = @brandid and
	  SGC.I_School_Group_ID= @SchoolGroup --OR @SchoolGroup IS NULL
	  and
	  SGC.I_Class_ID= @class --OR @class IS NULL 
	  and(
	  SCS.I_Section_ID = @section OR @section IS NULL) and
	  (SCS.I_Stream_ID = @stream OR @stream IS NULL) and 
	  SCS.I_School_Session_ID =@Session --OR @Session IS NULL 
	  and 
	  SD.I_Status=1	  
    --end    



	-- start  
  SELECT @FilteredRecords = COUNT(*)   
  FROM(  
	  select 	  
	  SD.I_Student_Detail_ID  
	  from [SMS].[dbo].[T_Student_Detail] as SD
	  join [SMS].[dbo].[T_Student_Class_Section] as SCS on SD.I_Student_Detail_ID = SCS.I_Student_Detail_ID 
	  --and SD.S_Student_ID= SCS.S_Student_ID
	  inner join [SMS].[dbo].[T_School_Group_Class]as SGC 
	  on SCS.I_School_Group_Class_ID = SGC.I_School_Group_Class_ID
	  inner join [SMS].[dbo].[T_School_Group] as SG on SGC.I_School_Group_ID = SG.I_School_Group_ID
	  inner join [SMS].[dbo].[T_Class] as TC on TC.I_Class_ID = SGC.I_Class_ID 
	  --inner join [SMS].[dbo].[T_ERP_Enquiry_Regn_Guardian_Master] as ERGM on ERGM.I_Enquiry_Regn_ID = SD.I_Enquiry_Regn_ID
	  --inner join [SMS].[dbo].[T_Enquiry_Regn_Detail] as ERD on ERD.I_Enquiry_Regn_ID = SD.I_Enquiry_Regn_ID
	  where SCS.I_Brand_ID = @brandid and
	  SGC.I_School_Group_ID= @SchoolGroup --OR @SchoolGroup IS NULL
	  and
	  SGC.I_Class_ID= @class --OR @class IS NULL 
	  and(
	  SCS.I_Section_ID = @section OR @section IS NULL) and
	  (SCS.I_Stream_ID = @stream OR @stream IS NULL) and 
	  SCS.I_School_Session_ID =@Session --OR @Session IS NULL 
	  and 
	  SD.I_Status=1
	  AND (        
			 CONCAT(COALESCE(SD.S_First_Name+' ', ''), COALESCE(SD.S_Middle_Name+' ', ''), COALESCE(SD.S_Last_Name, '')) LIKE '%' + @StudentName + '%'       
			 OR @StudentName IS NULL        
			)
	  AND (@StudentID IS NULL OR SD.S_Student_ID LIKE '%' + @StudentID + '%')
	  AND (    
		  @Search IS NULL     
		  OR SD.S_Student_ID LIKE '%' + @Search + '%'     
		  OR CONCAT(COALESCE(SD.S_First_Name+' ', ''), COALESCE(SD.S_Middle_Name+' ', ''), COALESCE(SD.S_Last_Name, '')) LIKE '%' + @Search + '%'     
		  OR SCS.S_Class_Roll_No LIKE '%' + @Search + '%'     
		  OR SD.S_Mobile_No LIKE '%' + @Search + '%'     	              
	   ) 
  ) AS CountedRecords;  





	  select 
	  SD.S_Student_ID as StudentID,
	  ERD.S_Enquiry_No as EnquiryNo,
	  SD.I_Student_Detail_ID as StudentDetailID,
	  CONCAT(COALESCE(SD.S_First_Name+' ', ''), COALESCE(SD.S_Middle_Name+' ', ''), COALESCE(SD.S_Last_Name, '')) AS FullName,  
	  TC.S_Class_Name as Class,
	  SCS.S_Class_Roll_No as RollNo,
	  SD.S_Mobile_No as MobileNo,
	  --CONCAT(ISNULL(ERGM.S_First_Name, ''), ' ', ISNULL(ERGM.S_Middile_Name, ''), ' ', ISNULL(ERGM.S_Last_Name, '')) AS GuardianName,
	  SD.I_Status as StudentStatus,
	  @TotalRecords AS TotalRecords,  
	  @FilteredRecords AS FilteredRecords
	  --SG.S_School_Group_Name
	  from [SMS].[dbo].[T_Student_Detail] as SD
	  
	  join [SMS].[dbo].[T_Student_Class_Section] as SCS on SD.I_Student_Detail_ID = SCS.I_Student_Detail_ID 
	  --and SD.S_Student_ID= SCS.S_Student_ID
	  inner join [SMS].[dbo].[T_School_Group_Class]as SGC 
	  on SCS.I_School_Group_Class_ID = SGC.I_School_Group_Class_ID
	  inner join [SMS].[dbo].[T_School_Group] as SG on SGC.I_School_Group_ID = SG.I_School_Group_ID
	  inner join [SMS].[dbo].[T_Class] as TC on TC.I_Class_ID = SGC.I_Class_ID 
	  --inner join [SMS].[dbo].[T_ERP_Enquiry_Regn_Guardian_Master] as ERGM on ERGM.I_Enquiry_Regn_ID = SD.I_Enquiry_Regn_ID
	  Left join [SMS].[dbo].[T_Enquiry_Regn_Detail] as ERD on ERD.I_Enquiry_Regn_ID = SD.I_Enquiry_Regn_ID
	  where SCS.I_Brand_ID = @brandid and
	  SGC.I_School_Group_ID= @SchoolGroup --OR @SchoolGroup IS NULL
	  and
	  SGC.I_Class_ID= @class --OR @class IS NULL 
	  and(
	  SCS.I_Section_ID = @section OR @section IS NULL) and
	  (SCS.I_Stream_ID = @stream OR @stream IS NULL) and 
	  SCS.I_School_Session_ID =@Session --OR @Session IS NULL 
	  and 
	  SD.I_Status=1
	  AND (        
			 CONCAT(COALESCE(SD.S_First_Name+' ', ''), COALESCE(SD.S_Middle_Name+' ', ''), COALESCE(SD.S_Last_Name, '')) LIKE '%' + @StudentName + '%'       
			 OR @StudentName IS NULL        
			)
	  AND (@StudentID IS NULL OR SD.S_Student_ID LIKE '%' + @StudentID + '%')
	  AND (    
		  @Search IS NULL     
		  OR SD.S_Student_ID LIKE '%' + @Search + '%'     
		  OR CONCAT(COALESCE(SD.S_First_Name+' ', ''), COALESCE(SD.S_Middle_Name+' ', ''), COALESCE(SD.S_Last_Name, '')) LIKE '%' + @Search + '%'     
		  OR SCS.S_Class_Roll_No LIKE '%' + @Search + '%'     
		  OR SD.S_Mobile_No LIKE '%' + @Search + '%'     	              
	   ) 


		  order by     
		 (     
		  case when (@SortCol = 0 and @SortDir = 'asc') then SD.S_Student_ID end    
		 )asc,    
		 (    
		  case when (@SortCol = 0 and @SortDir = 'desc') then SD.S_Student_ID end    
		 ) desc,    
		 (    
		  case when (@SortCol = 1 and @SortDir = 'asc') then CONCAT(COALESCE(SD.S_First_Name+' ', ''), COALESCE(SD.S_Middle_Name+' ', ''), COALESCE(SD.S_Last_Name, '')) end     
		 ) asc,    
		 (    
		  case when (@SortCol = 1 and @SortDir = 'desc') then CONCAT(COALESCE(SD.S_First_Name+' ', ''), COALESCE(SD.S_Middle_Name+' ', ''), COALESCE(SD.S_Last_Name, '')) end    
		 ) desc,      
		 (    
		  case when (@SortCol = 3 and @SortDir = 'asc') then SCS.S_Class_Roll_No end    
		 ) asc,    
		 (    
		  case when (@SortCol = 3 and @SortDir = 'desc') then SCS.S_Class_Roll_No end    
		 ) desc,    
		 (    
		  case when (@SortCol = 4 and @SortDir = 'asc') then SD.S_Mobile_No end    
		 ) asc,    
		 (    
		  case when (@SortCol = 4 and @SortDir = 'desc') then SD.S_Mobile_No end     
		 ) desc    
 

		  OFFSET @Offset ROWS    
		  FETCH NEXT @Limit ROWS ONLY;  
END
