
-- =============================================    
-- Author:  <Author,,Name>    
-- Create date: <Create Date,,>    
-- Description: <Description,,>    

-- exec [dbo].[usp_ERP_GetAdmissionFeesDetails] 234940,107,1    
-- =============================================    

CREATE PROCEDURE [dbo].[usp_ERP_GetAdmissionFeesDetails]
-- Add the parameters for the stored procedure here    
(
    @EnquiryID INT,
    @Brand_ID int = Null,
    @SessionID int = Null
)
AS
BEGIN
Select t1.I_Fee_Component_InstallmentID,
           t1.R_I_Enquiry_Regn_ID,
           t1.Seq,
           CONVERT(varchar, t1.Dt_Payment_Installment_Dt, 107) Dt_Payment_Installment_Dt,
           --ROUND(t1.N_Installment_Amount,2) N_Installment_Amount,  
           CASE
               WHEN t1.N_Installment_Amount - FLOOR(t1.N_Installment_Amount) >= 0.5 THEN
                   CEILING(t1.N_Installment_Amount)
               ELSE
                   FLOOR(t1.N_Installment_Amount)
           END AS N_Installment_Amount,
		    CASE
               WHEN (t1.N_Installment_Amount+N_IGST_Value) - FLOOR(t1.N_Installment_Amount+N_IGST_Value) >= 0.5 THEN
                   CEILING(t1.N_Installment_Amount+N_IGST_Value)
               ELSE
                   FLOOR(t1.N_Installment_Amount+N_IGST_Value)
           END AS N_Installment_Amount_IncludeTax,
           --CEILING(t1.N_Installment_Amount) N_Installment_Amount,    
           --t1.TempInv,    
           t1.R_I_Fee_Structure_ID,
           t2.S_Component_Name S_Fee_Component_Name,
           t3.S_Fee_Structure_Name,
           DENSE_RANK() OVER (ORDER BY t1.Dt_Payment_Installment_Dt) AS DateWiseInstallmentSequenceNo,
		   t4.CGST_per,
		   t1.N_CGST_Value,
		   t4.SGST_per,
		   t1.N_SGST_Value,
		   t4.IGST_per,
		   t1.N_IGST_Value
    Into #Temp_Fee_Installment
    from T_ERP_Fee_Payment_Installment t1
        left join T_Fee_Component_Master t2
            on t2.I_Fee_Component_ID = t1.R_I_Fee_Component_ID
        left join T_ERP_Fee_Structure t3
            on t3.I_Fee_Structure_ID = t1.R_I_Fee_Structure_ID
               and t2.I_Fee_Component_ID = t1.R_I_Fee_Component_ID
        left Join T_ERP_Stud_Fee_Struct_Comp_Mapping SCM
            on SCM.R_I_Enquiry_Regn_ID = @EnquiryID
               and SCM.I_Brand_ID = @Brand_ID
               and SCM.R_I_School_Session_ID = @SessionID
		inner join T_ERP_Stud_Fee_Struct_Comp_Mapping_Details t4 
			on t4.I_Stud_Fee_Struct_CompMap_Details_ID = t1.I_Stud_Fee_Struct_CompMap_Details_ID 
				and t4.R_I_Fee_Component_ID = t1.R_I_Fee_Component_ID
    where
        --t1.Dt_Payment_Installment_Dt>@TargetDate     
        --and     
        t1.R_I_Enquiry_Regn_ID = @EnquiryID
        and t1.Is_Moved is null --and t3.I_Fee_Structure_ID = @FeeStructureID    
    --and t1.TempInv is  null    
    Order by t1.Dt_Payment_Installment_Dt,
             CASE
                 WHEN t1.Seq = 0 THEN
                     1
                 ELSE
                     0
             END,
             t1.Seq
    Select *
    from #Temp_Fee_Installment
    Select SUM(N_Installment_Amount)+SUM(N_IGST_Value) as Total_AMt,
           DateWiseInstallmentSequenceNo,
           CONVERT(varchar, Dt_Payment_Installment_Dt, 107) Dt_Payment_Installment_Dt,
           Dt_Payment_Installment_Dt as D1
    into #TotalAmount
    from #Temp_Fee_Installment
    Group by DateWiseInstallmentSequenceNo,
             Dt_Payment_Installment_Dt
    order by DateWiseInstallmentSequenceNo

    select * from #TotalAmount
    
    select SUM(Total_AMt) as ComponentTotalAmount
    from #TotalAmount
    where D1 <= CONVERT(Date, GETDATE())
	--Select Sum(cd.N_Component_Actual_Amount) As TotalBaseAmount ,
	--Sum(cd.N_Component_Actual_Amount)+Sum(cd.IGST_value) TotalTaxBaseAmount,
	--Sum(cd.SGST_value) SGST,
	--Sum(cd.CGST_value) CGST,
	--SUM(cd.IGST_value) IGST
	--from T_ERP_Stud_Fee_Struct_Comp_Mapping_Details cd
	--Inner Join T_ERP_Stud_Fee_Struct_Comp_Mapping CM 
	--ON CM.I_Stud_Fee_Struct_CompMap_ID=cd.R_I_Stud_Fee_Struct_CompMap_ID
	--where R_I_Enquiry_Regn_ID = @EnquiryID
 --         and cm.Is_Active = 1 and cd.Is_Active=1
 select
 SUM(N_Installment_Amount) TotalBaseAmount,
 SUM(N_Installment_Amount_IncludeTax) TotalTaxBaseAmount,
 SUM(N_SGST_Value) SGST,
 SUM(N_CGST_Value) CGST,
 SUM(N_IGST_Value) IGST
  from #Temp_Fee_Installment
    

    Drop table #Temp_Fee_Installment
END