CREATE VIEW dbo.T_Student_Attendance_Details
AS
    SELECT  SA.I_Attendance_Detail_ID ,
            SA.I_Student_Detail_ID ,
            TTTM.I_TimeTable_ID ,
            TTTM.I_Batch_ID ,
            TSCD.I_Centre_Id,
            TTTM.I_Term_ID ,
            TTTM.I_Module_ID ,
            TTTM.I_Session_ID ,
            TTTM.S_Session_Name ,
            TTTM.S_Session_Topic ,
            TTTM.Dt_Schedule_Date ,
            TTTM.Dt_Actual_Date AS Dt_Attendance_Date ,
            1 AS I_Has_Attended ,
            TTTM.I_Is_Complete ,
            SA.S_Crtd_By ,
            SA.Dt_Crtd_On ,
            SBM.I_Course_ID ,
            SBM.I_TimeSlot_ID
    FROM    dbo.T_Student_Attendance AS SA
            INNER JOIN dbo.T_TimeTable_Master AS TTTM ON SA.I_TimeTable_ID = TTTM.I_TimeTable_ID
            INNER JOIN dbo.T_Student_Batch_Master AS SBM ON TTTM.I_Batch_ID = SBM.I_Batch_ID
            INNER JOIN dbo.T_Student_Detail AS SD ON SD.I_Student_Detail_ID = SA.I_Student_Detail_ID
            INNER JOIN dbo.T_Enquiry_Regn_Detail AS ERD ON SD.I_Enquiry_Regn_ID = ERD.I_Enquiry_Regn_ID
            INNER JOIN dbo.T_Student_Center_Detail AS TSCD ON TSCD.I_Student_Detail_ID = SD.I_Student_Detail_ID AND SA.I_Student_Detail_ID=TSCD.I_Student_Detail_ID
            WHERE
            TSCD.I_Status=1

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[43] 2[32] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTTM"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 125
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SBM"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SD"
            Begin Extent = 
               Top = 6
               Left = 495
               Bottom = 121
               Right = 706
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ERD"
            Begin Extent = 
               Top = 6
               Left = 744
               Bottom = 121
               Right = 955
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_Student_Attendance_Details';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_Student_Attendance_Details';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_Student_Attendance_Details';

