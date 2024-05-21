Imports System.Data.SqlClient

Public Class loginForm
    Private Sub showPWButton_Click(sender As Object, e As EventArgs) Handles showPWButton.Click
        If passwordInput.UseSystemPasswordChar Then
            passwordInput.UseSystemPasswordChar = False
            showPWButton.Text = "Hide"
        Else
            passwordInput.UseSystemPasswordChar = True
            showPWButton.Text = "Show"
        End If
    End Sub

    Private Sub loginForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        sqlConnection.Open()
    End Sub

    Private Sub loginForm_Shown(sender As Object, e As EventArgs) Handles MyBase.Shown
        If My.Settings.rememberMe = True Then
            loginFunc(My.Settings.userName, My.Settings.Password)
        End If
    End Sub

    Private Sub loginButton_Click(sender As Object, e As EventArgs) Handles loginButton.Click
        If usernameInput.TextLength = 0 Or passwordInput.TextLength = 0 Or usernameInput.Text.Contains(";") Or passwordInput.Text.Contains(";") Then
            MsgBox("Please enter valid username and password", MsgBoxStyle.Exclamation)
        Else
            If rememberMeCheckBox.Checked = True Then
                My.Settings.rememberMe = True
                My.Settings.userName = usernameInput.Text
                My.Settings.Password = passwordInput.Text
                My.Settings.Save()
            End If
            loginFunc(usernameInput.Text, passwordInput.Text)
        End If
    End Sub
    Private Sub loginFunc(userName As String, password As String)
        Dim query As String = "select UserName, Password from MEDICAL_STAFF Where UserName = '" & userName & "' and Password = '" & password + "';"
        Using cmd As New SqlCommand(query, sqlConnection)
            Dim reader = cmd.ExecuteReader()
            If reader.HasRows = False Then
                MsgBox("Please enter valid username and password", MsgBoxStyle.Exclamation)
            Else
                databaseModuleFile.userName = userName
                reader.Close()
                Hide()
                dashBoardForm.Show()
            End If
        End Using
    End Sub
End Class
