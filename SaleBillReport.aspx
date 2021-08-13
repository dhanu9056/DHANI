<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="SaleBillReport.aspx.cs" Inherits="Gk_Cake_shop.SaleBillReport" %>
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
                                                                    <h1>Sale Bill Report</h1>
                                                                    
                                                                 </div>
                                                                </div>
                                                            </div>
                                                            <asp:Label ID="lbl_Error" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                                <div class="row">
                                                                    <div class="form-group col-lg-2">
                                                                        <asp:Label ID="lbl_FromDate" runat="server" Text="From Date" Font-Bold="true"></asp:Label>
                                                                    </div>
                                                                    <div class="form-group col-lg-3">
                                                                        <asp:TextBox ID="txt_FromDate" runat="server" TextMode="Date" Class="datepicker form-control"></asp:TextBox>
                                                                    </div>
                                                                    <div class="form-group col-lg-2">
                                                                       <asp:Label ID="lbl_ToDate" runat="server" Text="To Date" Font-Bold="true"></asp:Label>
                                                                    </div>
                                                                    <div class="form-group col-lg-3">
                                                                       <asp:TextBox ID="txt_ToDate" runat="server" TextMode="Date" Class="datepicker form-control"></asp:TextBox>
                                                                   </div> 
                                                                   <div class="form-group col-lg-2">
                                                                       <asp:Button ID="btn_Search" runat="server" Text="Search" class="btn btn-success loginbtn" OnClick="btn_Search_Click"/>
                                                                </div>
                                                        </div>
                                                        <asp:Label ID="Label2" runat="server"></asp:Label>
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyName="BillId"
                                                            CssClass="table table-bordered table-responsive" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="true" OnRowCommand="GridView1_RowCommand" >
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btn_select" runat="server" Text="Select" class="btn btn-success loginbtn"  CommandName="SelectButton" CommandArgument="<%#((GridViewRow)Container).RowIndex %>"/>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="BillId" HeaderText="BillId" ConvertEmptyStringToNull="False" SortExpression="BillId" />
                                                                <asp:BoundField DataField="BillNo" HeaderText="BillNo" ConvertEmptyStringToNull="False" SortExpression="BillNo" />
                                                                <asp:BoundField DataField="BillMode" HeaderText="BillMode" ConvertEmptyStringToNull="False" SortExpression="BillMode" />
                                                                <asp:BoundField DataField="BillDate" HeaderText="BillDate" ConvertEmptyStringToNull="False" SortExpression="BillDate" DataFormatString="{0:dd/MM/yyyy}" />
                                                                <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" ConvertEmptyStringToNull="False" SortExpression="CustomerId" />
                                                                <asp:BoundField DataField="BillAmount" HeaderText="Bill Amount" ConvertEmptyStringToNull="False" SortExpression="BillAmount" />
                                                                <asp:BoundField DataField="RoundupAmount" HeaderText="Roundup Amount" ConvertEmptyStringToNull="False" SortExpression="RoundupAmount" />
                                                                <asp:BoundField DataField="FinalAmount" HeaderText="FinalAmount" ConvertEmptyStringToNull="False" SortExpression="FinalAmount" />

                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                                        
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
