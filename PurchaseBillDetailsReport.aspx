<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="PurchaseBillDetailsReport.aspx.cs" Inherits="Gk_Cake_shop.PurchaseBillDetailsReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="#">
                            <img class="main-logo" src="img/logo/logo.png" alt="" /></a>
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
                                                                <h1>Purchase Bill Report</h1>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lbl_Error" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                    <div class="row">
                                                        <div class="form-group col-lg-3">
                                                            <asp:Label ID="lbl_PurchaseBillId" runat="server" Text="Bill Id" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox ID="txt_PurchaseBillId" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    
                                                        <div class="form-group col-lg-3">
                                                            <asp:Label ID="lbl_PuchaseBillNo" runat="server" Text="Bill No" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox ID="txt_PurchaseBillNo" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>

                                                        </div>
                                                        <div class="form-group col-lg-3">
                                                            <asp:Label ID="lbl_PurchaseBillDate" runat="server" Text="Bill Date" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox ID="txt_PurchaseBillDate" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>

                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <div class="form-group col-lg-3">
                                                            <asp:Label ID="lbl_PurchaseBillMode" runat="server" Text="Bill Mode" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox ID="txt_PurchaseBillMode" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                        </div>

                                                        <div class="form-group col-lg-3">
                                                            <asp:Label ID="lbl_SupplierId" runat="server" Text="Supplier Id" Font-Bold="true"></asp:Label>
                                                            <asp:TextBox ID="txt_SupplierId" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>

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
                                                                                                <h1>Purchase Bill Detail Report</h1>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">

                                                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-responsive" >

                                                                                                <Columns>

                                                                                                    <asp:BoundField DataField="ProductId" HeaderText="Product Id" SortExpression="ProductId" />
                                                                                                   
                                                                                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                                                                    <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                                                                                                    <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                                                                                                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" SortExpression="TotalAmount" />
                                                                                                    
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

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>
                                                                                    <br />
                                                                                    <div class="row">
                                                                                        <div class="form-group col-lg-2">
                                                                                            <asp:Button ID="btn_back" runat="server" Text="Back" class="btn btn-success loginbtn" OnClick="btn_back_Click"/>
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