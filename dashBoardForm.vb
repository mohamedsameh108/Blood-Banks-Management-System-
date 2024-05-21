Imports System.Data.SqlClient

Public Class dashBoardForm
    Private startTime As DateTime
    Private mouseOffset As Point
    Private isMouseDown As Boolean = False
    Private Sub Form1_MouseDown(sender As Object, e As MouseEventArgs) Handles MyBase.MouseDown
        If e.Button = MouseButtons.Left Then
            mouseOffset = New Point(-e.X, -e.Y)
            isMouseDown = True
        End If
    End Sub

    Private Sub Form1_MouseMove(sender As Object, e As MouseEventArgs) Handles MyBase.MouseMove
        If isMouseDown Then
            Dim mousePos As Point = Control.MousePosition
            mousePos.Offset(mouseOffset.X, mouseOffset.Y)
            Me.Location = mousePos
        End If
    End Sub
    Private Sub Form1_MouseUp(sender As Object, e As MouseEventArgs) Handles MyBase.MouseUp
        If e.Button = MouseButtons.Left Then
            isMouseDown = False
        End If
    End Sub
    Private Sub logOutIcon_Click(sender As Object, e As EventArgs) Handles logOutIcon.Click
        My.Settings.rememberMe = False
        My.Settings.userName = ""
        My.Settings.Password = ""
        My.Settings.Save()
        Hide()
        loginForm.Show()
    End Sub

    Private Sub dashBoardForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        startTime = DateTime.Now
        Timer1.Start()
        updateTimeLabel()
        avaliable.Text = returnAvaliableUnits().ToString()
        disposaed.Text = returnDisposalUnits().ToString()
        Dim query As String = "select FName, LName from MEDICAL_STAFF Where UserName = '" & userName + "';"
        Using cmd As New SqlCommand(query, sqlConnection)
            Dim reader = cmd.ExecuteReader()
            While reader.Read()
                drName.Text = reader("FName").ToString() & " " & reader("LName").ToString()
            End While
            reader.Close()
        End Using
    End Sub
    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        updateTimeLabel()
        Dim currentTime As DateTime = DateTime.Now
        If currentTime.Subtract(startTime).TotalMinutes >= 10 Then
            avaliable.Text = returnAvaliableUnits().ToString()
            disposaed.Text = returnDisposalUnits().ToString()
        End If
    End Sub

    Private Sub updateTimeLabel()
        timeLabel.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
    End Sub

    Private Sub closeButton_Click(sender As Object, e As EventArgs) Handles closeButton.Click
        sqlConnection.Close()
        loginForm.Close()
        Close()
    End Sub

    Private Function returnAvaliableUnits()
        Dim count As Integer = 0
        Dim query As String = "select count(UnitID) from BLOOD_UNIT where UnitID not in (select UnitID from BLOOD_EXECUTION);"
        Using cmd As New SqlCommand(query, sqlConnection)
            count = Convert.ToInt32(cmd.ExecuteScalar())
        End Using
        Return count
    End Function

    Private Function returnDisposalUnits()
        Dim count As Integer = 0
        Dim query As String = "select count(UnitID) from BLOOD_EXECUTION;"
        Using cmd As New SqlCommand(query, sqlConnection)
            count = Convert.ToInt32(cmd.ExecuteScalar())
        End Using
        Return count
    End Function

    Private Sub avaliable_Click(sender As Object, e As EventArgs) Handles avaliable.Click
        detailedUnitsForm.detailsList.Items.Clear()
        detailedUnitsForm.detailsList.Columns.Clear()
        Dim idealSize As Integer = detailedUnitsForm.detailsList.Width / 5
        detailedUnitsForm.detailsList.Columns.Add("Donated By", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Donation Date", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Amount (mL)", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Blood Type", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Saved By", idealSize)

        Dim query As String = "select DONOR.FName, DONOR.LName, DONOR.DonationDate, DONOR.DonationAmount, DONOR.BloodType, DONOR.RH_Factor, BLOOD_BANK.HeadName, BLOOD_BANK.Location 
                               from BLOOD_BANK, DONOR, BLOOD_UNIT, INVENTORY 
                               where (BLOOD_UNIT.UnitID not in (select BLOOD_EXECUTION.UnitID from BLOOD_EXECUTION)) and (BLOOD_UNIT.DonorID = DONOR.NationalID) and (BLOOD_UNIT.InventoryID = BLOOD_BANK.DepartmentID and BLOOD_UNIT.UnitID = INVENTORY.UnitID)"

        Using cmd As New SqlCommand(query, sqlConnection)
            Dim Reader = cmd.ExecuteReader()
            While Reader.Read()
                Dim donatedBy As String = Reader("FName").ToString() & " " & Reader("LName").ToString()
                Dim donationDate As String = Convert.ToDateTime(Reader("DonationDate")).ToShortDateString()
                Dim donationAmount As String = Reader("DonationAmount").ToString()
                Dim donatedBloodType As String = Reader("BloodType").ToString() & Reader("RH_Factor").ToString()
                Dim savedBy As String = Reader("HeadName").ToString() & " at " & Reader("Location").ToString()

                Dim record As New ListViewItem(donatedBy)
                record.SubItems.Add(donationDate)
                record.SubItems.Add(donationAmount)
                record.SubItems.Add(donatedBloodType)
                record.SubItems.Add(savedBy)

                detailedUnitsForm.detailsList.Items.Add(record)
            End While
            Reader.Close()
        End Using

        detailedUnitsForm.Show()
    End Sub

    Private Sub disposaed_Click(sender As Object, e As EventArgs) Handles disposaed.Click
        detailedUnitsForm.detailsList.Items.Clear()
        detailedUnitsForm.detailsList.Columns.Clear()
        Dim idealSize As Integer = detailedUnitsForm.detailsList.Width / 5
        detailedUnitsForm.detailsList.Columns.Add("Donated By", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Donation Date", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Amount (mL)", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Blood Type", idealSize)
        detailedUnitsForm.detailsList.Columns.Add("Disposed By", idealSize)

        Dim query As String = "select DONOR.FName, DONOR.LName, DONOR.DonationDate, DONOR.DonationAmount, DONOR.BloodType, DONOR.RH_Factor, BLOOD_DISPOSAL_DEPARTMENT.HeadName 
                               from BLOOD_DISPOSAL_DEPARTMENT, DONOR, BLOOD_UNIT, BLOOD_EXECUTION 
                               where (BLOOD_UNIT.UnitID in (select BLOOD_EXECUTION.UnitID from BLOOD_EXECUTION)) and (BLOOD_UNIT.DonorID = DONOR.NationalID) and (BLOOD_DISPOSAL_DEPARTMENT.DepartmentID = BLOOD_EXECUTION.DepartmentID and BLOOD_UNIT.UnitID = BLOOD_EXECUTION.UnitID)"

        Using cmd As New SqlCommand(query, sqlConnection)
            Dim Reader = cmd.ExecuteReader()
            While Reader.Read()
                Dim donatedBy As String = Reader("FName").ToString() & " " & Reader("LName").ToString()
                Dim donationDate As String = Convert.ToDateTime(Reader("DonationDate")).ToShortDateString()
                Dim donationAmount As String = Reader("DonationAmount").ToString()
                Dim donatedBloodType As String = Reader("BloodType").ToString() & Reader("RH_Factor").ToString()
                Dim disposedBy As String = Reader("HeadName").ToString()

                Dim record As New ListViewItem(donatedBy)
                record.SubItems.Add(donationDate)
                record.SubItems.Add(donationAmount)
                record.SubItems.Add(donatedBloodType)
                record.SubItems.Add(disposedBy)

                detailedUnitsForm.detailsList.Items.Add(record)
            End While
            Reader.Close()
        End Using

        detailedUnitsForm.Show()

    End Sub
End Class