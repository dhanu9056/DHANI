<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="SupplierList.aspx.cs" Inherits="Gk_Cake_shop.SupplierList" %>
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
                                                                <h1>List of Supplier</h1>
                                                                
                                                                 <div class="add-product">
                                                                     <a href="Supplier.aspx">ADD</a>
                                                                 </div>
                                                                
                                                           </div>   
                                                     </div>
                                                        
                                                       <asp:Label ID="lbl_SupplierListError" runat="server" ></asp:Label>
                                                       <form action="#" id="loginForm">
                                                        <div class="row">
                                                            <div class="form-group col-lg-6">
                                                               
                                                            </div>
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SupplierId"
                                                                 OnRowCommand="GridView1_RowCommand" CssClass="table table-bordered table-responsive" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10" PagerSettings-Mode="NextPrevious" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Previous">
                                                                    <Columns>
                                                                        
                                                                        <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" ConvertEmptyStringToNull="False" SortExpression="SupplierId" Visible="false"/>
                                                                        <asp:BoundField DataField="RowNo" HeaderText="#" ReadOnly="true" SortExpression="RowNo"/>
                                                                        <asp:BoundField DataField="Name" HeaderText="Name" ConvertEmptyStringToNull="False" SortExpression="Name" />
                                                                        <asp:BoundField DataField="AddressLine" HeaderText="Address" ConvertEmptyStringToNull="False" SortExpression="AddressLine" />
                                                                        <asp:BoundField DataField="City" HeaderText="City" ConvertEmptyStringToNull="False" SortExpression="City" />
                                                                        <asp:BoundField DataField="Pincode" HeaderText="Pincode" ConvertEmptyStringToNull="False" SortExpression="Pincode" />
                                                                        <asp:BoundField DataField="SupplierState" HeaderText="State" ConvertEmptyStringToNull="False" SortExpression="SupplierState" />
                                                                        <asp:BoundField DataField="Country" HeaderText="Country" ConvertEmptyStringToNull="False" SortExpression="Country" />
                                                                        <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" ConvertEmptyStringToNull="False" SortExpression="MobileNo" />
                                                                        
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="btn_Edit" runat="server" Text="Edit" Class="btn btn-success loginbtn" CommandName="EditButton" CommandArgument="<%#((GridViewRow)Container).RowIndex %>"/>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="btn_Delete" runat="server" Text="Delete" Class="btn btn-success loginbtn" CommandName="DeleteButton" CommandArgument="<%#((GridViewRow)Container).RowIndex %>" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
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

