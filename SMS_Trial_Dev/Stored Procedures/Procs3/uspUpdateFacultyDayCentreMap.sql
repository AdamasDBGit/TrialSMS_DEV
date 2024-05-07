﻿--select * from T_Faculty_Day_Centre_Map

CREATE procedure [dbo].[uspUpdateFacultyDayCentreMap](@EmployeeID INT, @CreatedBy varchar(max))
AS
begin

	update T_Faculty_Day_Centre_Map set I_Status=0,S_Upd_By=@CreatedBy,Dt_Upd_On=GETDATE() where I_Employee_ID=@EmployeeID and I_Status=1

end
