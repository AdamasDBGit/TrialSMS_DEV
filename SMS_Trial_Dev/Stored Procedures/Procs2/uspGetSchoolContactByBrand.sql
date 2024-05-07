-- =============================================
-- Author:		<Susmita Paul>
-- Create date: <2023 July 14>
-- Description:	<Get Result exam Schedule>
--exec uspGetSchoolContactByBrand 
-- =============================================
CREATE PROCEDURE [dbo].[uspGetSchoolContactByBrand] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
	   [I_Brand_ID] BrandID
      ,[S_Email] Email
      ,[S_Mobile] Mobile
      ,[S_Description] Description
	  ,[S_Logo] LogoUrl
      ,[I_Status] Status
  FROM [SMS].[dbo].[T_School_Contact]
  where  I_Status = 1


    
END
