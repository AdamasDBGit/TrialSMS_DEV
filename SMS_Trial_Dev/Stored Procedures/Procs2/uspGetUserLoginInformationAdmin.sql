﻿CREATE PROCEDURE [dbo].[uspGetUserLoginInformationAdmin]
    (
      @vLoginID VARCHAR(200) ,
      @vPassword NVARCHAR(200)
    )
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
	
        DECLARE @vUserType VARCHAR(20)
        DECLARE @vPasswordTemp NVARCHAR(200)
        DECLARE @iUserID INT
        DECLARE @bLDAPUser BIT

        SELECT  @iUserID = I_User_ID ,
                @vPasswordTemp = S_Password ,
                @vUserType = S_User_Type ,
                @bLDAPUser = ISNULL(B_LDAP_User, 'FALSE')
        FROM    dbo.T_User_Master
        WHERE   S_Login_ID = @vLoginID
                AND I_Status = 1

	-- For Non-Company User
        IF @bLDAPUser = 'TRUE'
            BEGIN
                SELECT  TOP 1 UM.S_Title AS Title ,
                        @vLoginID AS LoginID ,
                        UM.S_First_Name AS FirstName ,
                        ISNULL(UM.S_Middle_Name,'') AS MiddleName ,
                        UM.S_Last_Name AS LastName ,
                        UM.S_Email_ID AS EmailID ,
                        UM.S_User_Type AS UserType ,
                        UM.S_Forget_Pwd_Qtn AS ForgetPwdQs ,
                        UM.S_Forget_Pwd_Answer AS ForgetPwdAns ,
                        UM.I_User_ID AS UserID ,
                        ISNULL(B_LDAP_User, 'FALSE') AS IsLDAPUser
						,HBD.I_Brand_ID as BrandID
						,UHD.I_Hierarchy_Detail_ID as HierarchyList
						,BM.S_Brand_Name as BrandName
                FROM    dbo.T_User_Master as UM
						inner join
						T_User_Hierarchy_Details as UHD on UM.I_User_ID=UHD.I_User_ID -- susmita
						inner join
						T_Hierarchy_Brand_Details as HBD on HBD.I_Hierarchy_Master_ID=UHD.I_Hierarchy_Master_ID -- susmita
						inner join
						T_Brand_Master as BM on BM.I_Brand_ID=HBD.I_Brand_ID 
                WHERE   UM.S_Login_ID = @vLoginID
                        AND UM.I_Status = 1
						AND UHD.I_Status=1 --susmita
						AND HBD.I_Status=1 -- susmita
						AND BM.I_Status=1 -- susmita 
						AND HBD.I_Brand_ID in (107,110) --susmita 
						

            END
	-- For Company Employee User
        ELSE
            BEGIN
                SELECT TOP 1 S_Title AS Title ,
                        @vLoginID AS LoginID ,
                        UM.S_First_Name AS FirstName ,
                        ISNULL(UM.S_Middle_Name,'') AS MiddleName ,
                        UM.S_Last_Name AS LastName ,
                        UM.S_Email_ID AS EmailID ,
                        UM.S_User_Type AS UserType ,
                        UM.S_Forget_Pwd_Qtn AS ForgetPwdQs ,
                        UM.S_Forget_Pwd_Answer AS ForgetPwdAns ,
                        UM.I_User_ID AS UserID ,
                        ISNULL(B_LDAP_User, 'FALSE') AS IsLDAPUser
						,HBD.I_Brand_ID as BrandID
						,UHD.I_Hierarchy_Detail_ID as HierarchyList
						,BM.S_Brand_Name as BrandName,
						BM.S_Brand_Code as BrandCode
                FROM    dbo.T_User_Master as UM
						inner join
						T_User_Hierarchy_Details as UHD on UM.I_User_ID=UHD.I_User_ID -- susmita
						inner join
						T_Hierarchy_Brand_Details as HBD on HBD.I_Hierarchy_Master_ID=UHD.I_Hierarchy_Master_ID -- susmita
						inner join
						T_Brand_Master as BM on BM.I_Brand_ID=HBD.I_Brand_ID 
                WHERE   UM.S_Login_ID = @vLoginID
                        AND UM.S_Password = @vPassword
                        AND UM.I_Status = 1
						AND UHD.I_Status=1 --susmita
						AND HBD.I_Status=1 -- susmita
						AND BM.I_Status=1 -- susmita
						AND HBD.I_Brand_ID in (107,110) --susmita 
            END

    END
