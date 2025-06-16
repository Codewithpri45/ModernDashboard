
Partial Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub btnConfirmLogout_Click(sender As Object, e As EventArgs)
        ' Perform actual logout operations here
        ' Example: Clear session, Forms Authentication sign out, etc.
        Session.Clear()
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()

        ' Redirect to login page or home page
        Response.Redirect("~/Dashboard.aspx") ' Replace with your actual login page
    End Sub
End Class