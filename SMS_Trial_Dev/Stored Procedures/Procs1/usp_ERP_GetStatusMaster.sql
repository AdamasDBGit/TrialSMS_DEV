-- =============================================
-- Author:		<Parichoy Nandi>
-- Create date: <30th Jan 2024>
-- Description:	<to get the Status Master>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_GetStatusMaster]
	@BrandID int =null,
	@StatusID int = null
AS
BEGIN
	SET NOCOUNT ON;
	
  select SM.S_Status_Desc as StatusDesc,
  SM.S_Status_Type as StatusType,
  SM.S_Status_Desc_SMS as StatusSMSDesc,
  SM.I_Status_Value as StatusValue,
  SM.I_Status_Id as StatusID,
  SM.N_Amount as Amount,
  SM.I_ConFig_ID as ConfigID
  from [SMS].[dbo].[T_Status_Master] as SM
  where SM.S_Status_Type ='ReceiptType' and Sm.I_Brand_ID= @BrandID and SM.I_Status_Id= ISNULL(@StatusID,SM.I_Status_Id)
	END
