﻿

-- =============================================
-- Author:		<Arijit Manna>
-- Create date: <2024-04-10>
-- Description:	<Get API Validation>
-- exec ERP_GetAPIValidation 'WBAzqAgsKwUNoT5dbJJu','APIValidation'
-- =============================================
Create PROCEDURE [dbo].[ERP_GetGlobalValidationForModules]
	(
	@BrandID INT=NULL,
	@Type nvarchar(50)=NULL,
	@PropertyName varchar(max) = NULL,
	@Token nvarchar(MAX)=NULL
	)
AS
BEGIN
	
	SET NOCOUNT ON;

-- get the brandid from the token

-- get the brandid from the token
IF @BrandID IS NULL AND @Token IS NOT NULL
BEGIN
set @BrandID = (select t2.I_Brand_ID from T_ERP_User t1 inner join T_ERP_User_Brand t2 on t1.I_User_ID=t2.I_User_ID
 where t1.S_Token=@Token)
 END




create table #SaasConfig
(
PropertyID INT,
PropertyType varchar(max),
PropertyName varchar(max),
BrandID int,
BrandName varchar(max),
NHelp varchar(max)
)

insert into #SaasConfig
   select DISTINCT
   t1.I_Pattern_HeaderID as PropertyID,
   t1.S_Property_Type PropertyType,
   t1.S_Property_Name PropertyName
  ,t1.I_Brand_ID BrandID
  ,TBM.S_Brand_Name BrandName
  ,t1.N_help as NHelp
from [T_ERP_Saas_Pattern_Header] t1
INNER JOIN [T_ERP_Saas_Pattern_Child_Header] t2
on t1.I_Pattern_HeaderID =t2.I_Pattern_HeaderID
Left Join T_ERP_Saas_Pattern_Header SPH on SPH.I_Brand_ID=t1.I_Brand_ID
Left Join T_ERP_Saas_Pattern_Child_Header SPCH on SPCH.I_Pattern_HeaderID=SPH.I_Pattern_HeaderID  
left join T_Brand_Master TBM ON TBM.I_Brand_ID=t1.I_Brand_ID
where t1.I_Brand_ID = @BrandID and t1.S_Property_Type = ISNULL(@Type,t1.S_Property_Type)
and t1.S_Property_Name=ISNULL(@PropertyName,t1.S_Property_Name)
and t2.Is_Active=1 and t1.Is_Active=1

select * from #SaasConfig

select SC.PropertyID,
SPCH.N_Value as Value
from 
#SaasConfig as SC 
inner join
T_ERP_Saas_Pattern_Child_Header as SPCH on SC.PropertyID=SPCH.I_Pattern_HeaderID
where SPCH.Is_Active=1



END









