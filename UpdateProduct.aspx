<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="Gk_Cake_shop.UpdateProduct" %>
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
            <div class="single-pro-review-area  mt-t-30 mg-b-15">
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
                                                                <h1>Update Product List</h1>
                                                            </div>
                                                        </div>
                                                        <asp:Label ID="lbl_UpdateProductError" runat="server"></asp:Label>
                                                        <form action="#" id="loginForm">
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_ProductId" runat="server" Text="Product Id" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_ProductId" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_ProductType" runat="server" Text="Product Type" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_ProductType" runat="server" class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_WithEgg" runat="server" Text="WithEgg" Font-Bold="true"></asp:Label>
                                                                    <div class="bt-df-checkbox">
                                                                        <asp:RadioButtonList ID="rb_WithEgg" runat="server">
                                                                            <asp:ListItem>Yes</asp:ListItem>
                                                                            <asp:ListItem>No</asp:ListItem>
                                                                        </asp:RadioButtonList>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">

                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_Flavor" runat="server" Text="Flavor" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_Flavor" runat="server" class="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_ProductTheme" runat="server" Text="ProductTheme" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList ID="ddl_ProductTheme" runat="server" Class="form-control">
                                                                        <asp:ListItem>Select ProductTheme</asp:ListItem>
                                                                        <asp:ListItem>Princes</asp:ListItem>
                                                                        <asp:ListItem>Couple</asp:ListItem>
                                                                        <asp:ListItem>Cartoon</asp:ListItem>
                                                                        <asp:ListItem>Minion</asp:ListItem>
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_Occassion" runat="server" Text="Occassion" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList ID="ddl_Occassion" runat="server" Class="form-control">
                                                                        <asp:ListItem>Select Occassion</asp:ListItem>
                                                                        <asp:ListItem>Birthday</asp:ListItem>
                                                                        <asp:ListItem>Anniversary</asp:ListItem>
                                                                        <asp:ListItem>Congratulation</asp:ListItem>
                                                                        <asp:ListItem>Christmas</asp:ListItem>
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_Weight" runat="server" Text="Weight" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_ProductWeight" runat="server" class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_ProductMeasurement" runat="server" Text="Measurement" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_ProductMeasurement" runat="server" class="form-control" ReadOnly="True" Text="kg"></asp:TextBox>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_Shape" runat="server" Text="Shape" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList ID="ddl_Shape" runat="server" Class="form-control">
                                                                        <asp:ListItem>Select Shape</asp:ListItem>
                                                                        <asp:ListItem>Round</asp:ListItem>
                                                                        <asp:ListItem>Heart</asp:ListItem>
                                                                        <asp:ListItem>Reactangle</asp:ListItem>
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="form-group col-lg-6">
                                                                    <asp:Label ID="lbl_SaleRate" runat="server" Text="Rate" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txt_SaleRate" runat="server" class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="text-left">
                                                                    <asp:Button ID="btn_UpdateProduct" runat="server" Text="Update" class="btn btn-success loginbtn" OnClick="btn_UpdateProduct_Click" />
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