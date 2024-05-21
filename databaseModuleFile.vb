Imports System.Data.SqlClient
Module databaseModuleFile
    Public sqlConnection As New SqlConnection("server = .; database = BloodBank; integrated security = true")
    Public userName As String
End Module
