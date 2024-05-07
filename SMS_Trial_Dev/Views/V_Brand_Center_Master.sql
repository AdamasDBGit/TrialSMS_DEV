CREATE VIEW dbo.V_Brand_Center_Master
AS
SELECT        dbo.T_Brand_Master.I_Brand_ID AS BrandID, dbo.T_Brand_Master.S_Brand_Name AS BrandName, dbo.T_Centre_Master.I_Centre_Id AS CenterID, dbo.T_Centre_Master.S_Center_Name AS CenterName
FROM            dbo.T_Brand_Master INNER JOIN
                         dbo.T_Brand_Center_Details ON dbo.T_Brand_Master.I_Brand_ID = dbo.T_Brand_Center_Details.I_Brand_ID INNER JOIN
                         dbo.T_Brand_Center_Details AS T_Brand_Center_Details_1 ON dbo.T_Brand_Master.I_Brand_ID = T_Brand_Center_Details_1.I_Brand_ID INNER JOIN
                         dbo.T_Brand_Master AS T_Brand_Master_1 ON dbo.T_Brand_Center_Details.I_Brand_ID = T_Brand_Master_1.I_Brand_ID AND T_Brand_Center_Details_1.I_Brand_ID = T_Brand_Master_1.I_Brand_ID INNER JOIN
                         dbo.T_Centre_Master ON dbo.T_Brand_Center_Details.I_Centre_Id = dbo.T_Centre_Master.I_Centre_Id AND T_Brand_Center_Details_1.I_Centre_Id = dbo.T_Centre_Master.I_Centre_Id
WHERE        (dbo.T_Centre_Master.I_Status = 1) AND (dbo.T_Brand_Master.I_Status = 1) AND (dbo.T_Brand_Master.I_Brand_ID IN (107, 110))

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[15] 2[30] 3) )"
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
         Begin Table = "T_Brand_Master"
            Begin Extent = 
               Top = 43
               Left = 70
               Bottom = 173
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "T_Brand_Center_Details"
            Begin Extent = 
               Top = 6
               Left = 278
               Bottom = 136
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "T_Brand_Center_Details_1"
            Begin Extent = 
               Top = 6
               Left = 500
               Bottom = 136
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_Brand_Master_1"
            Begin Extent = 
               Top = 6
               Left = 722
               Bottom = 136
               Right = 892
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_Centre_Master"
            Begin Extent = 
               Top = 138
               Left = 278
               Bottom = 268
               Right = 522
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
   ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Brand_Center_Master';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'      Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Brand_Center_Master';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Brand_Center_Master';

