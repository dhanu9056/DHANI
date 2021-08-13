<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="Pro_Purchase.aspx.cs" Inherits="Gk_Cake_shop.Purchase"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="#"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
                    </div>
                </div>
            </div>
             <div class="single-pro-review-area mt-t-30 mg-b-15">
                   <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="product-payment-inner-st">
                                     <div id="myTabContent" class="tab-content custom-product-edit">
                                          <div class="product-tab-list tab-pane fade active in" id="description">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="review-content-section">
                                                        <div id="dropzone1" class="pro-ad addcoursepro">
                                                            <div class="row">
                                                                <div class="form-group col-lg-9">
                                                                    <h1>Purchase Bill</h1>
                                                                    
                                                                 </div>
                                                                </div>
                                                            </div>
                                                            <asp:Label ID="lbl_Error" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                            <asp:Label ID="lbl_Message" runat="server" ForeColor="Green" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>

                                                                <asp:validationsummary runat="server" ValidationGroup="Bill" CssClass="alert alert-danger" />
                                                                <div class="row">
                                                                    <div class="form-group col-lg-3">
                                                                       <asp:Label ID="lbl_PuchaseBillNo" runat="server" Text="Bill No" Font-Bold="true"></asp:Label>
                                                                       <asp:TextBox ID="txt_PurchaseBillNo" runat="server" Class="form-control"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_PurchaseBillNo" 
                                                                            ErrorMessage="Please Enter the Bill No" ValidationGroup="Bill" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <div class="form-group col-lg-3">
                                                                       <asp:Label ID="lbl_PurchaseBillDate" runat="server" Text="Bill Date" Font-Bold="true"></asp:Label>
                                                                       <asp:TextBox ID="txt_PurchaseBillDate" runat="server" TextMode="Date" Class="datepicker form-control"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_PurchaseBillDate" 
                                                                            ErrorMessage="Please Enter the Bill Date" ValidationGroup="Bill" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-lg-3">
                                                                       <asp:Label ID="lbl_PurchaseBillMode" runat="server" Text="Bill Mode" Font-Bold="true"></asp:Label>
                                                                        <asp:DropDownList ID="ddl_PurchaseBillMode" runat="server" Class="form-control">
                                                                                       
                                                                                        <asp:ListItem>Cash</asp:ListItem>  
                                                                                        <asp:ListItem>Credit Card</asp:ListItem>
                                                                       </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-lg-3">
                                                                       <asp:Label ID="lbl_SupplierName" runat="server" Text="Supplier Name" Font-Bold="true"></asp:Label>
                                                                       <asp:DropDownList ID="ddl_SupplierName" runat="server" Class="form-control" AppendDataBoundItems="true">
                                                                            <asp:ListItem Text="Select Supplier Name" Value="-1"></asp:ListItem>  
                                                                                                                    
                                                                      </asp:DropDownList>
                                                                       <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_SupplierName"  InitialValue="-1" ErrorMessage="Please Enter Supplier Name" ForeColor="red" ValidationGroup="Bill">*</asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="product-payment-inner-st">
                                                                            <div id="myTabContent" class="tab-content custom-product-edit">
                                                                                <div class="product-tab-list tab-pane fade active in" id="description">
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <div class="review-content-section">
                                                                                                <div id="dropzone1" class="pro-ad addcoursepro">
                                                                                                         
                                                                                                        <hr />
                                                                                                        <div class="row">
                                                                                                            <div class="form-group col-lg-9">
                                                                                                                <h1>Purchase Bill Details</h1>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <asp:ValidationSummary runat="server" ValidationGroup="BillDetail" CssClass="alert alert-danger" />
                                                                                                        <div class="row">
                                                                                                            <div class="form-group col-lg-2">
                                                                                                                <asp:Label ID="lbl_PurchaseProductType" runat="server"  Text="Name" Font-Bold="True"></asp:Label>
                                                                                                                    <asp:DropDownList runat="server" ID="ddl_PurchaseProductType"  AppendDataBoundItems="true"  Class="form-control custom-select-value" >
                                                                                                                            <asp:ListItem Text="Select Product Name" Value="-1"></asp:ListItem>
                                                                    
                                                                                                                    </asp:DropDownList>
                                                                                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_PurchaseProductType"  InitialValue="-1" ErrorMessage="Please Enter Product Name" ForeColor="red" ValidationGroup="BillDetail">*</asp:RequiredFieldValidator>
                                                                                                          </div>
                                                                                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                                                <Triggers>
                                                                                                                    <asp:AsyncPostBackTrigger ControlID="txt_Quantity" runat="server" EventName="TextChanged" />
                                                                                                                     <asp:AsyncPostBackTrigger ControlID="txt_Rate" runat="server" EventName="TextChanged" />
                                                                                                                     <asp:AsyncPostBackTrigger ControlID="txt_Discount" runat="server" EventName="TextChanged" />
                                                                                                                </Triggers>
                                                                                                                <ContentTemplate>
                                                                                                                        <div class="form-group col-lg-2">
                                                                                                                              <asp:Label ID="lbl_Quantity" runat="server" Text="Quantity" Font-Bold="true"></asp:Label>
                                                                                                                              <asp:TextBox ID="txt_Quantity" runat="server" Class="form-control" OnTextChanged="txt_Quantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                                                                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Quantity" ErrorMessage="Please enter Quantity"  
                                                                                                                                   ValidationGroup="BillDetail" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                                                                               <asp:CompareValidator runat="server" ControlToValidate="txt_Quantity" ValueToCompare="0" 
                                                                                                                                   Operator="GreaterThan" Type="Integer" ErrorMessage="Please enter Quantity" ValidationGroup="BillDetail" ForeColor="Red">*</asp:CompareValidator>
                                                                                                                        </div>
                                                                                                                        <div class="form-group col-lg-2">
                                                                                                                              <asp:Label ID="lbl_Rate" runat="server" Text="Rate" Font-Bold="true"></asp:Label>
                                                                                                                              <asp:TextBox ID="txt_Rate" runat="server" Class="form-control" OnTextChanged="txt_Rate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                                                                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Rate" ErrorMessage="Please enter Rate" 
                                                                                                                                   ValidationGroup="BillDetail" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                                                                               <asp:CompareValidator runat="server" ControlToValidate="txt_Rate" ValueToCompare="0" Operator="GreaterThan" 
                                                                                                                                   Type="Integer" ErrorMessage="Please enter Rate" ValidationGroup="BillDetail" ForeColor="Red">*</asp:CompareValidator>
                                                                                                                       </div>
                                                                                                                       <div class="form-group col-lg-2">
                                                                                                                            <asp:Label ID="lbl_Discount" runat="server" Text="Discount" Font-Bold="true"></asp:Label>
                                                                                                                            <asp:TextBox ID="txt_Discount" runat="server" Class="form-control" OnTextChanged="txt_Discount_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                                                                       </div>
                                                                                                                     
                                                                                                                        <div class="form-group col-lg-2">
                                                                                                                                <asp:Label ID="lbl_Total" runat="server" Text="Total" Font-Bold="true"></asp:Label>
                                                                                                                                <asp:TextBox ID="txt_Total" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                                                                                       </div>
                                                                                                                </ContentTemplate>
                                                                                                            </asp:UpdatePanel>
                                                                                                          
                                                                                                         <div class="form-group col-lg-2">
                                                                                                             
                                                                                                                <asp:Button ID="btn_PurchaseProductAdd" runat="server" Text="ADD" class="btn btn-success loginbtn" OnClick="btn_PurchaseProductAdd_Click" ValidationGroup="BillDetail"/>
                                                                                                            
                                                                                                         </div>
                                                                                                    </div>
                                                                                                    <hr />
                                                                                                         <div class="row">
                                                                                                             
                                                                                                                 <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="false"  CssClass="table table-bordered table-responsive" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="10">
                                                                                                                        
                                                                                                                        <Columns>
                                                                                                                            
                                                                                                                            <asp:BoundField DataField="ProductId" HeaderText="Product Type" Visible="false" SortExpression="ProductId" />
                                                                                                                            <asp:BoundField DataField="ProductType" HeaderText="Product Type" SortExpression="ProductType" />
                                                                                                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                                                                                            <asp:BoundField DataField="Rate" HeaderText="Rate"  SortExpression="Rate" />
                                                                                                                            <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                                                                                                                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                                                                                                             <asp:CommandField ShowDeleteButton="true" ItemStyle-CssClass="btn-primary" ItemStyle-BackColor="#0066ff" ItemStyle-ForeColor="White" />
                                                                                                                        </Columns>
                                                                                                                </asp:GridView>
                                                                                                               
                                                                                                        </div>
                                                                                                        <div class="row">
                                                                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                                                                                            <asp:Label ID="lbl_BillAmount" runat="server" Text="Bill Amount" Font-Bold="true"></asp:Label>
                                                                                                                            <asp:TextBox ID="txt_BillAmount" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                                                                           </div>
                                                                                                           
                                                                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                                                                                 
                                                                                                                            <asp:Label ID="lbl_RoundupAmount" runat="server" Text="Roundup Amount" Font-Bold="true"></asp:Label>
                                                                                                                            <asp:TextBox ID="txt_RoundupAmount" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                                                                            </div>
                                                                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                                                                                 
                                                                                                                    <asp:Label ID="lbl_FinalAmount" runat="server" Text="Final Amount" Font-Bold="true"></asp:Label>
                                                                                                                    <asp:TextBox ID="txt_FinalAmount" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                                                                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Please enter Final Amount" 
                                                                                                                    ControlToValidate="txt_FinalAmount" ValidationGroup="Bill">*</asp:RequiredFieldValidator>
                                                                                                                <asp:CompareValidator runat="server" ErrorMessage="Please enter Final Amount" ControlToValidate="txt_FinalAmount" 
                                                                                                                    ValueToCompare="0" Operator="GreaterThan" Type="Integer" ValidationGroup="Bill" ForeColor="Red">*</asp:CompareValidator>                                                                                                            </div>
                                                                                                               
                                                                                                        </div>
                                                                                                        
                                                                                                    </div><br />
                                                                                                    <div class="row">
                                                                                                            <div class="form-group col-lg-2">
                                                                                                             
                                                                                                                <asp:Button ID="btn_Submit" runat="server" Text="Submit" class="btn btn-success loginbtn" 
                                                                                                                    ValidationGroup="Bill" OnClick="btn_Submit_Click" />
                                                                                                            
                                                                                                         </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                </div>
                                              </div>
                                         </div>
                                    </div>
                                 </div>
                            </div>
                       </div>
                 </div>
            </div>
        
</asp:Content>                                                                                                       