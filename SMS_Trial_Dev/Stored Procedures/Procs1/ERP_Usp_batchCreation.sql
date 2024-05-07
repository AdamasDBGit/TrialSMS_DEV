﻿CREATE Proc [dbo].[ERP_Usp_batchCreation](    
    @I_Student_Detail_ID bigint   
)    
As     
begin    
DECLARE @CourseID_out int     
DECLARE @Batchid_out int     
DECLARE @centerID_out int      
         Declare @EnquiryID  int    
    
   --, @I_Student_Detail_ID int    
   --SET @I_Student_Detail_ID=120389    
   SET @EnquiryID =(    
   Select top 1 I_Enquiry_Regn_ID from T_Student_Detail     
   where I_Student_Detail_ID=@I_Student_Detail_ID    
   )    
   Declare @classID int,    
        @sessionID int,    
        @streamID int,    
        @sectionID int,    
        @brandID int,    
        @className Varchar(50),    
        @SessionYear Varchar(5)    
    
-- Select @classID=i_clas from T_Student_Class_Section    
--select * from T_Student_Class_Section where I_Student_Detail_ID=120389    
    
SET @classID =    
(    
    Select Top 1    
        SGC.I_Class_ID    
    from T_School_Group_Class SGC    
        Inner Join T_Student_Class_Section SCS    
            on SCS.I_School_Group_Class_ID = SGC.I_School_Group_Class_ID    
    where I_Student_Detail_ID = @I_Student_Detail_ID    
)    
    
SET @className =    
(    
    Select Top 1 S_Class_Name from T_Class where I_Class_ID = @classID    
)    
    
SET @brandID =    
(    
    select top 1    
        I_Brand_ID    
    from T_Student_Class_Section    
    where I_Student_Detail_ID = @I_Student_Detail_ID    
)    
    
SET @streamID =    
(    
    select top 1    
        I_Stream_ID    
    from T_Student_Class_Section    
    where I_Student_Detail_ID = @I_Student_Detail_ID    
)    
    
SET @sessionID =    
(    
    select top 1    
        I_School_Session_ID    
    from T_Student_Class_Section    
    where I_Student_Detail_ID = @I_Student_Detail_ID    
)    
    
SET @SessionYear =    
(    
    Select YEAR(Dt_Session_Start_Date) AS CurrentYear    
    from T_School_Academic_Session_Master    
    where I_School_Session_ID = @sessionID    
)    
    
SET @sectionID =    
(    
    select top 1    
        I_Section_ID    
    from T_Student_Class_Section    
    where I_Student_Detail_ID = @I_Student_Detail_ID    
)    
Declare @courseID int,    
        @coursename varchar(100)    
SET @courseID =    
(    
    select top 1    
        I_Course_ID    
    from T_Course_Group_Class_Mapping    
    where I_Brand_ID = @brandID    
          and I_Class_ID = @classID    
          and I_School_Session_ID = @sessionID    
          and (    
                  I_Stream_ID = @streamID    
                  or I_Stream_ID is null    
              )    
)    
--Select @courseID,    
--       @streamID,    
--       @sectionID    
If @streamID is not null    
Begin    
    Declare @Streamname Varchar(50)    
    SET @Streamname =    
    (    
        Select top 1 S_Stream from T_Stream where I_Stream_ID = @streamID    
    )    
End    
Else    
Begin    
    SET @Streamname = ''    
End    
    
SET @coursename =    
(    
    Select top 1    
        S_Course_Name    
    from T_Course_Master    
    where I_Course_ID = @courseID    
)    
--Select @coursename    
    
Declare @sectionname varchar(10)    
SET @sectionname =    
(    
    Select S_Section_Name from T_Section where I_Section_ID = @sectionID    
)    
    
--Select @className,    
--       @sectionname,    
--       @SessionYear,    
--       @Streamname    
Declare @batchName Varchar(100),    
        @feeScheduleID int 
