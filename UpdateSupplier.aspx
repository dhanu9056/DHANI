<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="UpdateSupplier.aspx.cs" Inherits="Gk_Cake_shop.UpdateSupplier" %>
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
                                                            <div class="form-group col-lg-6">
                                                                <h1>Update Supplier Form</h1>
                                                            </div>
                                                        </div>
                                                        <asp:Label ID="lbl_UpdateSupplierError" runat="server"></asp:Label>
                                                        <form action="#" id="loginForm">
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SupplierId" runat="server" Text="Supplier ID" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_SupplierId" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SupplierName" runat="server" Text="Supplier Name" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_SupplierName" runat="server" Class="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SupplierAddress" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_SupplierAddress" runat="server" Class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SupplierCity" runat="server" Text="City" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_SupplierCity" runat="server" Class="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SupplierPincode" runat="server" Text="Pincode" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_SuppplierPincode" runat="server" Class="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SupplierState" runat="server" Text="State" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList ID="ddl_SupplierState" runat="server" Class="form-control">
                                                                        <asp:ListItem>Please Select</asp:ListItem>
                                                                        <asp:ListItem>Maharashtra</asp:ListItem>
                                                                        <asp:ListItem>Karnatka</asp:ListItem>
                                                                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                                                        <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SupplierMobileNo" runat="server" Text="Mobile No" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_SupplierMobileNo" runat="server" Class="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="text-left">
                                                                    <asp:Button ID="btn_UpdateSupplier" runat="server" Text="Update" Class="btn btn-success loginbtn" OnClick="btn_UpdateSupplier_Click" />
                                                                </div>
                                                            </div>
                                                        </form>
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
