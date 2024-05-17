﻿CREATE Proc [dbo].[USP_ERP_Update_Followup_Auto](      
@EnquiryID bigint,@FollowUpStatusID int,@FollowupBy Varchar(10)=null      
)      
as      
begin      
--Declare @EnquiryID bigint,@FollowUpStatusID int,@FollowupBy Varchar(10)      
      
If Not Exists(Select 1 from T_Enquiry_Regn_Followup where I_Enquiry_Regn_ID=@EnquiryID)      
Begin      
Insert Into T_Enquiry_Regn_Followup(      
    
    
 I_Enquiry_Regn_ID    
,Dt_Followup_Date    
,Dt_Next_Followup_Date    
,S_Followup_Remarks    
,S_Followup_Status    
,ERP_R_I_FollowupType_ID    
    
)      
Select       
 @EnquiryID      
,GETDATE()      
,Null      
,'System-Generated'      
,@FollowUpStatusID      
,5     
select 1 as StatusFlag,'Updated' as Message    
End      
      
If Exists(Select 1 from T_Enquiry_Regn_Followup where I_Enquiry_Regn_ID=@EnquiryID      
and Dt_Next_Followup_Date is Null      
)      
Begin      
Update T_Enquiry_Regn_Followup set     
S_Followup_Status=@FollowUpStatusID      
,S_Followup_Remarks='System-Generated'      
--,S_Followup_By='DBA'    
--,Dt_Modified_At=GETDATE()      
,Dt_Followup_Date = GETDATE()      
where I_Enquiry_Regn_ID=@EnquiryID      
select 1 as StatusFlag,'Updated' as Message    
End      
End