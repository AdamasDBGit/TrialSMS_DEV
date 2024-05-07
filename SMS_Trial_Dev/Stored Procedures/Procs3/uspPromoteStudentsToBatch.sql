﻿

CREATE PROCEDURE [dbo].[uspPromoteStudentsToBatch]  
-- Add the parameters for the stored procedure here  
    @iTobatchId INT ,  
    @iFrombatchId INT ,  
    @istudentIdsStr varchar(500)  
AS   
    BEGIN TRY  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 -- 2 stands for promoted out / 3 stands for promoted in  
        SET NOCOUNT ON  

		DECLARE @c INT=0
		DECLARE @i INT=1
		DECLARE @stdid INT

		create table #temp
		(
		ID INT IDENTITY(1,1),
		StudentDetailID INT
		)

		insert into #temp
		select CAST(FR.Val as INT) FROM fnString2Rows(@istudentIdsStr, ',') FR


		select @c=COUNT(*) from #temp

		print @c
   
        IF EXISTS (SELECT  *  
                    FROM    dbo.T_Student_Batch_Details  
                    WHERE   I_Batch_ID = @iFrombatchId  
                            AND I_Student_ID IN ( SELECT  Val  
        FROM    fnString2Rows(@istudentIdsStr, ','))  
                            AND I_Status = 1 )   
            BEGIN  
                UPDATE  dbo.T_Student_Batch_Details  
                SET     I_Status = 2,I_ToBatch_ID=@iTobatchId 
                WHERE   I_Batch_ID = @iFrombatchId  
                        AND I_Student_ID IN (SELECT  Val  
											FROM    fnString2Rows(@istudentIdsStr, ','))  
                        AND I_Status = 1  
   
    
                INSERT  INTO dbo.T_Student_Batch_Details  
                        ( I_Student_ID ,  
                          I_Batch_ID ,  
                          I_Status,
                          I_FromBatch_ID  
   
						)  
                SELECT Val,@iTobatchId,3,@iFrombatchId FROM fnString2Rows(@istudentIdsStr, ',')  


				WHILE(@i<=@c)
				BEGIN

					select @stdid=StudentDetailID from #temp where ID=@i

					print @stdid

					EXEC [LMS].[uspInsertStudentBatchDetailsForInterface] @stdid,@iFrombatchId,'DELETE',NULL


					SET @i=@i+1

				END
    
   
            END  
   
   
    END TRY  
    BEGIN CATCH  
 --Error occurred:    
  
        DECLARE @ErrMsg NVARCHAR(4000) ,  
            @ErrSeverity INT  
        SELECT  @ErrMsg = ERROR_MESSAGE() ,  
                @ErrSeverity = ERROR_SEVERITY()  
  
        RAISERROR(@ErrMsg, @ErrSeverity, 1)  
    END CATCH  
