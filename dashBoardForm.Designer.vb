<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class dashBoardForm
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        components = New ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(dashBoardForm))
        userIcon = New PictureBox()
        currentTimeLabel = New Label()
        timeLabel = New Label()
        logOutIcon = New PictureBox()
        Timer1 = New Timer(components)
        closeButton = New PictureBox()
        avaliable = New Button()
        disposaed = New Button()
        Button3 = New Button()
        Label1 = New Label()
        Label2 = New Label()
        Label4 = New Label()
        drName = New Label()
        myRecords = New Button()
        newUnitButton = New Button()
        testUnitButton = New Button()
        CType(userIcon, ComponentModel.ISupportInitialize).BeginInit()
        CType(logOutIcon, ComponentModel.ISupportInitialize).BeginInit()
        CType(closeButton, ComponentModel.ISupportInitialize).BeginInit()
        SuspendLayout()
        ' 
        ' userIcon
        ' 
        userIcon.Image = My.Resources.Resources.userIcon
        userIcon.Location = New Point(0, 0)
        userIcon.Name = "userIcon"
        userIcon.Size = New Size(99, 62)
        userIcon.SizeMode = PictureBoxSizeMode.Zoom
        userIcon.TabIndex = 1
        userIcon.TabStop = False
        ' 
        ' currentTimeLabel
        ' 
        currentTimeLabel.AutoSize = True
        currentTimeLabel.BackColor = Color.Transparent
        currentTimeLabel.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        currentTimeLabel.Location = New Point(105, 11)
        currentTimeLabel.Name = "currentTimeLabel"
        currentTimeLabel.Size = New Size(141, 28)
        currentTimeLabel.TabIndex = 4
        currentTimeLabel.Text = "Current Time:"
        ' 
        ' timeLabel
        ' 
        timeLabel.AutoSize = True
        timeLabel.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        timeLabel.Location = New Point(241, 11)
        timeLabel.Name = "timeLabel"
        timeLabel.Size = New Size(74, 28)
        timeLabel.TabIndex = 5
        timeLabel.Text = "Label2"
        ' 
        ' logOutIcon
        ' 
        logOutIcon.Image = My.Resources.Resources.logoutIcon
        logOutIcon.Location = New Point(0, 339)
        logOutIcon.Name = "logOutIcon"
        logOutIcon.Size = New Size(99, 62)
        logOutIcon.SizeMode = PictureBoxSizeMode.Zoom
        logOutIcon.TabIndex = 6
        logOutIcon.TabStop = False
        ' 
        ' Timer1
        ' 
        ' 
        ' closeButton
        ' 
        closeButton.Image = My.Resources.Resources.closeIcon1
        closeButton.Location = New Point(703, 0)
        closeButton.Name = "closeButton"
        closeButton.Size = New Size(99, 62)
        closeButton.SizeMode = PictureBoxSizeMode.Zoom
        closeButton.TabIndex = 7
        closeButton.TabStop = False
        ' 
        ' avaliable
        ' 
        avaliable.BackColor = Color.LawnGreen
        avaliable.FlatAppearance.BorderColor = Color.White
        avaliable.FlatAppearance.BorderSize = 2
        avaliable.FlatStyle = FlatStyle.Flat
        avaliable.Font = New Font("Segoe UI", 16.2F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        avaliable.Location = New Point(105, 84)
        avaliable.Name = "avaliable"
        avaliable.Size = New Size(210, 67)
        avaliable.TabIndex = 8
        avaliable.Text = "Button1"
        avaliable.UseVisualStyleBackColor = False
        ' 
        ' disposaed
        ' 
        disposaed.BackColor = Color.DarkRed
        disposaed.FlatAppearance.BorderColor = Color.White
        disposaed.FlatAppearance.BorderSize = 2
        disposaed.FlatStyle = FlatStyle.Flat
        disposaed.Font = New Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        disposaed.Location = New Point(358, 84)
        disposaed.Name = "disposaed"
        disposaed.Size = New Size(210, 67)
        disposaed.TabIndex = 9
        disposaed.Text = "Button2"
        disposaed.UseVisualStyleBackColor = False
        ' 
        ' Button3
        ' 
        Button3.FlatAppearance.BorderSize = 0
        Button3.FlatStyle = FlatStyle.Flat
        Button3.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        Button3.Location = New Point(574, 75)
        Button3.Name = "Button3"
        Button3.Size = New Size(228, 34)
        Button3.TabIndex = 10
        Button3.Text = "Search in Database"
        Button3.UseVisualStyleBackColor = True
        ' 
        ' Label1
        ' 
        Label1.AutoSize = True
        Label1.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        Label1.Location = New Point(116, 53)
        Label1.Name = "Label1"
        Label1.Size = New Size(183, 28)
        Label1.TabIndex = 11
        Label1.Text = "Units in Inventory"
        ' 
        ' Label2
        ' 
        Label2.AutoSize = True
        Label2.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        Label2.Location = New Point(400, 53)
        Label2.Name = "Label2"
        Label2.Size = New Size(147, 28)
        Label2.TabIndex = 12
        Label2.Text = "Disposal Units"
        ' 
        ' Label4
        ' 
        Label4.AutoSize = True
        Label4.Font = New Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        Label4.Location = New Point(0, 65)
        Label4.Name = "Label4"
        Label4.Size = New Size(98, 20)
        Label4.TabIndex = 14
        Label4.Text = "Welcome Dr."
        ' 
        ' drName
        ' 
        drName.AutoSize = True
        drName.Font = New Font("Segoe UI", 9F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        drName.Location = New Point(0, 85)
        drName.Name = "drName"
        drName.Size = New Size(103, 20)
        drName.TabIndex = 15
        drName.Text = "James Brown"
        ' 
        ' myRecords
        ' 
        myRecords.BackColor = Color.Transparent
        myRecords.FlatAppearance.BorderSize = 0
        myRecords.FlatStyle = FlatStyle.Flat
        myRecords.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        myRecords.Location = New Point(574, 115)
        myRecords.Name = "myRecords"
        myRecords.Size = New Size(228, 38)
        myRecords.TabIndex = 16
        myRecords.Text = "Search in My Records"
        myRecords.UseVisualStyleBackColor = False
        ' 
        ' newUnitButton
        ' 
        newUnitButton.FlatAppearance.BorderSize = 0
        newUnitButton.FlatStyle = FlatStyle.Flat
        newUnitButton.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        newUnitButton.Location = New Point(105, 182)
        newUnitButton.Name = "newUnitButton"
        newUnitButton.Size = New Size(228, 34)
        newUnitButton.TabIndex = 17
        newUnitButton.Text = "Add New Unit"
        newUnitButton.UseVisualStyleBackColor = True
        ' 
        ' testUnitButton
        ' 
        testUnitButton.FlatAppearance.BorderSize = 0
        testUnitButton.FlatStyle = FlatStyle.Flat
        testUnitButton.Font = New Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        testUnitButton.Location = New Point(358, 182)
        testUnitButton.Name = "testUnitButton"
        testUnitButton.Size = New Size(228, 34)
        testUnitButton.TabIndex = 18
        testUnitButton.Text = "Send a Test Unit"
        testUnitButton.UseVisualStyleBackColor = True
        ' 
        ' dashBoardForm
        ' 
        AutoScaleDimensions = New SizeF(8F, 20F)
        AutoScaleMode = AutoScaleMode.Font
        ClientSize = New Size(800, 400)
        ControlBox = False
        Controls.Add(testUnitButton)
        Controls.Add(newUnitButton)
        Controls.Add(myRecords)
        Controls.Add(drName)
        Controls.Add(Label4)
        Controls.Add(Label2)
        Controls.Add(Label1)
        Controls.Add(Button3)
        Controls.Add(disposaed)
        Controls.Add(avaliable)
        Controls.Add(closeButton)
        Controls.Add(logOutIcon)
        Controls.Add(timeLabel)
        Controls.Add(currentTimeLabel)
        Controls.Add(userIcon)
        FormBorderStyle = FormBorderStyle.None
        Icon = CType(resources.GetObject("$this.Icon"), Icon)
        MaximizeBox = False
        MaximumSize = New Size(800, 400)
        MinimumSize = New Size(800, 400)
        Name = "dashBoardForm"
        Text = "DashBoard"
        CType(userIcon, ComponentModel.ISupportInitialize).EndInit()
        CType(logOutIcon, ComponentModel.ISupportInitialize).EndInit()
        CType(closeButton, ComponentModel.ISupportInitialize).EndInit()
        ResumeLayout(False)
        PerformLayout()
    End Sub
    Friend WithEvents userIcon As PictureBox
    Friend WithEvents currentTimeLabel As Label
    Friend WithEvents timeLabel As Label
    Friend WithEvents logOutIcon As PictureBox
    Friend WithEvents Timer1 As Timer
    Friend WithEvents closeButton As PictureBox
    Friend WithEvents avaliable As Button
    Friend WithEvents disposaed As Button
    Friend WithEvents Button3 As Button
    Friend WithEvents Label1 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents Label4 As Label
    Friend WithEvents drName As Label
    Friend WithEvents myRecords As Button
    Friend WithEvents newUnitButton As Button
    Friend WithEvents testUnitButton As Button
End Class
