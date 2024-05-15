﻿-- =============================================  
-- Author:  <Parichoy Nandi>  
-- Create date: <10th Nov 2023>  
-- Description: <to add or update the class>  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_ERP_AddFeeCatagory]   
 -- Add the parameters for the stored procedure here  
 @CatagoryID int NULL,  
    @CatagoryName varchar(255),  
    @CatagoryStatus int,  
 @Updatedby int  
AS  
begin transaction  
BEGIN TRY   
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
 if(@CatagoryID>0)  
 BEGIN  
 if exists (select * from [dbo].[T_ERP_Fee_Structure_Category] where [S_Fee_Structure_Catagory_Name]  = @CatagoryName and [I_Fee_Structure_Catagory_ID] != @CatagoryID)  
 BEGIN  
 SELECT 0 StatusFlag,'Duplicate Fee Catagory Name' Message  
 END  
 ELSE  
 BEGIN  
 update [dbo].[T_ERP_Fee_Structure_Category]  
 set   
 [S_Fee_Structure_Catagory_Name] = @CatagoryName,  
    [I_Status] = @CatagoryStatus,  
 [I_UpdatedBy] = @Updatedby,  
 [Dt_UpdatedAt] = GETDATE()  
   
 where [I_Fee_Structure_Catagory_ID] = @CatagoryID  
   
 SELECT 1 StatusFlag,'Fee Catagory updated' Message  
 END  
   
 END  
 ELSE  
 BEGIN  
 if exists (select * from [dbo].[T_ERP_Fee_Structure_Category] where [S_Fee_Structure_Catagory_Name]  = @CatagoryName)  
 BEGIN  
 SELECT 0 StatusFlag,'Duplicate Fee Catagory Name' Message  
 END  
 ELSE  
 BEGIN  
 INSERT INTO [dbo].[T_ERP_Fee_Structure_Category]  
(  
      [S_Fee_Structure_Catagory_Name]  
      ,[I_Status]  
      ,[I_CreatedBy]  
      ,[Dt_CreatedAt]  
)  
VALUES  
(  
 @CatagoryName,  
    @CatagoryStatus,  
 @Updatedby,  
 GETDATE()  
)  
  
 SELECT 1 StatusFlag,'Fee Catagory added' Message  
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


	