﻿CREATE Proc ERP_USP_Moved_Fee_Data(
@EnquiryID Int,@sessionID Int,@brandID Int
)
As 
begin
--Declare @EnquiryID Int
--SET @EnquiryID=234882
Update  T_ERP_Stud_Fee_Struct_Comp_Mapping Set Is_Moved=1 ,Dt_Moved_DT=GETDATE()
where R_I_Enquiry_Regn_ID=@EnquiryID and I_Brand_ID=@brandID 
and R_I_School_Session_ID=@sessionID

Update  T_ERP_Stud_Fee_Struct_Comp_Mapping_Details set Is_Moved=1,Dt_Moved_DT=GETDATE()
where R_I_Stud_Fee_Struct_CompMap_ID In(
Select I_Stud_Fee_Struct_CompMap_ID from T_ERP_Stud_Fee_Struct_Comp_Mapping  
where R_I_Enquiry_Regn_ID=@EnquiryID and I_Brand_ID=@brandID 
and R_I_School_Session_ID=@sessionID
)
Update T_ERP_Fee_Payment_Installment SET Is_Moved=1,DT_Moved_Dt=GETDATE()
where I_Stud_Fee_Struct_CompMap_Details_ID in(
Select I_Stud_Fee_Struct_CompMap_Details_ID 
from T_ERP_Stud_Fee_Struct_Comp_Mapping_Details
where R_I_Stud_Fee_Struct_CompMap_ID In(
Select I_Stud_Fee_Struct_CompMap_ID from T_ERP_Stud_Fee_Struct_Comp_Mapping  
where R_I_Enquiry_Regn_ID=@EnquiryID and I_Brand_ID=@brandID 
and R_I_School_Session_ID=@sessionID
))
End