SET @batchName =    
(    
    Select CONCAT(    
                     Ltrim(Replace(@className, 'Class', '')),    
                     Left(@Streamname, 3),    
                     ' ',    
                     @sectionname,    
                     ' ',    
                     '(',    
                     @SessionYear,    
                     ')'    
                 )    
)    
--Select @batchName    
Declare @BatchID Int    
If Exists    
(    
    select 1    
    from T_Course_Group_Class_Mapping    
    where I_Course_ID = @courseID    
)    
    SET @BatchID =    
(    
    select Top 1    
        I_Batch_ID    
    from T_Course_Group_Class_Mapping    
    where I_Course_ID = @courseID    
)    
-------FY Strat Date    
DECLARE @CurrentDate DATETIME = GETDATE();    
    
-- Calculate Financial Year Start Date    
DECLARE @FinancialYearStart DATETIME;    
SET @FinancialYearStart = DATEFROMPARTS(   CASE    
                                               WHEN MONTH(@CurrentDate) >= 4 THEN    
          YEAR(@CurrentDate)    
                                               ELSE    
                                                   YEAR(@CurrentDate) - 1    
                                           END,    
                                           4,    
                                           1    
                                       );    
    
-- Calculate Financial Year End Date    
DECLARE @FinancialYearEnd DATETIME;    
SET @FinancialYearEnd = DATEADD(DAY,    
                                -1,    
                                DATEFROMPARTS(   CASE    
                                                     WHEN MONTH(@CurrentDate) >= 4 THEN    
                                                         YEAR(@CurrentDate) + 1    
                                                     ELSE    
                                                         YEAR(@CurrentDate)    
                                                 END,    
                                                 4,    
                                                 1    
                                             )    
                               );    
    
-- Display the results    
--SELECT @FinancialYearStart AS FinancialYearStartDate,    
--       @FinancialYearEnd AS FinancialYearEndDate;    
    
--------------    
If @BatchID IS Null    
Begin    
    Insert Into T_Student_Batch_Master    
    (    
        S_Batch_Code,    
        I_Course_ID,    
        I_Delivery_Pattern_ID,    
        Dt_BatchStartDate,    
        I_Status,    
        Dt_Course_Expected_End_Date,    
        S_Crtd_By,    
        Dt_Crtd_On,    
        b_IsHOBatch,    
        S_Batch_Name,    
        b_IsApproved,    
        I_Admission_GraceDays,    
        b_IsCorporateBatch,    
        I_Latefee_Grace_Day,    
        Admission_AfterStartDate    
    )    
    Select @batchName,    
           @courseID,    
           1,    
           @FinancialYearStart,    
           2,    
           @FinancialYearEnd,    
           'dba',    
           GETDATE(),    
           0,    
           @batchName,    
           1,    
           365,    
           0,    
           0,    
           0    
    
    SET @BatchID = SCOPE_IDENTITY()    
    Update T_Course_Group_Class_Mapping    
    set I_Batch_ID = @BatchID    
    where I_Course_ID = @courseID    
End    
Else    
Begin    
    SET @BatchID =    
    (    
        select Top 1    
            I_Batch_ID    
        from T_Course_Group_Class_Mapping    
        where I_Course_ID = @courseID    
    )    
End    
--Select @BatchID    
    --11821    
    Declare @iCenterID int    
    SELECT TOP 1                
                @iCenterID = I_Destination_Center_ID                
        FROM    dbo.T_Student_Registration_Details                
        WHERE   I_Enquiry_Regn_ID = @EnquiryID                  
        IF ( @iCenterID IS NULL )                 
            BEGIN                  
                SELECT  @iCenterID = I_Centre_Id                
                FROM    dbo.T_Enquiry_Regn_Detail                
                WHERE   I_Enquiry_Regn_ID = @EnquiryID                  
            END       
  -- Select @centerID_out=@iCenterID,@CourseID_out=@courseID,@Batchid_out=@BatchID    
   select @iCenterID as CenterID,@courseID as CourseID,@BatchID as BatchID,@FinancialYearStart as BatchStartDate    
    
   End 