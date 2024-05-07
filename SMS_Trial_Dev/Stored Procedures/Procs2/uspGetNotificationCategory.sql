/*******************************************************
Description : Save E-Project Manual
Author	:     Arindam Roy
Date	:	  05/22/2007
*********************************************************/

CREATE PROCEDURE [dbo].[uspGetNotificationCategory] 

AS
BEGIN
SELECT  [I_NotificationCategory_ID] ID
      ,[S_NotificationCategory_Name] CategoryName
      ,[I_Status] Status
     
  FROM [SMS].[dbo].[T_NotificationCategory] where I_Status = 1
END
