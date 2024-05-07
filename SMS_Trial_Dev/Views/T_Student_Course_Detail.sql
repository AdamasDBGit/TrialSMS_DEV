CREATE VIEW [dbo].[T_Student_Course_Detail]
AS
SELECT     A.I_Student_Batch_ID, A.I_Student_ID AS I_Student_Detail_ID, A.I_Batch_ID, A.I_Student_Certificate_ID, A.I_Total_Attendance_Count, A.Dt_Valid_To, 
                      A.Dt_Valid_From, B.S_Batch_Code, B.I_Course_ID, B.I_Delivery_Pattern_ID, B.I_TimeSlot_ID, B.Dt_BatchStartDate AS Dt_Course_Start_Date, 
                      CAST(CASE ISNULL(C.I_Status, B.I_Status) WHEN 5 THEN 1 ELSE 0 END AS BIT) AS I_Is_Completed, B.Dt_Course_Expected_End_Date, 
                      B.Dt_Course_Actual_End_Date, B.S_Crtd_By, B.S_Updt_By, B.Dt_Crtd_On, B.Dt_Upd_On, C.I_Centre_Id, C.Max_Strength, 
                      F.I_Course_Center_Delivery_ID, A.I_Status, A.C_Is_LumpSum
FROM         dbo.T_Student_Batch_Details AS A INNER JOIN
                      dbo.T_Student_Batch_Master AS B ON A.I_Batch_ID = B.I_Batch_ID INNER JOIN
                      dbo.T_Center_Batch_Details AS C ON B.I_Batch_ID = C.I_Batch_ID INNER JOIN
                      dbo.T_Course_Center_Detail AS D ON C.I_Centre_Id = D.I_Centre_Id AND B.I_Course_ID = D.I_Course_ID AND D.I_Status = 1 INNER JOIN
                      dbo.T_Student_Center_Detail AS G ON G.I_Student_Detail_ID = A.I_Student_ID AND G.I_Centre_Id = C.I_Centre_Id INNER JOIN
                      dbo.T_Course_Delivery_Map AS E ON D.I_Course_ID = E.I_Course_ID AND B.I_Delivery_Pattern_ID = E.I_Delivery_Pattern_ID AND 
                      E.I_Status <> 0 LEFT OUTER JOIN
                      dbo.T_Course_Center_Delivery_FeePlan AS F ON E.I_Course_Delivery_ID = F.I_Course_Delivery_ID AND 
                      D.I_Course_Center_ID = F.I_Course_Center_ID AND C.I_Course_Fee_Plan_ID = F.I_Course_Fee_Plan_ID AND F.I_Status = 1
WHERE     (A.I_Status = 1)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[11] 2[29] 3) )"
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
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 507
               Bottom = 121
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 288
               Bottom = 121
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "G"
            Begin Extent = 
               Top = 6
               Left = 737
               Bottom = 121
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 361
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 481
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
     ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_Student_Course_Detail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6165
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
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_Student_Course_Detail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_Student_Course_Detail';

