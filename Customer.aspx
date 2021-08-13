<%@ Page Title="" Language="C#" MasterPageFile="~/cake.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Gk_Cake_shop.Customer"%>
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
                                                            <div class="form-group col-lg-6">
                                                                <h1>Customer Form</h1>
                                                            </div>
                                                     </div>
                                                      <asp:Label ID="lbl_CustomerFormError" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                      <asp:Label ID="lbl_Message" runat="server" ForeColor="Green" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>
                                                     
                                                    <form action="#" id="loginForm">
                                                        <div class="row">
                                                            <div class="form-group col-lg-6">
                                                                <asp:Label ID="lbl_CustomerName" runat="server" Text="Name" Font-Bold="true"></asp:Label>
                                                                <asp:TextBox ID="txt_CustomerName" runat="server" Class="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter CutomerName" ControlToValidate="txt_CustomerName"  ForeColor="Red" ValidationGroup="PersonalGroup"></asp:RequiredFieldValidator>
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
                                                                            <asp:DropDownList ID="ddl_CustomerState" runat="server" class="form-control custom-select-value" >  
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
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter mobile number" ControlToValidate="txt_MobileNo" ValidationExpression="[0-9]{10}" ForeColor="Red" ValidationGroup="PersonalGroup"></asp:RegularExpressionValidator>
                                                            </div>
                                                         </div>  
                                                        <div class="row">
                                                         <div class="text-left">
                                                             <asp:Button ID="btn_CustomerSubmit" runat="server" Text="Submit" Class="btn btn-success loginbtn" OnClick="btn_CustomerSubmit_Click1" ValidationGroup="PersonalGroup" />
                                                             <asp:Button ID="btn_CustomerReset" runat="server" Text="Reset" class="btn btn-success loginbtn" OnClick="btn_CustomerReset_Click" />
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

