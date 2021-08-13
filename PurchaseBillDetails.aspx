<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="PurchaseBillDetails.aspx.cs" Inherits="Gk_Cake_shop.PurchaseBillDetails" %>
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
                                                                <h1>Purchase Bill Details</h1>
                                                                <div class="add-product">
                                                                     <a href="Pro_Purchase.aspx">ADD</a>
                                                                </div>
                                                            </div>
                                                     </div>
                                                    
                                                        
                                                        <asp:Label ID="lbl_PurchaseBillDetailListError" runat="server"></asp:Label>
                                                        <form action="#" id="loginForm">
                                                        <div class="row">
                                                            <div class="form-group col-lg-6">
                                                               
                                                            </div>
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="BillId"
                                                                  CssClass="table table-bordered table-responsive" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10" AllowPaging="true" PagerSettings-Mode="NextPrevious" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Previous">
                                                                    <Columns>
                                                                        
                                                                        <asp:BoundField DataField="BillId" HeaderText="BillId" ConvertEmptyStringToNull="False" SortExpression="BillId" Visible="false"/>
                                                                        <asp:BoundField DataField="BillNo" HeaderText="BillNo" ConvertEmptyStringToNull="False" SortExpression="BillNo" />
                                                                        <asp:BoundField DataField="BillMode" HeaderText="BillMode" ConvertEmptyStringToNull="False" SortExpression="BillMode" />
                                                                        <asp:BoundField DataField="BillDate" HeaderText="BillDate" ConvertEmptyStringToNull="False" SortExpression="BillDate"  DataFormatString="{0:dd/MM/yyyy}"/>
                                                                        <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" ConvertEmptyStringToNull="False" Visible="false" SortExpression="SupplierId" />
                                                                        <asp:BoundField DataField="Name" HeaderText="Supplier Name" ConvertEmptyStringToNull="False" SortExpression="Name" />
                                                                        <asp:BoundField DataField="FinalAmount" HeaderText="FinalAmount" ConvertEmptyStringToNull="False" SortExpression="FinalAmount" />
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




