CREATE VIEW dbo.V_Exam_Grade_Master
AS
SELECT        gm.I_School_Session_ID, t1.I_School_Group_ID, t1.I_Class_ID, gm.I_Exam_Grade_Master_ID, gm.S_Symbol, gm.I_Lower_Limit, gm.I_Upper_Limit
FROM            (SELECT        I_School_Group_Class_ID, I_School_Group_ID, I_Class_ID, Dt_StartedAt, I_Status, CASE WHEN EXISTS
                                                        (SELECT        TOP 1 '1'
                                                          FROM            [dbo].[V_Exam_Grade_Sub]
                                                          WHERE        I_Class_ID = sgc.I_Class_ID AND I_School_Group_ID = sgc.I_School_Group_ID) THEN 1 WHEN EXISTS
                                                        (SELECT        TOP 1 '1'
                                                          FROM            [dbo].[V_Exam_Grade_Sub]
                                                          WHERE        I_Class_ID IS NULL AND I_School_Group_ID = sgc.I_School_Group_ID) THEN 2 ELSE 3 END AS chk_val
                          FROM            dbo.T_School_Group_Class AS sgc) AS t1 INNER JOIN
                         dbo.V_Exam_Grade_Sub AS gm ON t1.I_School_Group_ID = gm.I_School_Group_ID AND t1.I_Class_ID = CASE WHEN t1.chk_val = 1 THEN gm.I_Class_ID WHEN t1.chk_val = 2 THEN t1.I_Class_ID ELSE - 1 END

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[13] 2[50] 3) )"
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
         Begin Table = "t1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "gm"
            Begin Extent = 
               Top = 6
               Left = 295
               Bottom = 136
               Right = 557
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
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Exam_Grade_Master';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_Exam_Grade_Master';

