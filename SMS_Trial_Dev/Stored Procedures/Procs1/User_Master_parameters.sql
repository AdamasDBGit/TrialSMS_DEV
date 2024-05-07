﻿--exec [dbo].[User_Master_parameters] 
CREATE PROCEDURE [dbo].[User_Master_parameters] 
-- =============================================
-------      Author: Tridip Chatterjee
--      Create date: 13-09-2023
--      Description: Parameters listing for User Master Table
-- =============================================

--      Add the parameters for the stored procedure here
-- =============================================
@User_ID int=null,  
@Username varchar(255)=null,  
@Email varchar(255)=null,  
@Name varchar(255)=null,    
@Mobile varchar(255)=null,  
@Status int =null,
@isTeacher bit=null,
@iBrandID int=null


AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	
	SET NOCOUNT ON;
	
	select 
	       EU.I_User_ID As ID,
	       S_Username As Username,
		   S_Password As Password,
		   EU.S_Email as Email,
		   S_First_Name as First_Name,
		   S_Middle_Name as Middle_Name,
		   S_Last_Name as Last_Name,
		   ISNULL(S_First_Name,'')+''+ISNULL(S_Middle_Name,' ')+''+ISNULL(S_Last_Name,'') as Name,
		   S_Mobile as Mobile_No,
		   EU.I_Status Status,
		   --(Case WHEN I_Status=1 THEN 'ACTIVE' else 'Inactive' end) as Status,
		   EU.I_Created_By AS CrtdBy,
		   EU.Dt_CreatedAt as CrtdOn,
		   EU.Dt_Last_Login as Last_Login,
		   ISNULL(EU.Is_Teaching_Staff,'false') as IsTeachingfaculty,
		   FM.I_Faculty_Master_ID as FacultyMasterID,
		   ISNULL(UP.S_EMP_Code,'NA') as EmployeeCode,
		   ISNULL(FM.S_Faculty_Code,'NA') as FacultyCode,
		   ISNULL(FM.S_Faculty_Name,'NA') as FacultyName,
		   UserGroupMap.User_Group_ID as UserGroupID,
	ISNULL(UserGroupMap.S_User_GroupName,'NA') as UserGroupName
	
	from 
	
	T_ERP_User  as EU
	inner join
	T_ERP_User_Brand as EUB on EU.I_User_ID=EUB.I_User_ID
	left join
	T_User_Profile as UP on EU.I_User_ID=UP.I_User_ID and UP.I_Status=1
	left join
	T_Faculty_Master as FM on FM.I_User_ID=UP.I_User_ID and FM.I_Status=1
		LEFT JOIN
	(SELECT URPM.I_User_Id, 
       STUFF((
            SELECT DISTINCT ', ' + CONVERT(VARCHAR, URPM2.User_Group_ID)
            FROM T_ERP_Users_Role_Permission_Map AS URPM2
			inner join
			T_ERP_User_Group_Master as UGM on URPM2.User_Group_ID=UGM.I_User_Group_Master_ID and UGM.Is_Active=1
            WHERE URPM2.I_User_Id = URPM.I_User_Id
              AND URPM2.Is_Active = 1 
              AND URPM2.Brand_ID = ISNULL(@iBrandID, URPM2.Brand_ID)
            FOR XML PATH('')), 1, 2, '') AS User_Group_ID,
       STUFF((
            SELECT DISTINCT ', ' + EGM2.S_User_GroupName
            FROM T_ERP_Users_Role_Permission_Map AS URPM2
            INNER JOIN T_ERP_User_Group_Master AS EGM2 ON URPM2.User_Group_ID = EGM2.I_User_Group_Master_ID and EGM2.Is_Active=1
            WHERE URPM2.I_User_Id = URPM.I_User_Id
              AND URPM2.Is_Active = 1 
              AND URPM2.Brand_ID = ISNULL(@iBrandID, URPM2.Brand_ID)
            FOR XML PATH('')), 1, 2, '') AS S_User_GroupName
FROM T_ERP_Users_Role_Permission_Map AS URPM
WHERE URPM.Is_Active = 1 
      AND URPM.Brand_ID = ISNULL(@iBrandID, URPM.Brand_ID)
GROUP BY URPM.I_User_Id
	 )
	as  UserGroupMap on 
	UserGroupMap.I_User_Id=EU.I_User_ID 
	where 
-- =============================================
     ---Dynamic Parameter Selection
-- =============================================

	
	(EU.I_User_ID = ISNULL(@User_ID,EU.I_User_ID)) 
	and 
	(EU.S_Username = ISNULL(@Username,EU.S_Username)) 
	and 
	(EU.S_Email = ISNULL(@Email,EU.S_Email))
	and 
	(ISNULL(EU.S_First_Name,'')+''+ISNULL(EU.S_Middle_Name,' ')+''+ISNULL(EU.S_Last_Name,'') = ISNULL(@Name,ISNULL(EU.S_First_Name,'')+''+ISNULL(EU.S_Middle_Name,' ')+''+ISNULL(EU.S_Last_Name,'')))
	and 
	(EU.S_Mobile= ISNULL(@Mobile,EU.S_Mobile))
    and 
	(EU.I_Status=ISNULL(@Status,EU.I_Status))
	and 
	(ISNULL(EU.Is_Teaching_Staff,'false')=ISNULL(@isTeacher,ISNULL(EU.Is_Teaching_Staff,'false')))
	and (EUB.I_Brand_ID=ISNULL(@iBrandID,EUB.I_Brand_ID))
	order by EU.I_User_ID desc

END
