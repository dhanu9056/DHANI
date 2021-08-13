<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="UpdateCustomer.aspx.cs" Inherits="Gk_Cake_shop.UpdateCustomer" %>
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
                                                                <h1>Update Customer Form</h1>
                                                            </div>
                                                        </div>
                                                        <asp:Label ID="lbl_UpdateCustomerError" runat="server"></asp:Label>
                                                        <form action="#" id="loginForm">
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_CustomerId" runat="server" Text="Customer Id" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_CustomerId" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_CustomerName" runat="server" Text="Name" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_CustomerName" runat="server" Class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_CustomerAddress" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_CustomerAddress" runat="server" Class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_CustomerCity" runat="server" Text="City" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_City" runat="server" Class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_CustomerPincode" runat="server" Text="Pincode" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_Pincode" runat="server" Class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_CustomerState" runat="server" Text="State" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList ID="ddl_CustomerState" runat="server" class="form-control custom-select-value">
                                                                        <asp:ListItem>Please Select</asp:ListItem>
                                                                        <asp:ListItem>Maharashtra </asp:ListItem>
                                                                        <asp:ListItem>Karnatka</asp:ListItem>
                                                                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                                                        <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_CustomerMobileNo" runat="server" Text="Mobile No" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_MobileNo" runat="server" Class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="text-left">
                                                                    <asp:Button ID="btn_UpdateCustomer" runat="server" Text="Update" Class="btn btn-success loginbtn" OnClick="btn_UpdateCustomer_Click" />
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
