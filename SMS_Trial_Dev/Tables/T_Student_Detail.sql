CREATE TABLE [dbo].[T_Student_Detail] (
    [I_Student_Detail_ID]       INT             IDENTITY (1, 1) NOT NULL,
    [I_Enquiry_Regn_ID]         INT             NULL,
    [S_Student_ID]              VARCHAR (500)   NULL,
    [S_Title]                   VARCHAR (10)    NULL,
    [S_First_Name]              VARCHAR (50)    NULL,
    [S_Middle_Name]             VARCHAR (50)    NULL,
    [S_Last_Name]               VARCHAR (50)    NULL,
    [S_Guardian_Name]           VARCHAR (200)   NULL,
    [I_Guardian_Occupation_ID]  INT             NULL,
    [S_Guardian_Email_ID]       VARCHAR (200)   NULL,
    [S_Guardian_Phone_No]       VARCHAR (20)    NULL,
    [S_Guardian_Mobile_No]      VARCHAR (500)   NULL,
    [I_Income_Group_ID]         INT             NULL,
    [Dt_Birth_Date]             DATETIME        NULL,
    [S_Age]                     VARCHAR (20)    NULL,
    [S_Email_ID]                VARCHAR (200)   NULL,
    [S_Phone_No]                VARCHAR (20)    NULL,
    [S_Mobile_No]               VARCHAR (500)   NULL,
    [C_Skip_Test]               CHAR (1)        NULL,
    [I_Occupation_ID]           INT             NULL,
    [I_Pref_Career_ID]          INT             NULL,
    [I_Qualification_Name_ID]   INT             NULL,
    [I_Stream_ID]               INT             NULL,
    [S_Curr_Address1]           VARCHAR (200)   NULL,
    [S_Curr_Address2]           VARCHAR (200)   NULL,
    [I_Curr_Country_ID]         INT             NULL,
    [I_Curr_State_ID]           INT             NULL,
    [I_Curr_City_ID]            INT             NULL,
    [S_Curr_Area]               VARCHAR (500)   NULL,
    [S_Curr_Pincode]            VARCHAR (500)   NULL,
    [S_Perm_Address1]           VARCHAR (200)   NULL,
    [S_Perm_Address2]           VARCHAR (200)   NULL,
    [I_Perm_Country_ID]         INT             NULL,
    [I_Perm_State_ID]           INT             NULL,
    [I_Perm_City_ID]            INT             NULL,
    [S_Perm_Area]               VARCHAR (500)   NULL,
    [S_Perm_Pincode]            VARCHAR (500)   NULL,
    [I_Status]                  INT             NOT NULL,
    [S_Crtd_By]                 VARCHAR (20)    NULL,
    [S_Upd_By]                  VARCHAR (20)    NULL,
    [Dt_Crtd_On]                DATETIME        NULL,
    [Dt_Upd_On]                 DATETIME        NULL,
    [S_Conduct_Code]            VARCHAR (20)    NULL,
    [S_Is_Corporate]            VARCHAR (20)    NULL,
    [I_Corporate_ID]            INT             NULL,
    [I_Residence_Area_ID]       INT             NULL,
    [I_RollNo]                  INT             NULL,
    [I_Marital_Status_ID]       INT             NULL,
    [I_Transport_ID]            INT             CONSTRAINT [DF_T_Student_Detail_I_Transport_ID] DEFAULT ((0)) NULL,
    [I_room_ID]                 INT             CONSTRAINT [DF_T_Student_Detail_I_room_ID] DEFAULT ((0)) NULL,
    [I_House_ID]                INT             NULL,
    [I_Route_ID]                INT             NULL,
    [B_Is_APAI_Acc_Settled]     BIT             NULL,
    [Dt_Transport_Deactivation] DATETIME        NULL,
    [B_IsBooking]               INT             CONSTRAINT [Df_Val] DEFAULT ((0)) NULL,
    [B_HasTakenLoan]            BIT             NULL,
    [I_DiscountType_ID]         INT             NULL,
    [S_Ext_Email_ID]            VARCHAR (MAX)   NULL,
    [IsDropOut]                 BIT             NULL,
    [IsWaiting]                 BIT             NULL,
    [IsDefaulter]               BIT             NULL,
    [IsOnLeave]                 BIT             NULL,
    [IsCompleted]               BIT             NULL,
    [IsDiscontinued]            BIT             NULL,
    [N_DueAmount]               DECIMAL (14, 2) NULL,
    [S_OrgEmailID]              VARCHAR (MAX)   NULL,
    [S_OrgEmailPassword]        VARCHAR (MAX)   NULL,
    [IsPreDefaulter]            DATETIME        NULL,
    [IsPaymentDue]              BIT             NULL,
    [I_IsPreDefaulter]          INT             NULL,
    [DefaulterCourses]          VARCHAR (MAX)   CONSTRAINT [DF__T_Student__Defau__025E52B6] DEFAULT ('') NULL,
    [PreDefaulterCourses]       VARCHAR (MAX)   CONSTRAINT [DF__T_Student__PreDe__035276EF] DEFAULT ('') NULL,
    [PaymentDueCourses]         VARCHAR (MAX)   CONSTRAINT [DF__T_Student__Payme__04469B28] DEFAULT ('') NULL,
    [I_buzzedDB_Slot_ID]        INT             NULL,
    CONSTRAINT [PK__T_Student_Detail__00AAE2A4] PRIMARY KEY CLUSTERED ([I_Student_Detail_ID] ASC),
    CONSTRAINT [FK__T_Student__I_Cur__3DB3F0E4] FOREIGN KEY ([I_Curr_State_ID]) REFERENCES [dbo].[T_State_Master] ([I_State_ID]),
    CONSTRAINT [FK__T_Student__I_Cur__3EA8151D] FOREIGN KEY ([I_Curr_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK__T_Student__I_Cur__3F9C3956] FOREIGN KEY ([I_Curr_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_Student__I_Enq__3CBFCCAB] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK__T_Student__I_Inc__40905D8F] FOREIGN KEY ([I_Income_Group_ID]) REFERENCES [dbo].[T_Income_Group_Master] ([I_Income_Group_ID]),
    CONSTRAINT [FK__T_Student__I_Occ__436CCA3A] FOREIGN KEY ([I_Occupation_ID]) REFERENCES [dbo].[T_Occupation_Master] ([I_Occupation_ID]),
    CONSTRAINT [FK__T_Student__I_Pre__418481C8] FOREIGN KEY ([I_Pref_Career_ID]) REFERENCES [dbo].[T_Preferred_Career_Master] ([I_Pref_Career_ID]),
    CONSTRAINT [FK__T_Student__I_Qua__3BCBA872] FOREIGN KEY ([I_Qualification_Name_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID]),
    CONSTRAINT [FK__T_Student__I_Str__4278A601] FOREIGN KEY ([I_Stream_ID]) REFERENCES [dbo].[T_Stream_Master] ([I_Stream_ID]),
    CONSTRAINT [FK_T_Student_Detail_T_BusRoute_Master] FOREIGN KEY ([I_Route_ID]) REFERENCES [dbo].[T_BusRoute_Master] ([I_Route_ID]),
    CONSTRAINT [FK_T_Student_Detail_T_Corporate_Details] FOREIGN KEY ([I_Corporate_ID]) REFERENCES [CORPORATE].[T_Corporate_Details] ([I_Corporate_ID]),
    CONSTRAINT [FK_T_Student_Detail_T_House_Master] FOREIGN KEY ([I_House_ID]) REFERENCES [dbo].[T_House_Master] ([I_House_ID])
);


GO
CREATE TRIGGER [dbo].[TDELETE_T_Student_Detail] ON [dbo].[T_Student_Detail] AFTER DELETE ASBEGININSERT INTO T_Student_Detail_A(I_Student_Detail_ID,I_Enquiry_Regn_ID,S_Student_ID,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,Dt_Birth_Date,S_Age,S_Email_ID,S_Phone_No,S_Mobile_No,C_Skip_Test,I_Occupation_ID,I_Pref_Career_ID,I_Qualification_Name_ID,I_Stream_ID,S_Curr_Address1,S_Curr_Address2,I_Curr_Country_ID,I_Curr_State_ID,I_Curr_City_ID,S_Curr_Area,S_Curr_Pincode,S_Perm_Address1,S_Perm_Address2,I_Perm_Country_ID,I_Perm_State_ID,I_Perm_City_ID,S_Perm_Area,S_Perm_Pincode,I_Status,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,S_Conduct_Code,S_Is_Corporate,I_Corporate_ID,I_Residence_Area_ID,I_RollNo,I_Marital_Status_ID,I_Transport_ID,I_room_ID,I_House_ID,I_Route_ID,B_Is_APAI_Acc_Settled,Dt_Transport_Deactivation,AuditedOn,AuditType)SELECT I_Student_Detail_ID,I_Enquiry_Regn_ID,S_Student_ID,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,Dt_Birth_Date,S_Age,S_Email_ID,S_Phone_No,S_Mobile_No,C_Skip_Test,I_Occupation_ID,I_Pref_Career_ID,I_Qualification_Name_ID,I_Stream_ID,S_Curr_Address1,S_Curr_Address2,I_Curr_Country_ID,I_Curr_State_ID,I_Curr_City_ID,S_Curr_Area,S_Curr_Pincode,S_Perm_Address1,S_Perm_Address2,I_Perm_Country_ID,I_Perm_State_ID,I_Perm_City_ID,S_Perm_Area,S_Perm_Pincode,I_Status,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,S_Conduct_Code,S_Is_Corporate,I_Corporate_ID,I_Residence_Area_ID,I_RollNo,I_Marital_Status_ID,I_Transport_ID,I_room_ID,I_House_ID,I_Route_ID,B_Is_APAI_Acc_Settled,Dt_Transport_Deactivation, GETDATE(), 'D'FROM DELETED IEND
GO
CREATE TRIGGER [dbo].[TUPDATE_T_Student_Detail] ON [dbo].[T_Student_Detail] AFTER UPDATE ASBEGININSERT INTO T_Student_Detail_A(I_Student_Detail_ID,I_Enquiry_Regn_ID,S_Student_ID,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,Dt_Birth_Date,S_Age,S_Email_ID,S_Phone_No,S_Mobile_No,C_Skip_Test,I_Occupation_ID,I_Pref_Career_ID,I_Qualification_Name_ID,I_Stream_ID,S_Curr_Address1,S_Curr_Address2,I_Curr_Country_ID,I_Curr_State_ID,I_Curr_City_ID,S_Curr_Area,S_Curr_Pincode,S_Perm_Address1,S_Perm_Address2,I_Perm_Country_ID,I_Perm_State_ID,I_Perm_City_ID,S_Perm_Area,S_Perm_Pincode,I_Status,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,S_Conduct_Code,S_Is_Corporate,I_Corporate_ID,I_Residence_Area_ID,I_RollNo,I_Marital_Status_ID,I_Transport_ID,I_room_ID,I_House_ID,I_Route_ID,B_Is_APAI_Acc_Settled,Dt_Transport_Deactivation,AuditedOn,AuditType)SELECT I_Student_Detail_ID,I_Enquiry_Regn_ID,S_Student_ID,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,Dt_Birth_Date,S_Age,S_Email_ID,S_Phone_No,S_Mobile_No,C_Skip_Test,I_Occupation_ID,I_Pref_Career_ID,I_Qualification_Name_ID,I_Stream_ID,S_Curr_Address1,S_Curr_Address2,I_Curr_Country_ID,I_Curr_State_ID,I_Curr_City_ID,S_Curr_Area,S_Curr_Pincode,S_Perm_Address1,S_Perm_Address2,I_Perm_Country_ID,I_Perm_State_ID,I_Perm_City_ID,S_Perm_Area,S_Perm_Pincode,I_Status,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,S_Conduct_Code,S_Is_Corporate,I_Corporate_ID,I_Residence_Area_ID,I_RollNo,I_Marital_Status_ID,I_Transport_ID,I_room_ID,I_House_ID,I_Route_ID,B_Is_APAI_Acc_Settled,Dt_Transport_Deactivation, GETDATE(), 'U'FROM DELETED IEND
GO
CREATE TRIGGER [dbo].[trgAfterInsertStudentDetail] ON [dbo].[T_Student_Detail]
AFTER INSERT
AS
DECLARE @iStudentID INT;
DECLARE @sMobileNo VARCHAR(MAX);
DECLARE @sStudentID VARCHAR(MAX);

SELECT @iStudentID=i.I_Student_Detail_ID
FROM INSERTED i; 

SELECT @sMobileNo=i.S_Mobile_No
FROM INSERTED i;

SELECT @sStudentID=i.S_Student_ID
FROM INSERTED i;


IF (@sStudentID LIKE '%RICE%')
BEGIN
INSERT INTO dbo.T_SMS_SEND_DETAILS
        ( S_MOBILE_NO ,
          I_SMS_STUDENT_ID ,
          I_SMS_TYPE_ID ,
          S_SMS_BODY ,
          
          
          I_REFERENCE_ID ,
          I_REFERENCE_TYPE_ID ,
          
          I_Status ,
          S_Crtd_By ,
          
          Dt_Crtd_On 
          
        )
VALUES  ( @sMobileNo , -- S_MOBILE_NO - varchar(25)
          @iStudentID , -- I_SMS_STUDENT_ID - int
          7 , -- I_SMS_TYPE_ID - int
          'Dear Student: Welcome to RICE. – RICE' , -- S_SMS_BODY - varchar(160)
          
          
          @iStudentID , -- I_REFERENCE_ID - int
          3 , -- I_REFERENCE_TYPE_ID - int
         
          1 , -- I_Status - int
          'dba' , -- S_Crtd_By - varchar(20)
          
          GETDATE()  -- Dt_Crtd_On - datetime
          
        )
        
        --INSERT INTO dbo.T_Student_Status_Details
        --        ( I_Student_Detail_ID ,
        --          I_Student_Status_ID ,
        --          I_Status ,
        --          N_Due ,
        --          Dt_Crtd_On ,
        --          S_Crtd_By ,
        --          IsEditable
        --        )
        --VALUES  ( @iStudentID , -- I_Student_Detail_ID - int
        --          2 , -- I_Student_Status_ID - int
        --          1 , -- I_Status - int
        --          NULL , -- N_Due - decimal
        --          GETDATE() , -- Dt_Crtd_On - datetime
        --          'dba' , -- S_Crtd_By - varchar(50)
        --          1  -- IsEditable - bit
        --        )
END
ELSE IF (@sStudentID LIKE '%/AC/%')
BEGIN
	INSERT INTO dbo.T_SMS_SEND_DETAILS
        ( S_MOBILE_NO ,
          I_SMS_STUDENT_ID ,
          I_SMS_TYPE_ID ,
          S_SMS_BODY ,
          
          
          I_REFERENCE_ID ,
          I_REFERENCE_TYPE_ID ,
          
          I_Status ,
          S_Crtd_By ,
          
          Dt_Crtd_On 
          
        )
VALUES  ( @sMobileNo , -- S_MOBILE_NO - varchar(25)
          @iStudentID , -- I_SMS_STUDENT_ID - int
          7 , -- I_SMS_TYPE_ID - int
          'Dear Student: Welcome to Adamas Career. – ADAMAS' , -- S_SMS_BODY - varchar(160)
          
          
          @iStudentID , -- I_REFERENCE_ID - int
          3 , -- I_REFERENCE_TYPE_ID - int
         
          1 , -- I_Status - int
          'dba' , -- S_Crtd_By - varchar(20)
          
          GETDATE()  -- Dt_Crtd_On - datetime
          
        )
        
        --INSERT INTO dbo.T_Student_Status_Details
        --        ( I_Student_Detail_ID ,
        --          I_Student_Status_ID ,
        --          I_Status ,
        --          N_Due ,
        --          Dt_Crtd_On ,
        --          S_Crtd_By ,
        --          IsEditable
        --        )
        --VALUES  ( @iStudentID , -- I_Student_Detail_ID - int
        --          2 , -- I_Student_Status_ID - int
        --          1 , -- I_Status - int
        --          NULL , -- N_Due - decimal
        --          GETDATE() , -- Dt_Crtd_On - datetime
        --          'dba' , -- S_Crtd_By - varchar(50)
        --          1  -- IsEditable - bit
        --        )
END

ELSE IF (@sStudentID LIKE '%AWS%')
BEGIN
	INSERT INTO dbo.T_SMS_SEND_DETAILS
        ( S_MOBILE_NO ,
          I_SMS_STUDENT_ID ,
          I_SMS_TYPE_ID ,
          S_SMS_BODY ,
          
          
          I_REFERENCE_ID ,
          I_REFERENCE_TYPE_ID ,
          
          I_Status ,
          S_Crtd_By ,
          
          Dt_Crtd_On 
          
        )
VALUES  ( @sMobileNo , -- S_MOBILE_NO - varchar(25)
          @iStudentID , -- I_SMS_STUDENT_ID - int
          7 , -- I_SMS_TYPE_ID - int
          'Dear Student: Welcome to Adamas World School. – ADAMAS' , -- S_SMS_BODY - varchar(160)
          
          
          @iStudentID , -- I_REFERENCE_ID - int
          3 , -- I_REFERENCE_TYPE_ID - int
         
          1 , -- I_Status - int
          'dba' , -- S_Crtd_By - varchar(20)
          
          GETDATE()  -- Dt_Crtd_On - datetime
          
        )
END

ELSE IF (@sStudentID LIKE '__-%')
BEGIN
	INSERT INTO dbo.T_SMS_SEND_DETAILS
        ( S_MOBILE_NO ,
          I_SMS_STUDENT_ID ,
          I_SMS_TYPE_ID ,
          S_SMS_BODY ,
          
          
          I_REFERENCE_ID ,
          I_REFERENCE_TYPE_ID ,
          
          I_Status ,
          S_Crtd_By ,
          
          Dt_Crtd_On 
          
        )
VALUES  ( @sMobileNo , -- S_MOBILE_NO - varchar(25)
          @iStudentID , -- I_SMS_STUDENT_ID - int
          7 , -- I_SMS_TYPE_ID - int
          'Dear Student: Welcome to Adamas International School. – ADAMAS' , -- S_SMS_BODY - varchar(160)
          
          
          @iStudentID , -- I_REFERENCE_ID - int
          3 , -- I_REFERENCE_TYPE_ID - int
         
          1 , -- I_Status - int
          'dba' , -- S_Crtd_By - varchar(20)
          
          GETDATE()  -- Dt_Crtd_On - datetime
          
        )
END

ELSE
BEGIN
	INSERT INTO dbo.T_SMS_SEND_DETAILS
        ( S_MOBILE_NO ,
          I_SMS_STUDENT_ID ,
          I_SMS_TYPE_ID ,
          S_SMS_BODY ,
          
          
          I_REFERENCE_ID ,
          I_REFERENCE_TYPE_ID ,
          
          I_Status ,
          S_Crtd_By ,
          
          Dt_Crtd_On 
          
        )
VALUES  ( @sMobileNo , -- S_MOBILE_NO - varchar(25)
          @iStudentID , -- I_SMS_STUDENT_ID - int
          7 , -- I_SMS_TYPE_ID - int
          'Dear Student: Welcome to Adamas Institute of Technology. – ADAMAS' , -- S_SMS_BODY - varchar(160)
          
          
          @iStudentID , -- I_REFERENCE_ID - int
          3 , -- I_REFERENCE_TYPE_ID - int
         
          1 , -- I_Status - int
          'dba' , -- S_Crtd_By - varchar(20)
          
          GETDATE()  -- Dt_Crtd_On - datetime
          
        )
END

GO
DISABLE TRIGGER [dbo].[trgAfterInsertStudentDetail]
    ON [dbo].[T_Student_Detail];

