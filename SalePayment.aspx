<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="SalePayment.aspx.cs" Inherits="Gk_Cake_shop.SalePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="index.html"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
                    </div>
                </div>
            </div>
            
            <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                       <div class="review-content-section">
                              <div id="dropzone1" class="pro-ad addcoursepro">
                                   <div class="row">
                                         <div class="form-group col-lg-12">
                                               <h1>Sale Payment</h1>
                                         </div>
                                   </div>
                             </div>
                            <asp:Label ID="lbl_SalePaymentError" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
                            <div class="row">
                                <div class="form-group col-lg-3">
                                      <asp:Label ID="lbl_CustomerName" runat="server" Text="Customer Name" Font-Bold="true"></asp:Label>
                                      <asp:DropDownList ID="ddl_CustomerName" runat="server" Class="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_CustomerName_SelectedIndexChanged" AutoPostBack="true">
                                           <asp:ListItem Text="Select Customer Name" Value="-1"></asp:ListItem>
                                      </asp:DropDownList>
                               </div>
                           </div>
                      </div>
                 </div>
           </div>
            <div class="basic-form-area mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                        <div class="sparkline8-list mt-b-30">
                            <div class="sparkline8-hd">
                                
                            </div>
                            <div class="sparkline8-graph">
                                <div class="basic-login-form-ad">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-responsive" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                                   <Columns>
                                                       <asp:TemplateField>
                                                           <ItemTemplate>
                                                               <asp:Button ID="btn_select" runat="server" Text="Select" CommandName="Select" class="btn btn-success loginbtn"></asp:Button>
                                                           </ItemTemplate>
                                                       </asp:TemplateField>
                                                       <asp:BoundField DataField="BillId" HeaderText="BillId"  SortExpression="BillId" />
                                                       <asp:BoundField DataField="BillNo" HeaderText="BillNo"  SortExpression="BillNo" />
                                                       <asp:BoundField DataField="BillDate" HeaderText="Bill Date" SortExpression="BillDate"  DataFormatString="{0:dd/MM/yyyy}" />
                                                       <asp:BoundField DataField="FinalAmount" HeaderText="Final Amount"  SortExpression="FinalAmount" />
                                                       <asp:BoundField DataField="RemainingAmount" HeaderText="Remaining Amount"  SortExpression="RemainingAmount" />
                                                   </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                        <div class="sparkline9-list responsive-mg-b-30">
                            <div class="sparkline9-hd">
                                <div class="main-sparkline9-hd">
                                    <h1>Sale Bill Form</h1>
                                </div>
                            </div>
                            <asp:Label ID="lbl_Message" runat="server" ForeColor="Green" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>
                            <div class="sparkline9-graph">
                                <div class="basic-login-form-ad">
                                    
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="basic-login-inner">
                                                <form action="#">
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                               <asp:Label ID="lbl_BillId" runat="server" Text="BillId" Font-Bold="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                               <asp:TextBox ID="txt_BillId" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                               <asp:Label ID="lbl_BillNo" runat="server" Text="BillNo" Font-Bold="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                               <asp:TextBox ID="txt_BillNo" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                               <asp:Label ID="lbl_PaymentDate" runat="server" Text="Payment Date" Font-Bold="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                               <asp:TextBox ID="txt_PaymentDate" runat="server" TextMode="Date" Class="datepicker form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                               <asp:Label ID="lbl_Amount" runat="server" Text="Amount" Font-Bold="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                               <asp:TextBox ID="txt_Amount" runat="server" Class="form-control" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                               <asp:Label ID="lbl_PaymentType" runat="server" Text="Payment Type" Font-Bold="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                              <asp:DropDownList ID="ddl_PaymentType" runat="server" class="form-control custom-select-value" >  
                                                                                    <asp:ListItem Text="Select Payment Type" Value="-1"></asp:ListItem>  
                                                                                    <asp:ListItem>Cash</asp:ListItem>  
                                                                                    <asp:ListItem>NEFT</asp:ListItem>  
                                                                                    <asp:ListItem>RTGS</asp:ListItem>  
                                                                                    <asp:ListItem>UPI</asp:ListItem> 
                                                                                    <asp:ListItem>Card</asp:ListItem>     
                                                              </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                               <asp:Label ID="lbl_TransactionNo" runat="server" Text="Transaction No" Font-Bold="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                               <asp:TextBox ID="txt_TransactionNo" runat="server" Class="form-control" ></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                               <asp:Label ID="lbl_Payment" runat="server" Text="Payment" Font-Bold="true"></asp:Label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                               <asp:TextBox ID="txt_Payment" runat="server" Class="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                      <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                                <div class="login-horizental">
                                                                   <asp:Button ID="btn_Submit" runat="server" Text="Submit" class="btn btn-success loginbtn" OnClick="btn_Submit_Click"></asp:Button>
                                                                </div>
                                                            </div>
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













</asp:Content>








