CREATE PROCEDURE [dbo].[uspGet_ERP_UserLoginInformationAdmin]      
    (      
      @vLoginID VARCHAR(200) ,      
      @vPassword NVARCHAR(200) 
	   ---0 for User 1 for faculty
    )      
AS      
    BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
        SET NOCOUNT ON;      
       
        DECLARE @vUserType int      
        DECLARE @vPasswordTemp NVARCHAR(200)      
        DECLARE @iUserID INT      
        DECLARE @bLDAPUser BIT      
      
        SELECT  @iUserID = I_User_ID ,      
                @vPasswordTemp = S_Password ,      
                @vUserType = I_User_Type       
                --@bLDAPUser = ISNULL(B_LDAP_User, 'FALSE')      
        FROM    dbo.T_ERP_User      
        WHERE   S_Username = @vLoginID      
                AND I_Status = 1      
      
       
                SELECT  TOP 1 '' AS Title ,      
                        @vLoginID AS LoginID ,      
                        UM.S_First_Name AS FirstName ,      
                        ISNULL(UM.S_Middle_Name,'') AS MiddleName ,      
                        UM.S_Last_Name AS LastName ,      
                        UM.S_Email AS EmailID ,      
                        UM.I_User_Type AS UserType ,      
                        --UM.S_Forget_Pwd_Qtn AS ForgetPwdQs ,      
                        --UM.S_Forget_Pwd_Answer AS ForgetPwdAns ,      
                        UM.I_User_ID AS UserID       
      ,BM.I_Brand_ID as BrandID      
      ,BM.S_Brand_Name as BrandName,      
      ISNULL(UM.IsAllAllowedEligible,'false') as IsAllAllowedEligible,      
      BM.S_Brand_Code as BrandCode
	  ,Isnull(UM.Is_Teaching_Staff,0) as D_UserType
                FROM    dbo.T_ERP_User as UM      
      inner join      
      dbo.T_ERP_User_Brand as UB on UB.I_User_ID=UM.I_User_ID      
      --inner join      
      --T_ERP_Users_Role_Permission_Map a on UM.I_User_ID=a.I_User_Id      
      --Inner Join T_ERP_Role_Master b on a.Role_Id=b.I_Role_ID      
      --Inner Join T_erp_Permission c on c.I_Permission_ID=a.Permission_ID      
      --Inner Join T_ERP_User_Group_Master d on d.I_User_Group_Master_ID=a.User_Group_ID      
      Inner join T_Brand_Master as BM on BM.I_Brand_ID=UB.I_Brand_ID       
                WHERE   UM.S_Username = @vLoginID      
                        AND UM.S_Password = @vPassword      
      --AND a.Is_Active=1      
      AND UM.I_Status=1      
      --AND BM.I_Status=1      
      --AND d.Is_Active=1      
      
                  
      
    END 