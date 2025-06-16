<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ShipperCarton.aspx.vb" Inherits="ModernDashboard.ShipperCarton" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page-specific head content -->
    <style type="text/css">
        /* Add page-specific styles if needed */
        .shipper-carton-heading {
            color: #2d6cdf;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Shipper Carton Page</h2>

    <!-- Include DevExtreme CSS and JS -->
    <link rel="stylesheet" href="https://cdn3.devexpress.com/jslib/23.1.3/css/dx.light.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn3.devexpress.com/jslib/23.1.3/js/dx.all.js"></script>
    <!-- Add DevExtreme.AspNet.Data library -->
    <script src="https://unpkg.com/devextreme-aspnet-data@2.9.2/js/dx.aspnet.data.js"></script>

    <!-- Custom CSS for Grid, Buttons, and Popup Styling -->
    <style>
        /* Custom styles for the DevExtreme DataGrid to match the INDUS ERP theme */
        .dx-datagrid {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        .dx-datagrid-headers {
            background-color: #2d6cdf !important; /* Blue shade from the heading */
            color: white !important;
            font-weight: 600;
        }

        .dx-header-row > td {
            border-right: 1px solid rgba(255, 255, 255, 0.2) !important;
        }

        /* Hover effect on headers */
        .dx-datagrid-headers .dx-datagrid-column:hover {
            background-color: #1a5bc8 !important;
        }

        /* Row styling */
        .dx-datagrid-rowsview .dx-row {
            transition: background-color 0.2s ease;
        }

        /* Alternating row colors */
        .dx-datagrid-rowsview .dx-row:nth-child(even) {
            background-color: #f8f9fa !important; /* Light gray for even rows */
        }

        .dx-datagrid-rowsview .dx-row:nth-child(odd) {
            background-color: #ffffff !important; /* White for odd rows */
        }

        /* Hover effect on rows */
        .dx-datagrid-rowsview .dx-row:hover {
            background-color: #e6f0fa !important; /* Light blue on hover */
        }

        /* Selected row */
        .dx-datagrid-rowsview .dx-selection {
            background-color: #19e6c1 !important; /* Teal/cyan from footer */
            color: #333 !important;
        }

        /* Search panel styling */
        .dx-datagrid-search-panel {
            background-color: #f1f3f5;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .dx-datagrid-search-panel input {
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        /* Filter row styling */
        .dx-datagrid-filter-row {
            background-color: #f8f9fa;
        }

        .dx-datagrid-filter-row .dx-editor-container {
            padding: 4px;
        }

        /* Column chooser button */
        .dx-datagrid-column-chooser-button {
            background-color: #2d6cdf !important;
            color: white !important;
        }

        /* Pager styling */
        .dx-datagrid-pager {
            background-color: #f1f3f5;
            border-top: 1px solid #dee2e6;
        }

        .dx-page-size, .dx-page {
            border-radius: 4px;
            margin: 0 2px;
        }

        .dx-page-size:hover, .dx-page:hover {
            background-color: #e6f0fa !important;
        }

        /* Active page */
        .dx-page.dx-selection {
            background-color: #2d6cdf !important;
            color: white !important;
        }

        /* Custom Button Styling (for buttons above the grid) */
        #buttonContainer {
            display: flex;
            gap: 10px; /* Space between buttons */
            margin-bottom: 20px;
        }

        .dx-button {
            border-radius: 6px !important;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1) !important;
            transition: all 0.2s ease !important;
            font-weight: 500 !important;
        }

        /* Create Button (Teal for positive action) */
        .dx-button.custom-create-button .dx-button-content {
            background-color: #19e6c1 !important; /* Teal from footer */
            color: #333 !important;
            border: none !important;
        }

        .dx-button.custom-create-button:hover .dx-button-content {
            background-color: #16d1ae !important; /* Slightly darker teal on hover */
        }

        /* Edit Button (Blue for primary action) */
        .dx-button.custom-edit-button .dx-button-content {
            background-color: #2d6cdf !important; /* Blue from grid header */
            color: white !important;
            border: none !important;
        }

        .dx-button.custom-edit-button:hover .dx-button-content {
            background-color: #1a5bc8 !important; /* Slightly darker blue on hover */
        }

        /* Delete Button (Red for destructive action) */
        .dx-button.custom-delete-button .dx-button-content {
            background-color: #ff5263 !important; /* Red from footer heart */
            color: white !important;
            border: none !important;
        }

        .dx-button.custom-delete-button:hover .dx-button-content {
            background-color: #e84a59 !important; /* Slightly darker red on hover */
        }

        /* View Details Button (Gray for neutral action) */
        .dx-button.custom-view-button .dx-button-content {
            background-color: #6c757d !important; /* Bootstrap secondary gray */
            color: white !important;
            border: none !important;
        }

        .dx-button.custom-view-button:hover .dx-button-content {
            background-color: #5c636a !important; /* Slightly darker gray on hover */
        }

        /* Popup Styling */
        .dx-popup-wrapper .dx-overlay-content {
            border-radius: 8px !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
            border: none !important;
        }

        /* Popup Title */
        .dx-popup-title {
            background-color: #2d6cdf !important; /* Match grid header */
            color: white !important;
            font-weight: 600 !important;
            padding: 12px 20px !important;
            border-top-left-radius: 8px !important;
            border-top-right-radius: 8px !important;
        }

        /* Popup Content */
        .dx-popup-content {
            padding: 20px !important;
            background-color: #ffffff !important;
        }

        /* Form Styling */
        .dx-form {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
        }

        .dx-field-item-label {
            font-weight: 500 !important;
            color: #333 !important;
        }

        .dx-field-item-content .dx-texteditor {
            border-radius: 4px !important;
            border: 1px solid #ced4da !important;
        }

        .dx-field-item-content .dx-texteditor-input {
            background-color: #f8f9fa !important; /* Light gray background for inputs */
            color: #333 !important;
            padding: 8px !important;
        }

        .dx-field-item-content .dx-texteditor-input:focus {
            background-color: #ffffff !important;
            border-color: #2d6cdf !important;
            box-shadow: 0 0 0 2px rgba(45, 108, 223, 0.2) !important;
        }

        /* SelectBox and CheckBox Styling */
        .dx-field-item-content .dx-selectbox .dx-texteditor-input {
            background-color: #f8f9fa !important;
        }

        .dx-field-item-content .dx-checkbox .dx-checkbox-icon {
            border-radius: 4px !important;
        }

        .dx-field-item-content .dx-checkbox.dx-checkbox-checked .dx-checkbox-icon {
            background-color: #2d6cdf !important;
            border-color: #2d6cdf !important;
        }

        /* Popup Buttons */
        .dx-popup-content .dx-button {
            margin-right: 10px !important;
        }

        /* New Button (Gray for neutral action) */
        .dx-popup-content .dx-button.custom-new-button .dx-button-content {
            background-color: #6c757d !important;
            color: white !important;
            border: none !important;
        }

        .dx-popup-content .dx-button.custom-new-button:hover .dx-button-content {
            background-color: #5c636a !important;
        }

        /* Save Button (Teal for positive action) */
        .dx-popup-content .dx-button.custom-save-button .dx-button-content {
            background-color: #19e6c1 !important;
            color: #333 !important;
            border: none !important;
        }

        .dx-popup-content .dx-button.custom-save-button:hover .dx-button-content {
            background-color: #16d1ae !important;
        }

        /* Save As Button (Teal for positive action) */
        .dx-popup-content .dx-button.custom-saveas-button .dx-button-content {
            background-color: #19e6c1 !important;
            color: #333 !important;
            border: none !important;
        }

        .dx-popup-content .dx-button.custom-saveas-button:hover .dx-button-content {
            background-color: #16d1ae !important;
        }

        /* Delete Button (Red for destructive action) */
        .dx-popup-content .dx-button.custom-popup-delete-button .dx-button-content {
            background-color: #ff5263 !important;
            color: white !important;
            border: none !important;
        }

        .dx-popup-content .dx-button.custom-popup-delete-button:hover .dx-button-content {
            background-color: #e84a59 !important;
        }
    </style>

    <!-- Buttons -->
    <div id="buttonContainer" style="margin-bottom: 20px;">
        <div id="createButton"></div>
        <div id="editButton"></div>
        <div id="deleteButton"></div>
        <div id="viewDetailsButton"></div>
    </div>

    <!-- DevExtreme DataGrid -->
    <div id="gridContainer" style="height: 500px;"></div>

    <!-- Modal Form (Popup) -->
    <div id="createPopup"></div>

    <script>
        $(function () {
            // DataGrid Configuration
            $("#gridContainer").dxDataGrid({
                dataSource: DevExpress.data.AspNet.createStore({
                    key: "ItemCode",
                    loadUrl: "ShipperCarton.aspx/GetShipperCartons",
                    loadMethod: "POST",
                    onBeforeSend: function (method, ajaxOptions) {
                        ajaxOptions.contentType = "application/json; charset=utf-8";
                        ajaxOptions.data = JSON.stringify({});
                    },
                    onAjaxError: function (e) {
                        console.log("AJAX Error in createStore:", e.xhr.responseText);
                        alert("Error loading data: " + e.xhr.responseText);
                    }
                }),
                columns: [
                    { dataField: "ItemCode", caption: "Item Code", width: 120 },
                    { dataField: "Name", caption: "Name", width: 150 },
                    { dataField: "NoOfPly", caption: "No Of Ply", width: 100 },
                    { dataField: "FluteType", caption: "Flute Type", width: 100 },
                    { dataField: "SizeL", caption: "Size L", width: 80 },
                    { dataField: "SizeW", caption: "Size W", width: 80 },
                    { dataField: "SizeH", caption: "Size H", width: 80 },
                    { dataField: "Supplier", caption: "Supplier", width: 150 },
                    { dataField: "SupplierReference", caption: "Supplier Reference", width: 150 },
                    { dataField: "ShelfLife", caption: "Shelf Life", width: 100 },
                    { dataField: "MinimumStockQty", caption: "Minimum Stock Qty", width: 120 },
                    { dataField: "PurchaseUnit", caption: "Purchase Unit", width: 120 },
                    { dataField: "PurchaseRate", caption: "Purchase Rate", width: 120 },
                    { dataField: "StockUnit", caption: "Stock Unit", width: 120 },
                    { dataField: "StockType", caption: "Stock Type", width: 150 }
                ],
                showBorders: true,
                searchPanel: {
                    visible: true,
                    placeholder: "Search...",
                    width: 240
                },
                sorting: {
                    mode: "multiple"
                },
                filterRow: {
                    visible: true,
                    applyFilter: "auto"
                },
                headerFilter: {
                    visible: true
                },
                columnChooser: {
                    enabled: true,
                    mode: "dragAndDrop"
                },
                columnResizingMode: "widget",
                allowColumnResizing: true,
                allowColumnReordering: true,
                paging: {
                    pageSize: 10
                },
                pager: {
                    showPageSizeSelector: true,
                    allowedPageSizes: [5, 10, 20],
                    showInfo: true,
                    showNavigationButtons: true
                },
                selection: {
                    mode: "single"
                },
                noDataText: "No shipper cartons found. Click 'Create' to add a new record.",
                scrolling: {
                    mode: "standard"
                }
            });

            // Create Button
            $("#createButton").dxButton({
                text: "Create",
                icon: "add",
                elementAttr: {
                    class: "custom-create-button" // Custom class for styling
                },
                onClick: function () {
                    $("#createPopup").dxPopup("show");
                }
            });

            // Edit Button
            $("#editButton").dxButton({
                text: "Edit",
                icon: "edit",
                elementAttr: {
                    class: "custom-edit-button"
                },
                onClick: function () {
                    var grid = $("#gridContainer").dxDataGrid("instance");
                    var selectedRow = grid.getSelectedRowsData()[0];
                    if (selectedRow) {
                        $("#createPopup").dxPopup("show");
                    } else {
                        alert("Please select a row to edit.");
                    }
                }
            });

            // Delete Button
            $("#deleteButton").dxButton({
                text: "Delete",
                icon: "trash",
                elementAttr: {
                    class: "custom-delete-button"
                },
                onClick: function () {
                    var grid = $("#gridContainer").dxDataGrid("instance");
                    var selectedRow = grid.getSelectedRowsData()[0];
                    if (selectedRow) {
                        if (confirm("Are you sure you want to delete this item?")) {
                            $.ajax({
                                url: "ShipperCarton.aspx/DeleteShipperCarton",
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify({ itemCode: selectedRow.ItemCode }),
                                success: function () {
                                    grid.refresh();
                                },
                                error: function (err) {
                                    alert("Error deleting item: " + err.responseText);
                                }
                            });
                        }
                    } else {
                        alert("Please select a row to delete.");
                    }
                }
            });

            // View Details Button
            $("#viewDetailsButton").dxButton({
                text: "View Details",
                icon: "info",
                elementAttr: {
                    class: "custom-view-button"
                },
                onClick: function () {
                    var grid = $("#gridContainer").dxDataGrid("instance");
                    var selectedRow = grid.getSelectedRowsData()[0];
                    if (selectedRow) {
                        alert(JSON.stringify(selectedRow));
                    } else {
                        alert("Please select a row to view details.");
                    }
                }
            });

            // Popup Form Configuration
            $("#createPopup").dxPopup({
                title: "Master Creation/Updation",
                visible: false,
                width: 800,
                height: 600,
                contentTemplate: function () {
                    return $("<div>").append(
                        $("<div>").dxForm({
                            formData: {},
                            items: [
                                { dataField: "Name", label: { text: "Name" }, editorOptions: { required: true } },
                                { dataField: "SubGroupName", label: { text: "Sub Group Name" }, editorType: "dxSelectBox", editorOptions: { items: ["xyz"], placeholder: "Select..." } },
                                { dataField: "NoOfPly", label: { text: "No Of Ply" }, editorType: "dxSelectBox", editorOptions: { items: [25], placeholder: "Select..." } },
                                { dataField: "Flute", label: { text: "Flute" }, editorType: "dxSelectBox", editorOptions: { items: ["23"], placeholder: "Select..." } },
                                { dataField: "Length", label: { text: "Length (Inch)" } },
                                { dataField: "Width", label: { text: "Width (Inch)" } },
                                { dataField: "Height", label: { text: "Height (Inch)" } },
                                { dataField: "Supplier", label: { text: "Supplier" }, editorType: "dxSelectBox", editorOptions: { items: ["xyz"], placeholder: "Select..." } },
                                { dataField: "SupplierReference", label: { text: "Supplier Reference" } },
                                { dataField: "CartonWt", label: { text: "Carton Wt (Kg)" } },
                                { dataField: "PurchaseUnit", label: { text: "Purchase Unit" }, editorType: "dxSelectBox", editorOptions: { items: ["SHEET"], placeholder: "Select..." } },
                                { dataField: "PurchaseRate", label: { text: "Purchase Rate" } },
                                { dataField: "ReOrderQty", label: { text: "Re-Order Qty" } },
                                { dataField: "ShelfLife", label: { text: "Shelf Life (Days)" } },
                                { dataField: "EstimationUnit", label: { text: "Estimation Unit" }, editorType: "dxSelectBox", editorOptions: { items: ["SHEET"], placeholder: "Select..." } },
                                { dataField: "EstimationRate", label: { text: "Estimation Rate" } },
                                { dataField: "StockUnit", label: { text: "Stock Unit" }, editorType: "dxSelectBox", editorOptions: { items: ["SHEET"], placeholder: "Select..." } },
                                { dataField: "MinimumStockQty", label: { text: "Min. Stock Qty" } },
                                { dataField: "StockType", label: { text: "Stock Type" }, editorType: "dxSelectBox", editorOptions: { items: ["JOB CONSUMABLE"], placeholder: "Select..." } },
                                { dataField: "StandardItem", label: { text: "Standard Item" }, editorType: "dxCheckBox" },
                                { dataField: "RegularItem", label: { text: "Regular Item" }, editorType: "dxCheckBox" },
                                { dataField: "HSNCode", label: { text: "HSN Code" }, editorType: "dxSelectBox", editorOptions: { placeholder: "Select..." } },
                                { dataField: "HSNDesc", label: { text: "HSN Desc" }, editorType: "dxSelectBox", editorOptions: { placeholder: "Select..." } },
                                { dataField: "LeadTime", label: { text: "Lead Time" } },
                                { dataField: "WeightCapacity", label: { text: "Weight Capacity (Kg)" } },
                                { dataField: "CFT", label: { text: "CFT" } },
                                { dataField: "CBM", label: { text: "CBM" } },
                                { dataField: "StockRefCode", label: { text: "Stock Ref Code" } },
                                { dataField: "TallyCode", label: { text: "Tally Code" } }
                            ]
                        }),
                        $("<div>").css("marginTop", "20px").append(
                            $("<div>").dxButton({
                                text: "New",
                                elementAttr: {
                                    class: "custom-new-button"
                                },
                                onClick: function () {
                                    $("#createPopup").dxPopup("instance").getContent().find(".dx-form").dxForm("instance").resetValues();
                                }
                            }),
                            $("<div>").dxButton({
                                text: "Save",
                                elementAttr: {
                                    class: "custom-save-button"
                                },
                                onClick: function () {
                                    var form = $("#createPopup").dxPopup("instance").getContent().find(".dx-form").dxForm("instance");
                                    var formData = form.option("formData");
                                    $.ajax({
                                        url: "ShipperCarton.aspx/SaveShipperCarton",
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        data: JSON.stringify(formData),
                                        success: function () {
                                            $("#createPopup").dxPopup("hide");
                                            $("#gridContainer").dxDataGrid("instance").refresh();
                                        },
                                        error: function (err) {
                                            alert("Error saving item: " + err.responseText);
                                        }
                                    });
                                }
                            }),
                            $("<div>").dxButton({
                                text: "Save As",
                                elementAttr: {
                                    class: "custom-saveas-button"
                                },
                                onClick: function () {
                                    alert("Save As functionality not implemented.");
                                }
                            }),
                            $("<div>").dxButton({
                                text: "Delete",
                                elementAttr: {
                                    class: "custom-popup-delete-button"
                                },
                                onClick: function () {
                                    alert("Delete functionality not implemented in modal.");
                                }
                            })
                        )
                    );
                }
            });
        });
    </script>
</asp:Content>