CREATE PROCEDURE [dbo].[RoutineSlotGenerate] 
-- =============================================
     -- Author: Tridip Chatterjee
-- Create date: 26-09-2023
-- Description:	Generating Slots
-- =============================================
-- Add the parameters for the stored procedure here
@RoutineHeaderID int

   

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
--**Createing Temp Table For Arrange Period and Day Wise ID**-----
 Begin
  CREATE TABLE #PeriodAndDay(I_Day_ID int ,Period_NO int);
   WITH Period
   AS(

      SELECT COUNT=1
	  UNION ALL
      SELECT COUNT=COUNT+1

      FROM Period WHERE COUNT<(select I_Total_Periods from T_Erp_Routine_Structure_Header 
                                         where I_Routine_Structure_Header_ID=@RoutineHeaderID)
     )
     Insert into #PeriodAndDay(I_Day_ID,Period_NO)--- *** Inserting Value****---

     SELECT   Findday.I_Day_ID  ,COUNT as Period_No  FROM Period
	 cross join
     (
      select I_Day_ID,T_Start_Slot from T_Week_Day_Master
      cross Join
      T_Erp_Routine_Structure_Header where I_Day_ID!=1 
      and I_Routine_Structure_Header_ID=@RoutineHeaderID
     ) Findday

     order by Findday.I_Day_ID,COUNT;
	 end
	 
	 begin
	 CREATE TABLE #Slot(Period_No int primary key, Start_Slot time ,End_Slot time);

     Declare @A time, @B time,@W int, @loop int
	 
	 Set @loop=(select I_Total_Periods from T_Erp_Routine_Structure_Header  
	                               where I_Routine_Structure_Header_ID=@RoutineHeaderID)
	 Set @W=1
     set @A=(  select 	 
	 right (T_Start_Slot + cast(cast(T_Duration as time) as datetime) +
	 cast(cast(T_Period_Gap as time) as datetime),8) as END_TIME
     from T_Erp_Routine_Structure_Header  where I_Routine_Structure_Header_ID=@RoutineHeaderID)
	
	 set @B=(
	 select Right (cast(cast(T_Start_Slot as datetime)as datetime),8) AS StartSlot
	 from T_Erp_Routine_Structure_Header where I_Routine_Structure_Header_ID=@RoutineHeaderID)
	
	 while (@W<=@loop)
	 begin
	 insert into #Slot(Period_No,Start_Slot,End_Slot) 
	 select @W,Left (@B,8) AS Start_Slot,left (@A,8) AS END_Slot

	 Set @B=@A 
	 Set @A=(  select 	 
	 right (@B + cast(cast(T_Duration as time) as datetime) +
	 cast(cast(T_Period_Gap as time) as datetime),8) as END_TIME
     from T_Erp_Routine_Structure_Header where I_Routine_Structure_Header_ID=@RoutineHeaderID)
     
	 Set @W=@W+1 	
	 end
	 end
  
    
    select 
	#PeriodAndDay.I_Day_ID,
	#Slot.Period_No,
	left(#Slot.Start_Slot,8)as Start_Slot,
	Left(#Slot.End_Slot,8) as End_Slot 
    from #Slot
    inner join #PeriodAndDay on #Slot.Period_No=#PeriodAndDay.Period_NO;
   

   
END
