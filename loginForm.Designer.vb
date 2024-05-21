<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class loginForm
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(loginForm))
        usernameInput = New TextBox()
        passwordInput = New TextBox()
        loginButton = New Button()
        forgotPWButton = New Button()
        rememberMeCheckBox = New CheckBox()
        showPWIcon = New PictureBox()
        showPWButton = New Button()
        CType(showPWIcon, ComponentModel.ISupportInitialize).BeginInit()
        SuspendLayout()
        ' 
        ' usernameInput
        ' 
        usernameInput.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Left Or AnchorStyles.Right
        usernameInput.Location = New Point(190, 171)
        usernameInput.Name = "usernameInput"
        usernameInput.PlaceholderText = "Username"
        usernameInput.Size = New Size(305, 27)
        usernameInput.TabIndex = 1
        ' 
        ' passwordInput
        ' 
        passwordInput.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Left Or AnchorStyles.Right
        passwordInput.BorderStyle = BorderStyle.None
        passwordInput.Location = New Point(190, 207)
        passwordInput.Name = "passwordInput"
        passwordInput.PlaceholderText = "Password"
        passwordInput.Size = New Size(255, 20)
        passwordInput.TabIndex = 2
        passwordInput.UseSystemPasswordChar = True
        ' 
        ' loginButton
        ' 
        loginButton.BackColor = Color.Transparent
        loginButton.FlatAppearance.BorderSize = 0
        loginButton.FlatAppearance.CheckedBackColor = Color.Transparent
        loginButton.FlatAppearance.MouseDownBackColor = Color.Transparent
        loginButton.FlatAppearance.MouseOverBackColor = Color.Transparent
        loginButton.FlatStyle = FlatStyle.Flat
        loginButton.Font = New Font("Segoe UI", 19.8000011F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        loginButton.ForeColor = SystemColors.Desktop
        loginButton.Location = New Point(190, 249)
        loginButton.Name = "loginButton"
        loginButton.Size = New Size(140, 53)
        loginButton.TabIndex = 3
        loginButton.Text = "Login"
        loginButton.UseVisualStyleBackColor = False
        ' 
        ' forgotPWButton
        ' 
        forgotPWButton.BackColor = Color.Transparent
        forgotPWButton.BackgroundImageLayout = ImageLayout.None
        forgotPWButton.FlatAppearance.BorderSize = 0
        forgotPWButton.FlatAppearance.CheckedBackColor = Color.Transparent
        forgotPWButton.FlatAppearance.MouseDownBackColor = Color.Transparent
        forgotPWButton.FlatAppearance.MouseOverBackColor = Color.Transparent
        forgotPWButton.FlatStyle = FlatStyle.Flat
        forgotPWButton.Font = New Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, CByte(0))
        forgotPWButton.ForeColor = SystemColors.Desktop
        forgotPWButton.Location = New Point(361, 233)
        forgotPWButton.Name = "forgotPWButton"
        forgotPWButton.Size = New Size(166, 34)
        forgotPWButton.TabIndex = 4
        forgotPWButton.Text = "Forgot Password"
        forgotPWButton.UseVisualStyleBackColor = False
        ' 
        ' rememberMeCheckBox
        ' 
        rememberMeCheckBox.AutoSize = True
        rememberMeCheckBox.BackColor = Color.Transparent
        rememberMeCheckBox.FlatAppearance.BorderSize = 0
        rememberMeCheckBox.FlatAppearance.CheckedBackColor = Color.Transparent
        rememberMeCheckBox.FlatAppearance.MouseDownBackColor = Color.Transparent
        rememberMeCheckBox.FlatAppearance.MouseOverBackColor = Color.Transparent
        rememberMeCheckBox.Font = New Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point, CByte(0))
        rememberMeCheckBox.ForeColor = SystemColors.Desktop
        rememberMeCheckBox.Location = New Point(336, 267)
        rememberMeCheckBox.Name = "rememberMeCheckBox"
        rememberMeCheckBox.Size = New Size(191, 35)
        rememberMeCheckBox.TabIndex = 5
        rememberMeCheckBox.Text = "Remember Me"
        rememberMeCheckBox.UseVisualStyleBackColor = False
        ' 
        ' showPWIcon
        ' 
        showPWIcon.BackColor = Color.Transparent
        showPWIcon.BackgroundImageLayout = ImageLayout.None
        showPWIcon.ErrorImage = Nothing
        showPWIcon.Image = My.Resources.Resources.icon
        showPWIcon.Location = New Point(298, 84)
        showPWIcon.Name = "showPWIcon"
        showPWIcon.Size = New Size(111, 81)
        showPWIcon.SizeMode = PictureBoxSizeMode.StretchImage
        showPWIcon.TabIndex = 7
        showPWIcon.TabStop = False
        ' 
        ' showPWButton
        ' 
        showPWButton.BackColor = Color.Transparent
        showPWButton.BackgroundImageLayout = ImageLayout.None
        showPWButton.FlatAppearance.BorderSize = 0
        showPWButton.FlatAppearance.MouseDownBackColor = Color.Transparent
        showPWButton.FlatAppearance.MouseOverBackColor = Color.Transparent
        showPWButton.FlatStyle = FlatStyle.Flat
        showPWButton.Font = New Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, CByte(0))
        showPWButton.ForeColor = SystemColors.Desktop
        showPWButton.Location = New Point(451, 199)
        showPWButton.Name = "showPWButton"
        showPWButton.Size = New Size(76, 31)
        showPWButton.TabIndex = 8
        showPWButton.Text = "Show"
        showPWButton.UseVisualStyleBackColor = False
        ' 
        ' loginForm
        ' 
        AutoScaleMode = AutoScaleMode.None
        BackColor = Color.White
        BackgroundImage = My.Resources.Resources.login
        ClientSize = New Size(694, 377)
        Controls.Add(showPWButton)
        Controls.Add(showPWIcon)
        Controls.Add(rememberMeCheckBox)
        Controls.Add(forgotPWButton)
        Controls.Add(loginButton)
        Controls.Add(passwordInput)
        Controls.Add(usernameInput)
        Icon = CType(resources.GetObject("$this.Icon"), Icon)
        MaximizeBox = False
        MaximumSize = New Size(712, 424)
        MinimumSize = New Size(712, 424)
        Name = "loginForm"
        Text = "Blood Bank Login"
        CType(showPWIcon, ComponentModel.ISupportInitialize).EndInit()
        ResumeLayout(False)
        PerformLayout()
    End Sub
    Friend WithEvents usernameInput As TextBox
    Friend WithEvents passwordInput As TextBox
    Friend WithEvents loginButton As Button
    Friend WithEvents forgotPWButton As Button
    Friend WithEvents rememberMeCheckBox As CheckBox
    Friend WithEvents showPWIcon As PictureBox
    Friend WithEvents showPWButton As Button

End Class
