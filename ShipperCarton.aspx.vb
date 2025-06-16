Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Serialization

Public Class ShipperCarton
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Page load logic if needed
    End Sub

    <WebMethod>
    Public Shared Sub GetShipperCartons()
        Try
            Dim connectionString As String = ConfigurationManager.ConnectionStrings("INDUS_ERP_Connection").ConnectionString
            Dim shipperCartons As New List(Of Dictionary(Of String, Object))()

            Using conn As New SqlConnection(connectionString)
                Dim query As String = "SELECT ItemCode, Name, NoOfPly, FluteType, SizeL, SizeW, SizeH, Supplier, SupplierReference, ShelfLife, MinimumStockQty, PurchaseUnit, PurchaseRate, StockUnit, StockType FROM ShipperCartons"
                Using cmd As New SqlCommand(query, conn)
                    conn.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        While reader.Read()
                            Dim row As New Dictionary(Of String, Object)()
                            row("ItemCode") = If(reader("ItemCode") IsNot DBNull.Value, reader("ItemCode").ToString(), "")
                            row("Name") = If(reader("Name") IsNot DBNull.Value, reader("Name").ToString(), "")
                            row("NoOfPly") = If(reader("NoOfPly") IsNot DBNull.Value, Convert.ToInt32(reader("NoOfPly")), 0)
                            row("FluteType") = If(reader("FluteType") IsNot DBNull.Value, reader("FluteType").ToString(), "")
                            row("SizeL") = If(reader("SizeL") IsNot DBNull.Value, Convert.ToInt32(reader("SizeL")), 0)
                            row("SizeW") = If(reader("SizeW") IsNot DBNull.Value, Convert.ToInt32(reader("SizeW")), 0)
                            row("SizeH") = If(reader("SizeH") IsNot DBNull.Value, Convert.ToInt32(reader("SizeH")), 0)
                            row("Supplier") = If(reader("Supplier") IsNot DBNull.Value, reader("Supplier").ToString(), "")
                            row("SupplierReference") = If(reader("SupplierReference") IsNot DBNull.Value, reader("SupplierReference").ToString(), "")
                            row("ShelfLife") = If(reader("ShelfLife") IsNot DBNull.Value, Convert.ToInt32(reader("ShelfLife")), 0)
                            row("MinimumStockQty") = If(reader("MinimumStockQty") IsNot DBNull.Value, Convert.ToInt32(reader("MinimumStockQty")), 0)
                            row("PurchaseUnit") = If(reader("PurchaseUnit") IsNot DBNull.Value, reader("PurchaseUnit").ToString(), "")
                            row("PurchaseRate") = If(reader("PurchaseRate") IsNot DBNull.Value, Convert.ToDouble(reader("PurchaseRate")), 0.0)
                            row("StockUnit") = If(reader("StockUnit") IsNot DBNull.Value, reader("StockUnit").ToString(), "")
                            row("StockType") = If(reader("StockType") IsNot DBNull.Value, reader("StockType").ToString(), "")
                            shipperCartons.Add(row)
                        End While
                    End Using
                End Using
            End Using

            ' Manually serialize the response
            Dim serializer As New JavaScriptSerializer()
            Dim json As String = serializer.Serialize(shipperCartons)
            HttpContext.Current.Response.ContentType = "application/json"
            HttpContext.Current.Response.Write(json)
            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.SuppressContent = True
            HttpContext.Current.ApplicationInstance.CompleteRequest()
        Catch ex As Exception
            ' Log the exception
            Dim logPath As String = HttpContext.Current.Server.MapPath("~/Logs/ShipperCartonError.txt")
            System.IO.File.WriteAllText(logPath, DateTime.Now.ToString() & " - Error in GetShipperCartons: " & ex.Message & vbCrLf & ex.StackTrace)
            ' Return an empty array in case of error
            Dim serializer As New JavaScriptSerializer()
            HttpContext.Current.Response.ContentType = "application/json"
            HttpContext.Current.Response.Write(serializer.Serialize(New List(Of Dictionary(Of String, Object))()))
            HttpContext.Current.Response.Flush()
            HttpContext.Current.Response.SuppressContent = True
            HttpContext.Current.ApplicationInstance.CompleteRequest()
        End Try
    End Sub

    <WebMethod>
    Public Shared Sub SaveShipperCarton(ByVal formData As Dictionary(Of String, Object))
        Try
            Dim connectionString As String = ConfigurationManager.ConnectionStrings("INDUS_ERP_Connection").ConnectionString

            Using conn As New SqlConnection(connectionString)
                Dim query As String = "INSERT INTO ShipperCartons (ItemCode, Name, NoOfPly, FluteType, SizeL, SizeW, SizeH, Supplier, SupplierReference, ShelfLife, MinimumStockQty, PurchaseUnit, PurchaseRate, StockUnit, StockType) " &
                                      "VALUES (@ItemCode, @Name, @NoOfPly, @FluteType, @SizeL, @SizeW, @SizeH, @Supplier, @SupplierReference, @ShelfLife, @MinimumStockQty, @PurchaseUnit, @PurchaseRate, @StockUnit, @StockType)"
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@ItemCode", "S" & Now.Ticks.ToString())
                    cmd.Parameters.AddWithValue("@Name", formData("Name").ToString())
                    cmd.Parameters.AddWithValue("@NoOfPly", Convert.ToInt32(formData("NoOfPly")))
                    cmd.Parameters.AddWithValue("@FluteType", formData("Flute").ToString())
                    cmd.Parameters.AddWithValue("@SizeL", If(formData("Length") IsNot Nothing, Convert.ToInt32(formData("Length")), 0))
                    cmd.Parameters.AddWithValue("@SizeW", If(formData("Width") IsNot Nothing, Convert.ToInt32(formData("Width")), 0))
                    cmd.Parameters.AddWithValue("@SizeH", If(formData("Height") IsNot Nothing, Convert.ToInt32(formData("Height")), 0))
                    cmd.Parameters.AddWithValue("@Supplier", formData("Supplier").ToString())
                    cmd.Parameters.AddWithValue("@SupplierReference", If(formData("SupplierReference") IsNot Nothing, formData("SupplierReference").ToString(), ""))
                    cmd.Parameters.AddWithValue("@ShelfLife", If(formData("ShelfLife") IsNot Nothing, Convert.ToInt32(formData("ShelfLife")), 0))
                    cmd.Parameters.AddWithValue("@MinimumStockQty", If(formData("MinimumStockQty") IsNot Nothing, Convert.ToInt32(formData("MinimumStockQty")), 0))
                    cmd.Parameters.AddWithValue("@PurchaseUnit", formData("PurchaseUnit").ToString())
                    cmd.Parameters.AddWithValue("@PurchaseRate", If(formData("PurchaseRate") IsNot Nothing, Convert.ToDouble(formData("PurchaseRate")), 0))
                    cmd.Parameters.AddWithValue("@StockUnit", formData("StockUnit").ToString())
                    cmd.Parameters.AddWithValue("@StockType", formData("StockType").ToString())

                    conn.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            ' Log the exception
            Dim logPath As String = HttpContext.Current.Server.MapPath("~/Logs/ShipperCartonError.txt")
            System.IO.File.WriteAllText(logPath, DateTime.Now.ToString() & " - Error in SaveShipperCarton: " & ex.Message & vbCrLf & ex.StackTrace)
            Throw
        End Try
    End Sub

    <WebMethod>
    Public Shared Sub DeleteShipperCarton(ByVal itemCode As String)
        Try
            Dim connectionString As String = ConfigurationManager.ConnectionStrings("INDUS_ERP_Connection").ConnectionString

            Using conn As New SqlConnection(connectionString)
                Dim query As String = "DELETE FROM ShipperCartons WHERE ItemCode = @ItemCode"
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@ItemCode", itemCode)
                    conn.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            ' Log the exception
            Dim logPath As String = HttpContext.Current.Server.MapPath("~/Logs/ShipperCartonError.txt")
            System.IO.File.WriteAllText(logPath, DateTime.Now.ToString() & " - Error in DeleteShipperCarton: " & ex.Message & vbCrLf & ex.StackTrace)
            Throw
        End Try
    End Sub
End Class