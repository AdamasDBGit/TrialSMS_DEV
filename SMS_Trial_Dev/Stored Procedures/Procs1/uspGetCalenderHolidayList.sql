--exec uspGetCalenderHolidayList 1,1
CREATE PROCEDURE [dbo].[uspGetCalenderHolidayList]
(
	@iBrandID int = null,
	@iClassID int = null
)
AS

BEGIN
select 
case when DATEDIFF(DAY, TE.Dt_StartDate, TE.Dt_EndDate)=0 
	then DATEADD(DAY, ROW_NUMBER() OVER(partition by TE.I_Event_ID ORDER BY I.id)-1, TE.Dt_StartDate) 
	else  DATEADD(DAY, ROW_NUMBER() OVER(partition by TE.I_Event_ID ORDER BY I.id)-1, TE.Dt_StartDate)
	end as Date,
TE.S_Event_Name as HolidayName,
TEV.S_Event_Category HolidayType,
TE.I_Event_ID,

case when DATEDIFF(DAY, TE.Dt_StartDate, TE.Dt_EndDate)=0 
	then SUBSTRING(datename(dw,DATEADD(DAY, ROW_NUMBER() OVER(partition by TE.I_Event_ID ORDER BY I.id)-1, TE.Dt_StartDate) ), 1, 3)
	else  SUBSTRING(datename(dw,DATEADD(DAY, ROW_NUMBER() OVER(partition by TE.I_Event_ID ORDER BY I.id)-1, TE.Dt_StartDate)), 1, 3)
	end 
    Day,
TE.I_Brand_ID BrandID
from T_Event TE 
join T_INCR  I ON I.Id<=(DATEDIFF(DAY, TE.Dt_StartDate, TE.Dt_EndDate) + 1) 
inner join 
T_Event_Category TEV ON TE.I_Event_Category_ID = TEV.I_Event_Category_ID
join 
(
select I_Event_ID from T_Event_Class 
where I_Class_ID = @iClassID
group by I_Event_ID
) 
as TECC ON TECC.I_Event_ID = TE.I_Event_ID
--join T_School_Group_Class TSGC ON TSGC.I_School_Group_ID = TEC.I_School_Group_ID
where TE.I_Brand_ID = @iBrandID and TE.I_Event_Category_ID=2
order by TE.I_Event_ID
END
