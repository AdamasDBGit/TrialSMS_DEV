-- =============================================  
-- Author:  <Parichoy Nandi>  
-- Create date: <14th Sept 2023>  
-- Description: <to add or update the class>  
-- =============================================  
CREATE PROCEDURE dbo.usp_ERP_AddClass   
 -- Add the parameters for the stored procedure here  
 @iClassID int = null,  
 @sClassCode varchar(20) ,  
 @iClassStatus int,  
 @sClassName varchar(255),
 @BrandID int =null
AS  
begin transaction  
BEGIN TRY   
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
 if(@iClassID>0)  
 BEGIN  
 if exists (select 1 from T_Class 
 where S_Class_Name = @sClassName and I_Class_ID != @iClassID and I_Brand_ID=@BrandID)  
 BEGIN  
 SELECT 0 StatusFlag,'Duplicate Class Name' Message  
 END  
 ELSE if exists (select 1 from T_Class 
 where S_Class_Code = @sClassCode and I_Class_ID!=@iClassID and I_Brand_ID=@BrandID)  
 BEGIN  
 SELECT 0 StatusFlag,'Duplicate Class Code' Message  
 END  
 ELSE  
 BEGIN  
 update [SMS].[dbo].[T_Class]   
 set   
 [S_Class_Code]     = @sClassCode,  
 [S_Class_Name]     = @sClassName,  
 [I_Status]      = @iClassStatus,
 I_Brand_ID=@BrandID
   
 where I_Class_ID = @iClassID  
   
 SELECT 1 StatusFlag,'Class updated' Message  
 END  
   
 END  
 ELSE  
 BEGIN  
 if exists (select * from T_Class where S_Class_Name = @sClassName and I_Brand_ID=@BrandID)  
 BEGIN  
 SELECT 0 StatusFlag,'Duplicate Class Name' Message  
 END  
 ELSE IF exists (select * from T_Class where S_Class_Code = @sClassCode and I_Brand_ID=@BrandID)  
 BEGIN  
 SELECT 0 StatusFlag,'Duplicate Class Code' Message  
 END  
 ELSE  
 BEGIN  
 INSERT INTO [SMS].[dbo].[T_Class]  
(  
[S_Class_Code],  
[S_Class_Name],  
[I_Status] ,
I_Brand_ID
)  
VALUES  
(  
 @sClassCode,  
 @sClassName,  
 1  ,
 @BrandID
)  
  
 SELECT 1 StatusFlag,'Class added' Message  
 END  
   
 END  
   
  
END  
END TRY  
BEGIN CATCH  
 rollback transaction  
 DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int  
  
 SELECT @ErrMsg = ERROR_MESSAGE(),  
   @ErrSeverity = ERROR_SEVERITY()  
select 0 StatusFlag,@ErrMsg Message  
END CATCH  
commit transaction  
  
  
 



