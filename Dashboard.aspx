<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="ModernDashboard.Dashboard" MasterPageFile="~/Site.Master" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <%-- You can add page-specific <title>, <meta>, <link>, or <style> tags here if needed --%>
    <%-- For example: <title>Dashboard - My Application</title> --%>
</asp:Content>


<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-4">
        <!-- Top Summary Cards - First Row -->
        <div class="row">
            <!-- Quote Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100" style="border-left: 5px solid #4CAF50;">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs fw-bold text-uppercase mb-1" style="color: #4CAF50;">Quote</div>
                                <div class="h1 mb-0 fw-bold text-gray-800">198</div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="text-xs">This Month</div>
                                <div class="fw-bold">76</div>
                            </div>
                            <div class="col">
                                <div class="text-xs">Last Month</div>
                                <div class="fw-bold">11</div>
                            </div>
                            <div class="col-auto d-flex align-items-center">
                                <i class="fas fa-arrow-up text-success me-1"></i>
                                <span class="fw-bold text-success">65</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- New Order Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100" style="border-left: 5px solid #2196F3;">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs fw-bold text-uppercase mb-1" style="color: #2196F3;">New Order</div>
                                <div class="h1 mb-0 fw-bold text-gray-800">121</div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="text-xs">This Month</div>
                                <div class="fw-bold">41</div>
                            </div>
                            <div class="col">
                                <div class="text-xs">Last Month</div>
                                <div class="fw-bold">13</div>
                            </div>
                            <div class="col-auto d-flex align-items-center">
                                <i class="fas fa-arrow-up text-success me-1"></i>
                                <span class="fw-bold text-success">28</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Repeat Orders Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100" style="border-left: 5px solid #FF9800;">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs fw-bold text-uppercase mb-1" style="color: #FF9800;">Repeat Orders</div>
                                <div class="h1 mb-0 fw-bold text-gray-800">0</div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="text-xs">This Month</div>
                                <div class="fw-bold">0</div>
                            </div>
                            <div class="col">
                                <div class="text-xs">Last Month</div>
                                <div class="fw-bold">0</div>
                            </div>
                            <div class="col-auto d-flex align-items-center">
                                <!-- No arrow or neutral -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Job Cards Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100" style="border-left: 5px solid #E91E63;">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs fw-bold text-uppercase mb-1" style="color: #E91E63;">Job Cards</div>
                                <div class="h1 mb-0 fw-bold text-gray-800">81</div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="text-xs">This Month</div>
                                <div class="fw-bold">13</div>
                            </div>
                            <div class="col">
                                <div class="text-xs">Last Month</div>
                                <div class="fw-bold">9</div>
                            </div>
                            <div class="col-auto d-flex align-items-center">
                                <i class="fas fa-arrow-up text-success me-1"></i>
                                <span class="fw-bold text-success">4</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Summary Cards - Second Row -->
        <div class="row">
            <!-- GRN'S Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100" style="border-left: 5px solid #673AB7;">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs fw-bold text-uppercase mb-1" style="color: #673AB7;">GRN'S</div>
                                <div class="h1 mb-0 fw-bold text-gray-800">25</div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="text-xs">This Month</div>
                                <div class="fw-bold">7</div>
                            </div>
                            <div class="col">
                                <div class="text-xs">Last Month</div>
                                <div class="fw-bold">2</div>
                            </div>
                            <div class="col-auto d-flex align-items-center">
                                <i class="fas fa-arrow-up text-success me-1"></i>
                                <span class="fw-bold text-success">5</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Deliveries Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100" style="border-left: 5px solid #00BCD4;">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs fw-bold text-uppercase mb-1" style="color: #00BCD4;">Deliveries</div>
                                <div class="h1 mb-0 fw-bold text-gray-800">2</div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="text-xs">This Month</div>
                                <div class="fw-bold">0</div>
                            </div>
                            <div class="col">
                                <div class="text-xs">Last Month</div>
                                <div class="fw-bold">0</div>
                            </div>
                            <div class="col-auto d-flex align-items-center">
                                <!-- No arrow or neutral -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Empty columns for alignment if needed, or remove if only 2 cards in this row -->
            <div class="col-xl-3 col-md-6 mb-4 d-none d-xl-block"></div>
            <div class="col-xl-3 col-md-6 mb-4 d-none d-xl-block"></div>
        </div>

        <!-- Today's Activity Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h4 class="mb-3">Today's Activity</h4>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Total Quotes
                        <span class="badge bg-primary rounded-pill">0</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        New Orders
                        <span class="badge bg-primary rounded-pill">0</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Repeat Orders
                        <span class="badge bg-primary rounded-pill">0</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Job Cards
                        <span class="badge bg-primary rounded-pill">0</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        GRN's
                        <span class="badge bg-primary rounded-pill">0</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Deliveries
                        <span class="badge bg-primary rounded-pill">0</span>
                    </li>
                </ul>
            </div>
        </div>

        <!-- On Time Deliveries Summary Section -->
        <div class="row mt-5">
            <div class="col-12 text-center">
                <h4 class="mb-4">On Time Deliveries</h4>
            </div>
        </div>
        <div class="row text-center mb-4">
            <div class="col-md-3">
                <p class="text-muted mb-1">Total Order</p>
                <h3 class="fw-bold">121</h3>
            </div>
            <div class="col-md-3">
                <p class="text-success mb-1">On Time Order</p>
                <h3 class="fw-bold text-success">2</h3>
            </div>
            <div class="col-md-3">
                <p class="text-danger mb-1">Delayed Order</p>
                <h3 class="fw-bold text-danger">0</h3>
            </div>
            <div class="col-md-3">
                <p class="text-warning mb-1">Undelivered</p>
                <h3 class="fw-bold text-warning">119</h3>
            </div>
        </div>

        <!-- On Time Deliveries Filters -->
        <div class="card mt-4">
            <div class="card-body">
                <div class="row g-3 align-items-end">
                    <div class="col-md-3">
                        <label for="selectYear" class="form-label">Select a Year:</label>
                        <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-select">
                            <asp:ListItem Text="2024-2025" Value="2024-2025"></asp:ListItem>
                            <asp:ListItem Text="2023-2024" Value="2023-2024"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <label for="fromDate" class="form-label">From Date:</label>
                        <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="dd-mm-yyyy"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label for="toDate" class="form-label">To Date:</label>
                        <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="dd-mm-yyyy"></asp:TextBox>
                    </div>
                    <div class="col-md-3 d-flex align-items-end pb-1">
                        <div class="form-check form-check-inline">
                            <asp:RadioButton ID="rbOnTime" runat="server" GroupName="DeliveryStatus" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label" for="<%= rbOnTime.ClientID %>">OnTime</label>
                        </div>
                        <div class="form-check form-check-inline me-auto">
                            <asp:RadioButton ID="rbDelayed" runat="server" GroupName="DeliveryStatus" CssClass="form-check-input" />
                            <label class="form-check-label" for="<%= rbDelayed.ClientID %>">Delayed</label>
                        </div>
                        <asp:Button ID="btnReload" runat="server" Text="Reload" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>

        <!-- On Time Deliveries Table -->
        <div class="card mt-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                On Time Deliveries Data
                <asp:LinkButton ID="lbtnPrint" runat="server" CssClass="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-print"></i> Print
                </asp:LinkButton>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvOnTimeDeliveries" runat="server" CssClass="table table-striped table-bordered table-hover"
                        AutoGenerateColumns="False" EmptyDataText="No data available for the selected filters." ShowHeaderWhenEmpty="true">
                        <HeaderStyle CssClass="bg-dark-teal" />
                        <EmptyDataRowStyle CssClass="gridview-empty-data" />
                        <Columns>
                            <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
                            <asp:BoundField DataField="SalesOrderNo" HeaderText="Sales Order No" />
                            <asp:BoundField DataField="SalesOrderDate" HeaderText="Sales Order Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="ProductCode" HeaderText="Product Code" />
                            <asp:BoundField DataField="JobName" HeaderText="Job Name" />
                            <asp:BoundField DataField="ActualDeliveryDate" HeaderText="Actual Delivery Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="ExpDeliveryDate" HeaderText="Exp. Delivery Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="DateDifference" HeaderText="Date Difference" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Bottom Two Tables Section -->
        <div class="row mt-4">
            <!-- Pending Purchase Requisition Approvals Card -->
            <div class="col-lg-6 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-dark-teal text-white"> <%-- Use bg-dark-teal and ensure text-white if not inherited --%>
                        Pending Purchase Requisition Approvals
                    </div>
                    <div class="card-body p-0"> <%-- p-0 to remove padding if table-responsive handles it --%>
                        <div class="table-responsive">
                            <asp:GridView ID="gvPendingRequisitions" runat="server"
                                CssClass="table table-sm table-striped table-bordered table-hover mb-0" 
                                AutoGenerateColumns="False" EmptyDataText="No pending requisition approvals." ShowHeaderWhenEmpty="true">
                                <HeaderStyle CssClass="bg-dark-teal" />
                                <EmptyDataRowStyle CssClass="gridview-empty-data" />
                                <Columns>
                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Requisition No. <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterReqNo" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblRequisitionNo" runat="server" Text='<%# Eval("RequisitionNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Date <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterReqDate" runat="server" CssClass="form-control form-control-sm" placeholder="Select Date" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblRequisitionDate" runat="server" Text='<%# Eval("RequisitionDate", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Item Group <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterItemGroup" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemGroup" runat="server" Text='<%# Eval("ItemGroup") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Sub Group <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterSubGroup" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubGroup" runat="server" Text='<%# Eval("SubGroup") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Item Name <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterItemName" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="card-footer text-end">
                        <%-- Search button removed from footer as filters are in header. Add if still needed for global search --%>
                        <%-- <asp:TextBox ID="txtSearchRequisitions" runat="server" CssClass="form-control form-control-sm d-inline-block w-auto me-2" placeholder="Search..."></asp:TextBox> --%>
                        <%-- <asp:Button ID="btnSearchRequisitions" runat="server" Text="Search" CssClass="btn btn-sm btn-outline-primary" /> --%>
                    </div>
                </div>
            </div>

            <!-- Pending Purchase Order Approvals Card -->
            <div class="col-lg-6 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-dark-teal text-white">
                        Pending Purchase Order Approvals
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <asp:GridView ID="gvPendingPurchaseOrders" runat="server"
                                CssClass="table table-sm table-striped table-bordered table-hover mb-0"
                                AutoGenerateColumns="False" EmptyDataText="No pending purchase order approvals." ShowHeaderWhenEmpty="true">
                                <HeaderStyle CssClass="bg-dark-teal" />
                                <EmptyDataRowStyle CssClass="gridview-empty-data" />
                                <Columns>
                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Supplier Name <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterSupplierName" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSupplierName" runat="server" Text='<%# Eval("SupplierName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>P.O. No. <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterPONo" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPONo" runat="server" Text='<%# Eval("PONo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>P.O. Date <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterPODate" runat="server" CssClass="form-control form-control-sm" placeholder="Select Date" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPODate" runat="server" Text='<%# Eval("PODate", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Item Code <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterItemCode" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemCode" runat="server" Text='<%# Eval("ItemCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="text-nowrap">
                                        <HeaderTemplate>
                                            <div>Item Name <i class="fas fa-filter header-filter-icon"></i></div>
                                            <div class="mt-1">
                                                <asp:TextBox ID="txtFilterPOItemName" runat="server" CssClass="form-control form-control-sm" placeholder="Search..."></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPOItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                     <div class="card-footer text-end">
                        <%-- Search button removed from footer as filters are in header. Add if still needed for global search --%>
                        <%-- <asp:TextBox ID="txtSearchPurchaseOrders" runat="server" CssClass="form-control form-control-sm d-inline-block w-auto me-2" placeholder="Search..."></asp:TextBox> --%>
                        <%-- <asp:Button ID="btnSearchPurchaseOrders" runat="server" Text="Search" CssClass="btn btn-sm btn-outline-primary" /> --%>
                    </div>
                </div>
            </div>
        </div> <!-- End Bottom Two Tables Row -->

    </div> <!-- End container-fluid -->
</asp:Content>

<asp:Content ID="ContentScripts" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <%-- Page specific scripts can go here if needed --%>
</asp:Content>
