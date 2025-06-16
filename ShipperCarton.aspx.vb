
Partial Public Class ShipperCarton
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Example: Accessing session data correctly
        Dim userId As String = Nothing
        If Session("UserId") IsNot Nothing Then
            userId = Session("UserId").ToString()
        End If

        ' Alternatively, using HttpContext.Current
        ' If HttpContext.Current IsNot Nothing AndAlso HttpContext.Current.Session("UserId") IsNot Nothing Then
        '     userId = HttpContext.Current.Session("UserId").ToString()
        ' End If
    End Sub
End Class
