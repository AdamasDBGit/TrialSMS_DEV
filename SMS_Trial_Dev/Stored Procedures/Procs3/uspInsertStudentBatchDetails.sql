﻿          
           
CREATE PROCEDURE [dbo].[uspInsertStudentBatchDetails]
    (
      @sCoursesXMl XML ,
      @sCreatedBy VARCHAR(20) ,
      @dtCreatedDate DATETIME ,
      @bIsFromPromoteBatch BIT = NULL ,
      @iSourceBatchID INT = NULL                
    )
AS
    SET NOCOUNT ON                  
    BEGIN TRY                   
                  
        DECLARE @iUserCount INT                  
        DECLARE @iEnquiryRegnID INT                  
        DECLARE @iCenterId INT                  
        DECLARE @iStudentDetailId INT                  
        DECLARE @iUserId INT                  
        DECLARE @iCourseId INT                  
        DECLARE @iDeliveryPatternId INT                  
        DECLARE @iFeePlanId INT                  
        DECLARE @iCourseCenterDeliveryId INT                  
 --DECLARE @iTimeSlotId int                  
        DECLARE @cIsLumpSum CHAR(18)                  
        DECLARE @sLoginID VARCHAR(50)                   
        DECLARE @AdjPosition SMALLINT ,
            @AdjCount SMALLINT                   
        DECLARE @CourseDetailXML XML                  
        DECLARE @EnquiryXML XML                  
        DECLARE @dtCourseStartDate DATETIME                  
        DECLARE @dtCourseEndDate DATETIME                  
        DECLARE @iCourseDurationDays INT                  
        DECLARE @iBatchId INT                  
        DECLARE @iStudentRollNo INT 
        DECLARE @iFlag INT= 0 --akash 2.8.2018 
		
		DECLARE @SourceBatchID INT=NULL

		

        BEGIN TRANSACTION 
		
		SET @SourceBatchID=@iSourceBatchID
        SET @AdjPosition = 1                  
                   
        SET @EnquiryXML = @sCoursesXMl.query('/Student[position()=sql:variable("@AdjPosition")]')                  
        SELECT  @iStudentDetailId = T.b.value('@I_Student_Detail_ID', 'int')
        FROM    @EnquiryXML.nodes('/Student') T ( b )                  
                   
                   
        SELECT  @iUserCount = MAX(I_Student_Detail_ID)
        FROM    T_Student_Detail                  
        SET @sLoginID = 'Student' + CAST(@iUserCount AS VARCHAR)                  
                   
        IF @bIsFromPromoteBatch IS NULL
            BEGIN                
                SET @bIsFromPromoteBatch = 0                
            END                
                  
        SET @AdjCount = @sCoursesXMl.value('count((Student/Course))', 'int')                  
        WHILE ( @AdjPosition <= @AdjCount )
            BEGIN 
            
                SET @iFlag = 0                 
                SET @CourseDetailXML = @sCoursesXMl.query('/Student/Course[position()=sql:variable("@AdjPosition")]')                  
                SELECT  @iCenterId = T.a.value('@I_Centre_ID', 'int') ,
                        @iBatchId = T.a.value('@I_Batch_ID', 'INT') ,
                        @iCourseId = T.a.value('@I_Course_ID', 'int') ,
                        @iDeliveryPatternId = T.a.value('@I_Delivery_Pattern_ID',
                                                        'int') ,
                        @iFeePlanId = T.a.value('@I_Fee_Plan_ID', 'int') ,                  
     --@iTimeSlotId = T.a.value('@I_Time_Slot_ID','int'),                  
                        @cIsLumpSum = T.a.value('@C_Is_LumpSum', 'char(18)') ,
                        @dtCourseStartDate = T.a.value('@Dt_Course_Start_Date',
                                                       'datetime')
                FROM    @CourseDetailXML.nodes('/Course') T ( a )                  
                     
                SELECT  @iCourseCenterDeliveryId = I_Course_Center_Delivery_ID
                FROM    T_Course_Center_Delivery_FeePlan
                WHERE   I_Course_Fee_Plan_ID = @iFeePlanId
                        AND I_Status <> 0
                        AND I_Course_Center_ID IN (
                        SELECT  I_Course_Center_ID
                        FROM    T_Course_Center_Detail
                        WHERE   I_Centre_Id = @iCenterId
                                AND I_Course_ID = @iCourseId
                                AND I_Status <> 0
                                AND @dtCreatedDate >= ISNULL(Dt_Valid_From,
                                                             @dtCreatedDate)
                                AND @dtCreatedDate <= ISNULL(Dt_Valid_To,
                                                             @dtCreatedDate) )
                        AND I_Course_Delivery_ID IN (
                        SELECT  I_Course_Delivery_ID
                        FROM    T_Course_Delivery_Map
                        WHERE   I_Course_ID = @iCourseId
                                AND I_Delivery_Pattern_ID = @iDeliveryPatternId
                                AND I_Status <> 0 )                  
                        
   --calculate course end date                  
                SELECT  @iCourseDurationDays = ISNULL(N_Course_Duration, 0)
                FROM    T_Course_Delivery_Map CDM ,
                        T_Course_Center_Delivery_FeePlan CDF
                WHERE   CDM.I_Course_Delivery_ID = CDF.I_Course_Delivery_ID
                        AND CDF.I_Course_Center_Delivery_ID = @iCourseCenterDeliveryId
                        AND CDF.I_Status <> 0
                        AND @dtCreatedDate >= ISNULL(CDF.Dt_Valid_From,
                                                     @dtCreatedDate)
                        AND @dtCreatedDate <= ISNULL(CDF.Dt_Valid_To,
                                                     @dtCreatedDate)
                        AND CDM.I_Status <> 0                  
                     
                SET @dtCourseEndDate = DATEADD(dd, @iCourseDurationDays,
                                               @dtCourseStartDate)                  
                  
                 
                   
                IF @bIsFromPromoteBatch = 1
                    BEGIN                
                        IF EXISTS ( SELECT  COUNT(*)
                                    FROM    dbo.T_Student_Batch_Details
                                    WHERE   I_Batch_ID = @iBatchId
                                            AND I_Student_ID = @iStudentDetailId
                                            AND I_Status = 3 )
							BEGIN

								IF(@SourceBatchID=NULL)
								BEGIN

									select @SourceBatchID=I_FromBatch_ID from T_Student_Batch_Details
									WHERE   I_Batch_ID = @iBatchId
										AND I_Student_ID = @iStudentDetailId
										AND I_Status = 3

								END

								UPDATE  dbo.T_Student_Batch_Details
								SET     I_Status = 1 ,
										Dt_Valid_From = @dtCreatedDate ,
										C_Is_LumpSum = @cIsLumpSum
								WHERE   I_Batch_ID = @iBatchId
										AND I_Student_ID = @iStudentDetailId
										AND I_Status = 3
							END
                                     
                        --EXEC LMS.uspInsertStudentBatchDetailsForInterface @iStudentDetailId,@iBatchId,@SourceBatchID            
                                    
                        SELECT  @iStudentRollNo = ISNULL(MAX(ISNULL(TSBD.I_RollNo,
                                                              TSD.I_RollNo)),
                                                         0) + 1
                        FROM    dbo.T_Student_Detail AS TSD
                                INNER JOIN dbo.T_Student_Batch_Details AS TSBD ON TSD.I_Student_Detail_ID = TSBD.I_Student_ID
                        WHERE   I_Batch_ID = @iBatchId
                                AND TSBD.I_Status = 1
                                --AND TSD.I_Status <> 0
                                AND TSBD.I_Student_ID <> @iStudentDetailId
                                
                        UPDATE  dbo.T_Student_Batch_Details
                        SET     I_RollNo = @iStudentRollNo
                        WHERE   I_Student_ID = @iStudentDetailId
                                AND I_Status = 1
                                AND I_Batch_ID = @iBatchId                  
                                  
                                    
                        UPDATE  dbo.T_Student_Detail
                        SET     I_RollNo = @iStudentRollNo
                        WHERE   I_Student_Detail_ID = @iStudentDetailId 
                        
                        IF NOT EXISTS ( SELECT  *
                                        FROM    SMManagement.T_Student_Eligibity_Parent
                                                AS TSEP
                                        WHERE   TSEP.StudentDetailID = @iStudentDetailId
                                                AND TSEP.BatchID = @iBatchId
                                                AND TSEP.CourseID = @iCourseId
                                                AND TSEP.CenterID = @iCenterId
                                                AND TSEP.StatusID = 1 )
                            EXEC SMManagement.uspInsertStudentEligibilitySchedule @StudentDetailID = @iStudentDetailId, -- int
                                @BatchID = @iBatchId, -- int
                                @CourseID = @iCourseId, -- int
                                @CenterID = @iCenterId, -- int
                                @CreatedBy = @sCreatedBy, -- varchar(max)
                                @CreatedDate = @dtCreatedDate -- datetime          
                    END                
                ELSE
                    BEGIN            
                    --      
                        IF ( SELECT COUNT(*)
                             FROM   dbo.T_Student_Batch_Details
                             WHERE  I_Batch_ID = @iBatchId
                                    AND I_Student_ID = @iStudentDetailId
                                    AND I_Status = 3
                           ) > 0
                            BEGIN             
                                UPDATE  dbo.T_Student_Batch_Details
                                SET     I_Status = 1 ,
                                        Dt_Valid_From = @dtCreatedDate ,
                                        C_Is_LumpSum = @cIsLumpSum
                                WHERE   I_Batch_ID = @iBatchId
                                        AND I_Student_ID = @iStudentDetailId
                                        AND I_Status = 3       
                            END      
                        ELSE
                            BEGIN
								--akash 2.8.2018
                                IF ( SELECT COUNT(*)
                                     FROM   dbo.T_Student_Batch_Details
                                     WHERE  I_Batch_ID = @iBatchId
                                            AND I_Student_ID = @iStudentDetailId
                                            AND I_Status = 1
                                   ) = 0
                                    BEGIN 
									--akash 2.8.2018      
                                        INSERT  INTO dbo.T_Student_Batch_Details
                                                ( I_Student_ID ,
                                                  I_Batch_ID ,
                                                  I_Status ,
                                                  Dt_Valid_From ,
                                                  C_Is_LumpSum                  
                                                )
                                        VALUES  ( @iStudentDetailId ,
                                                  @iBatchId ,
                                                  1 ,
                                                  @dtCreatedDate ,
                                                  @cIsLumpSum              
                                                )

										--EXEC LMS.uspInsertStudentBatchDetailsForInterface @iStudentDetailId,@iBatchId,@SourceBatchID
                                                
                                        IF NOT EXISTS ( SELECT
                                                              *
                                                        FROM  SMManagement.T_Student_Eligibity_Parent
                                                              AS TSEP
                                                        WHERE TSEP.StudentDetailID = @iStudentDetailId
                                                              AND TSEP.BatchID = @iBatchId
                                                              AND TSEP.CourseID = @iCourseId
                                                              AND TSEP.CenterID = @iCenterId
                                                              AND TSEP.StatusID = 1 )
                                            EXEC SMManagement.uspInsertStudentEligibilitySchedule @StudentDetailID = @iStudentDetailId, -- int
                                                @BatchID = @iBatchId, -- int
                                                @CourseID = @iCourseId, -- int
                                                @CenterID = @iCenterId, -- int
                                                @CreatedBy = @sCreatedBy, -- varchar(max)
                                                @CreatedDate = @dtCreatedDate -- datetime        
                                        
                                        SET @iFlag = 1        
                                    --akash 2.8.2018    
                                    END
                                    
                                ELSE
                                    BEGIN
                                    
                                        UPDATE  dbo.T_Student_Batch_Details
                                        SET     C_Is_LumpSum = @cIsLumpSum
                                        WHERE   I_Batch_ID = @iBatchId
                                                AND I_Student_ID = @iStudentDetailId
                                                AND I_Status = 1
                                                
                                                
                                        IF NOT EXISTS ( SELECT  *
                                                FROM    SMManagement.T_Student_Eligibity_Parent
                                                        AS TSEP
                                                WHERE   TSEP.StudentDetailID = @iStudentDetailId
                                                        AND TSEP.BatchID = @iBatchId
                                                        AND TSEP.CourseID = @iCourseId
                                                        AND TSEP.CenterID = @iCenterId
                                                        AND TSEP.StatusID = 1 )
                                    EXEC SMManagement.uspInsertStudentEligibilitySchedule @StudentDetailID = @iStudentDetailId, -- int
                                        @BatchID = @iBatchId, -- int
                                        @CourseID = @iCourseId, -- int
                                        @CenterID = @iCenterId, -- int
                                        @CreatedBy = @sCreatedBy, -- varchar(max)
                                        @CreatedDate = @dtCreatedDate -- datetime         
                                    
                                    END
                                    
                                    --akash 2.8.2018                    
                            END     
                                          
                        --akash 2.8.2018                       
                        IF ( @iFlag = 1 )
                            BEGIN 
                        --akash 2.8.2018             
                                SELECT  @iStudentRollNo = ISNULL(MAX(ISNULL(TSBD.I_RollNo,
                                                              TSD.I_RollNo)),
                                                              0) + 1
                                FROM    dbo.T_Student_Detail AS TSD
                                        INNER JOIN dbo.T_Student_Batch_Details
                                        AS TSBD ON TSD.I_Student_Detail_ID = TSBD.I_Student_ID
                                WHERE   I_Batch_ID = @iBatchId
                                        AND TSBD.I_Status = 1
                                        --AND TSD.I_Status <> 0
                                        AND TSBD.I_Student_ID <> @iStudentDetailId
                                        
                                UPDATE  dbo.T_Student_Batch_Details
                                SET     I_RollNo = @iStudentRollNo
                                WHERE   I_Student_ID = @iStudentDetailId
                                        AND I_Status = 1
                                        AND I_Batch_ID = @iBatchId                  
                                    
                                UPDATE  dbo.T_Student_Detail
                                SET     I_RollNo = @iStudentRollNo
                                WHERE   I_Student_Detail_ID = @iStudentDetailId 
                                
                                
                        --akash 2.8.2018
                            END
                        --akash 2.8.2018           
                    END                  
                  
                IF ( @iSourceBatchID IS NOT NULL )
                    BEGIN              
                        UPDATE  dbo.T_Student_Batch_Details
                        SET     I_Status = 0
                        WHERE   I_Batch_ID = @iSourceBatchID
                                AND I_Student_ID = @iStudentDetailId 
                                
                        IF NOT EXISTS ( SELECT  *
                                                FROM    SMManagement.T_Student_Eligibity_Parent
                                                        AS TSEP
                                                WHERE   TSEP.StudentDetailID = @iStudentDetailId
                                                        AND TSEP.BatchID = @iBatchId
                                                        AND TSEP.CourseID = @iCourseId
                                                        AND TSEP.CenterID = @iCenterId
                                                        AND TSEP.StatusID = 1 )
                                    EXEC SMManagement.uspInsertStudentEligibilitySchedule @StudentDetailID = @iStudentDetailId, -- int
                                        @BatchID = @iBatchId, -- int
                                        @CourseID = @iCourseId, -- int
                                        @CenterID = @iCenterId, -- int
                                        @CreatedBy = @sCreatedBy, -- varchar(max)
                                        @CreatedDate = @dtCreatedDate -- datetime                      
                    END           
                  
                INSERT  INTO T_Student_Term_Detail
                        ( I_Term_ID ,
                          I_Course_ID ,
                          I_Batch_ID ,
                          I_Student_Detail_ID ,
                          I_Is_Completed ,
                          S_Crtd_By ,
                          S_Upd_By ,
                          Dt_Crtd_On ,
                          Dt_Upd_On                  
                        )
                        SELECT  A.I_Term_ID ,
                                A.I_Course_ID ,
                                @iBatchId ,
                                @iStudentDetailId ,
                                0 ,
                                @sCreatedBy ,
                                @sCreatedBy ,
                                @dtCreatedDate ,
                                @dtCreatedDate
                        FROM    dbo.T_Term_Course_Map A
                        WHERE   A.I_Course_ID = @iCourseId
                                AND A.I_Status <> 0                  
        
                INSERT  INTO T_Student_Module_Detail
                        ( I_Term_ID ,
                          I_Module_ID ,
                          I_Course_ID ,
                          I_Batch_ID ,
                          I_Student_Detail_ID ,
                          I_Is_Completed ,
                          S_Crtd_By ,
                          S_Upd_By ,
                          Dt_Crtd_On ,
                          Dt_Upd_On                  
                        )
                        SELECT  A.I_Term_ID ,
                                A.I_Module_ID ,
                                C.I_Course_ID ,
                                @iBatchId ,
                                @iStudentDetailId ,
                                0 ,
                                @sCreatedBy ,
                                @sCreatedBy ,
                                @dtCreatedDate ,
                                @dtCreatedDate
                        FROM    dbo.T_Module_Term_Map A
                                INNER JOIN dbo.T_Term_Course_Map C ON A.I_Term_ID = C.I_Term_ID
                        WHERE   C.I_Course_ID = @iCourseId
                                AND A.I_Status <> 0
                                AND C.I_Status <> 0 
                                
                
                     
                    
                SET @AdjPosition = @AdjPosition + 1                  
            END 
            
           
            
                             
        COMMIT TRANSACTION                  
                    
    END TRY                  
                  
    BEGIN CATCH                  
 --Error occurred:                    
        ROLLBACK TRANSACTION                  
        DECLARE @ErrMsg NVARCHAR(4000) ,
            @ErrSeverity INT                  
        SELECT  @ErrMsg = ERROR_MESSAGE() ,
                @ErrSeverity = ERROR_SEVERITY()                  
                  
        RAISERROR(@ErrMsg, @ErrSeverity, 1)                  
    END CATCH     
