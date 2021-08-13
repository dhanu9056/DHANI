using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gk_Cake_shop
{
    public partial class UpdateCustomer : System.Web.UI.Page
    {
        string CustomerId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CustomerId"] != null)
            {
                CustomerId = Request.QueryString["CustomerId"].ToString();
                if (!IsPostBack)
                {
                    BindTextBoxValue();
                }
            }
            else
            {
                this.ShowMessageAndRedirect("Please Select Record to update", "CustomerList.aspx");
            }
        }
        private void BindTextBoxValue()
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectCustomerListFromUpdateCustomer", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CustomerId", CustomerId);
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    txt_CustomerId.Text = dt.Rows[0]["CustomerId"].ToString();
                    txt_CustomerName.Text = dt.Rows[0]["Name"].ToString();
                    txt_CustomerAddress.Text = dt.Rows[0]["AddressLine"].ToString();
                    txt_City.Text = dt.Rows[0]["City"].ToString();
                    txt_Pincode.Text = dt.Rows[0]["Pincode"].ToString();
                    ddl_CustomerState.Text = dt.Rows[0]["CustomerState"].ToString();
                    txt_MobileNo.Text = dt.Rows[0]["MobileNo"].ToString();


                }
            }
            catch (Exception ex)
            {
                lbl_UpdateCustomerError.Text = ex.Message;
            }
        }

        protected void btn_UpdateCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))

                {
                    // SqlConn.Open();
                    //SqlCommand cmd = new SqlCommand("update Supplier set SupplierName='" + txt_SupplierName + "',SupplierAddress='" + txt_SupplierAddress + "',SupplierMobileNo='" + txt_SupplierMobileNo + "',SupplierCity='" + txt_SupplierCity + "',SupplierState='" + ddl_SupplierState + "',SupplierPincode='" + txt_SuppplierPincode + "' where SupplierId=" + SupplierId, SqlConn);
                    //SqlCommand cmd = new SqlCommand("update Supplier set SupplierName='" + txt_SupplierName + "',SupplierAddress='" + txt_SupplierAddress + "',SupplierMobileNo='" + txt_SupplierMobileNo + "',SupplierCity='" + txt_SupplierCity + "',SupplierState='" + ddl_SupplierState + "',SupplierPincode='" + txt_SuppplierPincode + "' where SupplierId=" + SupplierId, SqlConn);
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("UpdateCustomerFromCustomerList", SqlConn);

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CustomerId", txt_CustomerId.Text);
                    cmd.Parameters.AddWithValue("@Name", txt_CustomerName.Text);
                    cmd.Parameters.AddWithValue("@AddressLine", txt_CustomerAddress.Text);
                    cmd.Parameters.AddWithValue("@City", txt_City.Text);
                    cmd.Parameters.AddWithValue("@Pincode", txt_Pincode.Text);
                    cmd.Parameters.AddWithValue("@CustomerState", ddl_CustomerState.Text);
                    cmd.Parameters.AddWithValue("@MobileNo", txt_MobileNo.Text);                 
                    cmd.ExecuteNonQuery();
                    this.ShowMessageAndRedirect("Record Update Successfully", "CustomerList.aspx");

                }
            }
            catch(Exception ex)
            {
                lbl_UpdateCustomerError.Text = ex.Message;
            }
            
        }

    }
}
