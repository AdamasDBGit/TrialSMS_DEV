CREATE VIEW dbo.LMSData
AS
SELECT     A.S_Student_ID, A.S_First_Name, ISNULL(A.S_Middle_Name, '') AS MiddleName, A.S_Last_Name, A.S_Curr_Address1, A.S_Curr_Address2, TCM.S_City_Name, 
                      A.S_Perm_Pincode, 'India' AS Country, A.S_Email_ID, A.S_Mobile_No, A.S_Phone_No, A.Dt_Birth_Date, D.I_Centre_Id, A.Dt_Crtd_On, F.S_Student_Photo, 
                      1 AS categorycode
FROM         dbo.T_Student_Detail AS A INNER JOIN
                      dbo.T_Student_Batch_Details AS B ON A.I_Student_Detail_ID = B.I_Student_ID INNER JOIN
                      dbo.T_Student_Batch_Master AS C ON C.I_Batch_ID = B.I_Batch_ID INNER JOIN
                      dbo.T_Center_Batch_Details AS D ON D.I_Batch_ID = C.I_Batch_ID INNER JOIN
                      dbo.T_Center_Hierarchy_Name_Details AS E ON E.I_Center_ID = D.I_Centre_Id INNER JOIN
                      dbo.T_Enquiry_Regn_Detail AS F ON F.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID INNER JOIN
                      dbo.T_Course_Master AS G ON G.I_Course_ID = C.I_Course_ID INNER JOIN
                      dbo.T_City_Master AS TCM ON A.I_Curr_City_ID = TCM.I_City_ID
WHERE     (B.I_Status = 1) AND (E.I_Brand_ID = 109) AND (A.Dt_Crtd_On <= GETDATE())

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
               Bottom = 125
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 365
               Right = 282
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 485
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 605
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 606
               Left = 38
               Bottom = 725
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "G"
            Begin Extent = 
               Top = 726
               Left = 38
               Bottom = 845
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'LMSData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'       Begin Table = "TCM"
            Begin Extent = 
               Top = 6
               Left = 295
               Bottom = 158
               Right = 465
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'LMSData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'LMSData';

