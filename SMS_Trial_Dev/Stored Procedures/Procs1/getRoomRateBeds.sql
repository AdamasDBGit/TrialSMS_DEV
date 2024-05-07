﻿-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
  
-- exec [dbo].[getRoomRateBeds] 107, 'AKC', 'AKC', 'Floor1', 'Room1', 2  
-- =============================================  
CREATE PROCEDURE [dbo].[getRoomRateBeds]  
 -- Add the parameters for the stored procedure here  
 (  
  @BrandID INT NULL,  
  @BuildingName VARCHAR(200) NULL,  
  @BlockName VARCHAR(200) NULL,  
  @FloorName VARCHAR(200) NULL,  
  @RoomNo VARCHAR(200) NULL,  
  @RoomType INT NULL  
 )  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  

	Create Table #TempComponent_GST (  
	 I_ID int Identity(1,1),  
	 RoomID int,  
	 BedOccp int,  
	 TotalBeds int,
	 RoomRate Numeric(18,2),
	 Component_ID int,
	 ) 

	 Insert Into #TempComponent_GST(RoomID, BedOccp, TotalBeds, Component_ID, RoomRate)

 SELECT I_Room_ID AS RoomID,    
        I_No_Of_Beds AS BedOccp,  
		 I_Room_Capacity AS TotalBeds,
		 34,
		 N_Room_Rate AS RoomRate
		 
 FROM T_room_master  
 WHERE (I_Brand_ID = @BrandID)  
       AND (S_Building_Name LIKE '%' + @BuildingName + '%')   
       AND (S_Block_Name LIKE '%' + @BlockName + '%')  
       AND (S_Floor_Name LIKE '%' + @FloorName + '%')  
       AND (S_Room_No LIKE '%' + @RoomNo + '%')  
       AND (I_Room_Type = @RoomType) 
	   
	   --select * from #TempComponent_GST
	   select a.*
	 ,c.N_CGST as CGST_Per
	 ,c.N_SGST as SGST_Per
	 ,c.N_IGST as IGST_Per
	 ,Convert(numeric(18,2),(a.RoomRate * c.N_CGST / 100)) as CGST_Amt
	 ,Convert(numeric(18,2),(a.RoomRate * c.N_SGST / 100)) as SGST_Amt
	 ,Convert(numeric(18,2),(a.RoomRate * c.N_IGST / 100)) as IGST_Amt
	 
	 from #TempComponent_GST a
	 Inner Join T_ERP_GST_Item_Category b on a.Component_ID=b.I_Fee_Component_ID and b.Is_Active=1
	 Inner Join T_ERP_GST_Configuration_Details c 
	 on c.I_GST_FeeComponent_Catagory_ID=b.I_GST_FeeComponent_Catagory_ID and a.Component_ID=b.I_Fee_Component_ID
     Where a.RoomRate between N_Start_Amount and N_End_Amount  
END  