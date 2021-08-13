<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="ProductStockReport.aspx.cs" Inherits="Gk_Cake_shop.ProductStockReport" %>
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
                                                            <div class="form-group col-lg-12">
                                                                <h1>Product Stock</h1>
                                                            </div>
                                                     </div>
                                                       <asp:Label ID="lbl_ProductListError" runat="server"></asp:Label>
                                                       <form action="#" id="loginForm">
                                                        <div class="row">
                                                            <div class="form-group col-lg-6">
                                                              
                                                            </div>
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                                DataKeyNames="ProductId" CssClass="table table-bordered table-responsive" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="10">
                                                               
                                                                <Columns>
                                                                    <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" Visible="false"/>
                                                                    <asp:BoundField DataField="RowNo" HeaderText="#" ReadOnly="true" SortExpression="RowNo"/>
                                                                    <asp:BoundField DataField="ProductType" HeaderText="Product Type" ConvertEmptyStringToNull="False" SortExpression="ProductType" />
                                                                    <asp:BoundField DataField="WithEgg" HeaderText="WithEgg" ConvertEmptyStringToNull="False" SortExpression="WithEgg" />
                                                                    <asp:BoundField DataField="Flavor" HeaderText="Flavor" ConvertEmptyStringToNull="False" SortExpression="Flavor" />
                                                                    <asp:BoundField DataField="Theme" HeaderText="Theme" ConvertEmptyStringToNull="False" SortExpression="Theme" />
                                                                    <asp:BoundField DataField="Occassion" HeaderText="Occassion" ConvertEmptyStringToNull="False" SortExpression="Occassion" />
                                                                    <asp:BoundField DataField="ProductWeight" HeaderText="Product Weight" ConvertEmptyStringToNull="False" SortExpression="ProductWeight" />
                                                                    <asp:BoundField DataField="Measurement" HeaderText="Measurement" ConvertEmptyStringToNull="False" SortExpression="Measurement" />
                                                                    <asp:BoundField DataField="Shape" HeaderText="Shape" ConvertEmptyStringToNull="False" SortExpression="Shape" />
                                                                    <asp:BoundField DataField="BalanceQuantity" HeaderText="Balance Quantity" ConvertEmptyStringToNull="False" SortExpression="BalanceQuantity" />
                                                                    <asp:BoundField DataField="SaleRate" HeaderText="Sale Rate" ConvertEmptyStringToNull="False" SortExpression="SaleRate" />
                                                                    
                                                                </Columns>

                                                            </asp:GridView>
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

