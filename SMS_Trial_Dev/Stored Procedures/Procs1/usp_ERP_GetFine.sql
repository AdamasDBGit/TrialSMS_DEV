-- =============================================
-- Author:		<Parichoy Nandi>
-- Create date: <15th February 2024>
-- Description:	<to get the class>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_GetFine]
	@iBrandID int null,
	@FineHeaderID int null

AS
BEGIN
	SET NOCOUNT ON;
	Select FFH.S_Name as FineName,
FFH.FreqType as Frequency,
FFH.I_Fee_Fine_H_ID as FineHeaderID,
FFH.Is_Active as FineActive,
FPT.S_Installment_Frequency as FrequencyName
from T_ERP_Fee_Fine_Header as FFH 
join T_ERP_Fee_PaymentInstallment_Type as FPT on FFH.FreqType=FPT.I_Fee_Pay_Installment_ID
where FFH.I_Fee_Fine_H_ID=ISNULL(@FineHeaderID,FFH.I_Fee_Fine_H_ID)  and FFH.I_Brand_ID=@iBrandID



Select FFD.I_Fee_Fine_D_ID as FineDetailID,
FFD.I_Fee_Fine_H_ID as HeaderID,
FFD.I_Frm_Range as FromRange,
FFD.I_To_Range as ToRange,
FFD.N_Fine_Amount as FineAmount,
FFD.Is_Active as Active
from T_ERP_Fee_Fine_Details as FFD where FFD.I_Fee_Fine_H_ID=ISNULL(@FineHeaderID,FFD.I_Fee_Fine_H_ID) and FFD.Is_Active=1

	END
