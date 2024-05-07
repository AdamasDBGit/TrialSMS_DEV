﻿-- =============================================  
-- Author:  <Rajesh>  
-- Create date: <11-01-2007>  
-- Description: <Modify Book Master>  
-- =============================================  
CREATE PROCEDURE [dbo].[uspModifyBookMaster]   
 -- Add the parameters for the stored procedure here  
 @iBookID int,  
 @iBrandID int = null,  
 @sBookCode varchar(250) = null,  
    @sBookName varchar(250) = null,  
 @sBookDescription varchar(1000) = null,   
 @sBookBy varchar(20),  
 @dBookOn datetime,  
    @iFlag int  
  
AS  
BEGIN TRY  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON  
   
    -- Insert statements for procedure here  
 IF @iFlag = 1  
 BEGIN  
  BEGIN TRAN T1  
   INSERT INTO dbo.T_Book_Master  
   ( S_Book_Code,   
    S_Book_Name,   
    S_Book_Desc,   
    I_Brand_ID,   
    S_Crtd_By,   
    Dt_Crtd_On,   
    I_Status )  
   VALUES  
   ( @sBookCode,   
    @sBookName,  
    @sBookDescription,  
    @iBrandID,  
    @sBookBy,  
    @dBookOn,   
    1)  
      
   SET @iBookID = @@IDENTITY  
  COMMIT TRAN T1         
 END  
 ELSE IF @iFlag = 2  
 BEGIN  
  UPDATE dbo.T_Book_Master  
  SET S_Book_Code = @sBookCode,  
  S_Book_Name = @sBookName,  
  S_Book_Desc = @sBookDescription,  
  S_Upd_By = @sBookBy,  
  Dt_Upd_On = @dBookOn  
  where I_Book_ID = @iBookID  
 END  
 ELSE IF @iFlag = 3  
 BEGIN  
  UPDATE dbo.T_Book_Master  
  SET I_Status = 0,  
  S_Upd_By = @sBookBy,  
  Dt_Upd_On = @dBookOn  
  where I_Book_ID = @iBookID  
 END  
   
  SELECT @iBookID BookID  
END TRY  
BEGIN CATCH  
 --Error occurred:    
 ROLLBACK TRAN T1  
 DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int  
 SELECT @ErrMsg = ERROR_MESSAGE(),  
   @ErrSeverity = ERROR_SEVERITY()  
  
 RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH  
