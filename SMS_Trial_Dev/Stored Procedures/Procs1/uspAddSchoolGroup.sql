﻿-- =============================================
-- Author:		<Parichoy Nandi>
-- Create date: <18th Sept 2023>
-- Description:	<to add school group>
-- =============================================
CREATE PROCEDURE [dbo].[uspAddSchoolGroup]
	-- Add the parameters for the stored procedure here
	@iGroupid int = null,
	@sGroupCode varchar(25),
	@sGroupName varchar(255),
	@iGroupStatus int,
	@tStartTime time(0)=null,
	@tEndTime time(0)=null,
	@UTRecipient UT_Recipient readonly,
	@iBrandid int,
	@sUpdatedBy varchar(255),
	@iSessionID int 

AS
begin transaction
BEGIN TRY
BEGIN
SET NOCOUNT ON;
	DECLARE @iLsatID int
	if(@iGroupid>0)
	BEGIN
	create table #ClassSection(
	 id  int identity(1,1) ,
	ClassID int,
	SchoolGroupID int)
	Insert into #ClassSection( ClassID,SchoolGroupID)
	select 
	Recipient,
	@iGroupid
	from @UTRecipient
	
	Declare @fstV int =1, @lstV int = (Select Max(id) from #ClassSection)
	while(@fstV <= @lstV)
	BEGIN 
	dECLARE @IDGroup int, @IDClass int
	--Set @IDGroup= (Select Top 1 SchoolGroupID  from  #ClassSection)
	Set @IDClass =  (Select Top 1 ClassID  from  #ClassSection where id=@fstV) 
	if not Exists (select 1 from dbo.[T_School_Group_Class] where I_School_Group_ID= @iGroupid AND I_Class_ID=@IDClass)
	BEGIN
	INSERT into T_School_Group_Class
(
I_Status,
 I_School_Group_ID
,I_Class_ID
)
Select 
1,
@iGroupid,
@IDClass
 INSERT into T_School_Group_Class_Timing
(
I_School_Session_ID,
I_School_Group_ID,
Start_Time,
End_Time,
I_Status,
Dt_UpdatedBy,
Dt_UpdatedAt,
I_Class_ID
)
select
@iSessionID,
@iGroupid,
@tStartTime,
@tEndTime,
1,
@sUpdatedBy,
GETDATE(),
@IDClass
END
Set @fstV = @fstV+1
END
drop table #ClassSection
	update [T_School_Group] 
	set 
	[S_School_Group_Name]			= @sGroupName,
	[S_School_Group_Code]			= @sGroupCode,
	[I_Brand_Id]					= @iBrandid,
	[I_Status]						= @iGroupStatus,
	[Dt_UpdatedBy]					=@sUpdatedBy,
	[Dt_UpdatedAt]					=GETDATE()
	where I_School_Group_ID = @iGroupid
	SELECT 1 StatusFlag,'School Group updated' Message

	END
	
	else
	BEGIN
	INSERT INTO [SMS].[dbo].[T_School_Group]
(
[I_Brand_Id],
[S_School_Group_Code],
[S_School_Group_Name],
[I_Status],
[Dt_CreatedBy],
[Dt_CreatedAt]
)
VALUES
(
	@iBrandid,
	@sGroupCode,
	@sGroupName,
	@iGroupStatus,
	@sUpdatedBy,
	GETDATE()
)
set @iLsatID = SCOPE_IDENTITY()
INSERT INTO [SMS].[dbo].[T_School_Group_Class]
(
[I_School_Group_ID],
[I_Status],
[I_Class_ID]
)
select 
	@iLsatID,
	1,
	Recipient
	from @UTRecipient

INSERT INTO [SMS].[dbo].[T_School_Group_Class_Timing]
(
[I_School_Session_ID],
[I_School_Group_ID],
[Start_Time],
[End_Time],
[I_Status],
[Dt_CreatedBy],
[Dt_CreatedAt],
[I_Class_ID]
)
select 
	1,
	@iLsatID,
	@tStartTime,
	@tEndTime,
	1,
	@sUpdatedBy,
	GETDATE(),
	Recipient
	from @UTRecipient
	SELECT 1 StatusFlag,'School Group added' Message
	END
END
END TRY
BEGIN CATCH
	rollback transaction
	DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int

	SELECT	@ErrMsg = ERROR_MESSAGE(),
			@ErrSeverity = ERROR_SEVERITY()
select 0 StatusFlag,@ErrMsg Message
END CATCH
commit transaction
