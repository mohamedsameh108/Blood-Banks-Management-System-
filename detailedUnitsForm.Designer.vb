<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class detailedUnitsForm
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(detailedUnitsForm))
        detailsList = New ListView()
        SuspendLayout()
        ' 
        ' detailsList
        ' 
        detailsList.Location = New Point(0, 0)
        detailsList.Name = "detailsList"
        detailsList.Size = New Size(800, 450)
        detailsList.TabIndex = 0
        detailsList.UseCompatibleStateImageBehavior = False
        detailsList.View = View.Details
        ' 
        ' detailedUnitsForm
        ' 
        AutoScaleDimensions = New SizeF(8F, 20F)
        AutoScaleMode = AutoScaleMode.Font
        ClientSize = New Size(800, 450)
        Controls.Add(detailsList)
        Icon = CType(resources.GetObject("$this.Icon"), Icon)
        MaximizeBox = False
        MaximumSize = New Size(818, 497)
        MinimumSize = New Size(818, 497)
        Name = "detailedUnitsForm"
        Text = "Details"
        ResumeLayout(False)
    End Sub

    Friend WithEvents detailsList As ListView
End Class
