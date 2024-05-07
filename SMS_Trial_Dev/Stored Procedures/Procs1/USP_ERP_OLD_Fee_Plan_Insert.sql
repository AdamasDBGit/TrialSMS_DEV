﻿
--EXEC USP_ERP_OLD_Fee_Plan_Insert @NewFeeStructureID
CREATE Proc USP_ERP_OLD_Fee_Plan_Insert(
@NewFeeStructureID Int
)
As Begin
--Declare @NewFeeStructureID int=41
Declare @FeeName Varchar(100),@C_Is_LumpSum int,@Dt_Valid_To Date,
@N_TotalLumpSum Numeric(18,2),@N_TotalInstallment Numeric(18,2)

Declare @brandID int,@SessionID int,@CourseID int,@classID int,@streamID int
			Select @brandID=mp.I_Brand_ID ,@SessionID=mp.I_School_Session_ID,
			@classID=F.I_Class_ID,@streamID=F.I_Stream_ID
			from T_ERP_Fee_Structure_AcademicSession_Map Mp
			Inner Join T_ERP_Fee_Structure F  on F.I_Fee_Structure_ID=@NewFeeStructureID
			  SET @CourseID=(select Top 1 I_Course_ID from T_Course_Group_Class_Mapping 
			  where I_Brand_ID=@brandID
  and I_Class_ID=@classID and I_School_Session_ID=@SessionID
  And (I_Stream_ID=@streamID or I_Stream_ID Is null)
  )
    INSERT INTO T_Course_Fee_Plan
    (
        S_Fee_Plan_Name,
        I_Course_Delivery_ID,
        I_Course_ID,
        I_Currency_ID,
        S_Crtd_By,
        C_Is_LumpSum,
        Dt_Valid_To,
        Dt_Crtd_On,
        N_TotalLumpSum,
        Dt_Upd_On,
        N_TotalInstallment,
        I_Status,
        N_No_Of_Installments,
        I_New_I_Fee_Structure_ID,
        I_Schhol_Group_ID
    )
	Select S_Fee_Structure_Name,
	1,
	@courseID,
	I_Currency_Type_ID,
	IsNull(um.S_Login_ID, 'dba'),
	Null,
	F.Dt_EndDt,
	F.Dtt_CreatedAt,
	F.N_Total_Installment_Amount,
	Null,
	F.N_Total_Installment_Amount,
	F.Is_Active,
	0,
	@NewFeeStructureID,
	SCG.I_School_Group_Class_ID

	from T_ERP_Fee_Structure F
	Left Join T_User_Master UM
           on um.I_User_ID = F.I_CreatedBy
    Left Join [T_School_Group_Class] SCG
            on SCG.I_School_Group_ID = F.I_School_Group_ID
           and SCG.I_Class_ID = F.I_Class_ID
	
	where I_Fee_Structure_ID=@NewFeeStructureID

    DECLARE @I_Course_Fee_Plan_ID INT;
    SET @I_Course_Fee_Plan_ID = SCOPE_IDENTITY();
    ------Inserting Fee Component mapping table-----
    Insert Into T_Course_Fee_Plan_Detail
    (
        I_Fee_Component_ID,
        I_Course_Fee_Plan_ID,
        I_Item_Value,
        N_CompanyShare,
        I_Sequence,
        I_Installment_No,
        S_Crtd_By,
        C_Is_LumpSum,
        I_Display_Fee_Component_ID,
        S_Upd_By,
        Dt_Crtd_On,
        I_Status,
        Dt_Upd_On
    )
    Select FC.R_I_Fee_Component_ID,
           @I_Course_Fee_Plan_ID,
           Fc.N_Component_Actual_Total_Annual_Amount,
           0,
           FC.I_Seq_No,
           FPT.I_Pay_InstallmentNo,
           IsNull(um.S_Login_ID, 'dba'),
           Case
               When FC.Is_OneTime = 1 Then
                   'Y'
               When FC.Is_OneTime = 0 Then
                   'N'
               Else
                    Null
            End,
           FC.R_I_Fee_Component_ID,
           Null,
           FC.Dtt_Created_At,
           FC.Is_Active,
           Null
           from T_ERP_Fee_Structure i WITH(NOLOCK)
        Inner Join T_ERP_Fee_Structure_Installment_Component FC WITH(NOLOCK)
            ON i.I_Fee_Structure_ID = FC.R_I_Fee_Structure_ID And i.I_Fee_Structure_ID=@NewFeeStructureID
        Left Join T_ERP_Fee_PaymentInstallment_Type FPT WITH(NOLOCK)
            ON FPT.I_Fee_Pay_Installment_ID = FC.R_I_Fee_Pay_Installment_ID
        Left Join T_User_Master UM WITH(NOLOCK)
            ON um.I_User_ID = i.I_CreatedBy

			
END;

