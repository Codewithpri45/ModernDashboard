<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="ModernDashboard.Dashboard" MasterPageFile="~/Site.Master" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <%-- You can add page-specific <title>, <meta>, <link>, or <style> tags here if needed --%>
    <%-- For example: <title>Dashboard - My Application</title> --%>
        <link href="<%: ResolveUrl("~/Styles/dashboard-modern.css") %>" rel="stylesheet" />

</asp:Content>


<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
      <div class="dashboard-hero mb-4 rounded-4 shadow-sm px-4 py-4 d-flex align-items-center dashboard-hero-gradient">
        <div>
            <h2 class="fw-bold text-white mb-1">Welcome, <span class="gradient-text">Admin</span>!</h2>
            <div class="text-white-50 fs-5">Your <span class="fw-semibold">indus</span> dashboard at a glance.</div>
        </div>
        <div class="ms-auto d-none d-md-block">
            <i class="fas fa-chart-pie fa-3x text-white-50"></i>
        </div>
    </div>

    <!-- Colorful Modern Cards, 4 per row, with hover effect -->
    <div class="dashboard-card-grid mb-4">
        <div class="dashcard dashcard-accent">
            <div class="dashcard-label">QUOTE</div>
            <div class="dashcard-value">198</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>76</b>&nbsp;&nbsp; Last Month: <b>11</b>
            </div>
        </div>
        <div class="dashcard dashcard-blue">
            <div class="dashcard-label">NEW ORDER</div>
            <div class="dashcard-value">121</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>41</b>&nbsp;&nbsp; Last Month: <b>13</b>
            </div>
        </div>
        <div class="dashcard dashcard-orange">
            <div class="dashcard-label">REPEAT ORDERS</div>
            <div class="dashcard-value">10</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>3</b>&nbsp;&nbsp; Last Month: <b>2</b>
            </div>
        </div>
        <div class="dashcard dashcard-pink">
            <div class="dashcard-label">JOB CARDS</div>
            <div class="dashcard-value">81</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>13</b>&nbsp;&nbsp; Last Month: <b>9</b>
            </div>
        </div>
        <div class="dashcard dashcard-purple">
            <div class="dashcard-label">GRN'S</div>
            <div class="dashcard-value">25</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>7</b>&nbsp;&nbsp; Last Month: <b>2</b>
            </div>
        </div>
        <div class="dashcard dashcard-cyan">
            <div class="dashcard-label">DELIVERIES</div>
            <div class="dashcard-value">2</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>0</b>&nbsp;&nbsp; Last Month: <b>0</b>
            </div>
        </div>
        <div class="dashcard dashcard-yellow">
            <div class="dashcard-label">INVOICES <span class="badge badge-yellow">+13%</span></div>
            <div class="dashcard-value">34</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>9</b>&nbsp;&nbsp; Last Month: <b>5</b>
            </div>
        </div>
        <div class="dashcard dashcard-green">
            <div class="dashcard-label">COLLECTIONS <span class="badge badge-green">+7%</span></div>
            <div class="dashcard-value">27</div>
            <div class="dashcard-meta">
                <span>This Month:</span> <b>6</b>&nbsp;&nbsp; Last Month: <b>3</b>
            </div>
        </div>
    </div>

    <!-- On Time Deliveries Summary -->
    <div class="row mt-5">
        <div class="col-12 text-center">
            <h4 class="mb-4 gradient-text">On Time Deliveries</h4>
        </div>
    </div>
    <div class="row text-center mb-4 g-3">
        <div class="col-md-3">
            <div class="card border-0 shadow-sm gradient-blue">
                <div class="card-body py-3">
                    <p class="text-muted mb-1">Total Order</p>
                    <h3 class="fw-bold text-blue">121</h3>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm gradient-green">
                <div class="card-body py-3">
                    <p class="text-success mb-1">On Time Order</p>
                    <h3 class="fw-bold text-green">2</h3>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm gradient-pink">
                <div class="card-body py-3">
                    <p class="text-danger mb-1">Delayed Order</p>
                    <h3 class="fw-bold text-danger">3</h3>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm gradient-orange">
                <div class="card-body py-3">
                    <p class="text-warning mb-1">Undelivered</p>
                    <h3 class="fw-bold text-warning">119</h3>
                </div>
            </div>
        </div>
    </div>

    <!-- On Time Deliveries Filters -->
    <div class="card border-0 shadow-sm mb-4 gradient-fade">
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
                    <asp:Button ID="btnReload" runat="server" Text="Reload" CssClass="btn btn-gradient" />
                </div>
            </div>
        </div>
    </div>

    <!-- On Time Deliveries Table - With Random Data -->
    <div class="card border-0 shadow-sm mb-4">
        <div class="card-header d-flex justify-content-between align-items-center gradient-activity text-white fw-bold">
            On Time Deliveries Data
            <asp:LinkButton ID="lbtnPrint" runat="server" CssClass="btn btn-sm btn-outline-light">
                <i class="fas fa-print"></i> Print
            </asp:LinkButton>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover table-modern">
                    <thead class="bg-gradient-fade text-white">
                        <tr>
                            <th>Client Name</th>
                            <th>Sales Order No</th>
                            <th>Sales Order Date</th>
                            <th>Product Code</th>
                            <th>Job Name</th>
                            <th>Actual Delivery Date</th>
                            <th>Exp. Delivery Date</th>
                            <th>Date Difference</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Acme Corp</td>
                            <td>SO-2024-0012</td>
                            <td>21-Apr-2025</td>
                            <td>P-1001</td>
                            <td>Packaging Box</td>
                            <td>27-Apr-2025</td>
                            <td>28-Apr-2025</td>
                            <td class="text-success">-1</td>
                        </tr>
                        <tr>
                            <td>Beta Inc.</td>
                            <td>SO-2024-0034</td>
                            <td>11-May-2025</td>
                            <td>P-1023</td>
                            <td>Label Roll</td>
                            <td>15-May-2025</td>
                            <td>16-May-2025</td>
                            <td class="text-success">-1</td>
                        </tr>
                        <tr>
                            <td>Gamma Ltd.</td>
                            <td>SO-2024-0045</td>
                            <td>15-May-2025</td>
                            <td>P-1052</td>
                            <td>Mono Carton</td>
                            <td>25-May-2025</td>
                            <td>24-May-2025</td>
                            <td class="text-danger">+1</td>
                        </tr>
                        <tr>
                            <td>Acme Corp</td>
                            <td>SO-2024-0056</td>
                            <td>25-May-2025</td>
                            <td>P-1087</td>
                            <td>Flexo Label</td>
                            <td>29-May-2025</td>
                            <td>29-May-2025</td>
                            <td class="text-success">0</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Bottom Two Tables Section - After On Time Deliveries Table -->
    <div class="row g-4 mb-4">
        <div class="col-lg-6">
            <div class="card border-0 shadow-sm gradient-blue-light h-100">
                <div class="card-header fw-bold text-white gradient-blue border-0">
                    Pending Purchase Requisition Approvals
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-sm table-striped table-hover table-modern mb-0">
                            <thead class="bg-gradient-blue text-white">
                                <tr>
                                    <th>Requisition No.</th>
                                    <th>Requisition Date</th>
                                    <th>Item Code</th>
                                    <th>Item Group</th>
                                    <th>Sub Group</th>
                                    <th>Item Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>REQ-1022</td>
                                    <td>14-May-2025</td>
                                    <td>IC-201</td>
                                    <td>Raw Material</td>
                                    <td>Paper</td>
                                    <td>Duplex Board</td>
                                </tr>
                                <tr>
                                    <td>REQ-1024</td>
                                    <td>18-May-2025</td>
                                    <td>IC-203</td>
                                    <td>Consumable</td>
                                    <td>Adhesive</td>
                                    <td>Glue Stick</td>
                                </tr>
                                <tr>
                                    <td>REQ-1031</td>
                                    <td>22-May-2025</td>
                                    <td>IC-210</td>
                                    <td>Spare</td>
                                    <td>Roller</td>
                                    <td>Rubber Roller</td>
                                </tr>
                                <tr>
                                    <td>REQ-1036</td>
                                    <td>27-May-2025</td>
                                    <td>IC-214</td>
                                    <td>Raw Material</td>
                                    <td>Ink</td>
                                    <td>Black Ink</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card border-0 shadow-sm gradient-pink-light h-100">
                <div class="card-header fw-bold text-white gradient-pink border-0">
                    Pending Purchase Order Approvals
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-sm table-striped table-hover table-modern mb-0">
                            <thead class="bg-gradient-pink text-white">
                                <tr>
                                    <th>Supplier Name</th>
                                    <th>P.O. No.</th>
                                    <th>P.O. Date</th>
                                    <th>Item Code</th>
                                    <th>Item Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>PaperHub</td>
                                    <td>PO-3021</td>
                                    <td>16-May-2025</td>
                                    <td>IC-201</td>
                                    <td>Duplex Board</td>
                                </tr>
                                <tr>
                                    <td>GlueWorks</td>
                                    <td>PO-3025</td>
                                    <td>19-May-2025</td>
                                    <td>IC-203</td>
                                    <td>Glue Stick</td>
                                </tr>
                                <tr>
                                    <td>RollerPro</td>
                                    <td>PO-3031</td>
                                    <td>23-May-2025</td>
                                    <td>IC-210</td>
                                    <td>Rubber Roller</td>
                                </tr>
                                <tr>
                                    <td>InkMaster</td>
                                    <td>PO-3036</td>
                                    <td>28-May-2025</td>
                                    <td>IC-214</td>
                                    <td>Black Ink</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ContentScripts" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server"></asp:Content>