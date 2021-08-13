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
   
    public partial class UpdateSupplier : System.Web.UI.Page
    {
        string SupplierId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["SupplierId"] != null)
            {
                SupplierId = Request.QueryString["SupplierId"].ToString();
                if (!IsPostBack)
                {
                    BindTextBoxValue();
                }
            }
            else
            {
                this.ShowMessageAndRedirect("Please Select Record to update", "SupplierList.aspx");
            }
        }
        private void BindTextBoxValue()
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectSupplierListFromUpdateSupplier", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SupplierId", SupplierId);
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    txt_SupplierId.Text = dt.Rows[0]["SupplierId"].ToString();
                    txt_SupplierName.Text = dt.Rows[0]["Name"].ToString();
                    txt_SupplierAddress.Text = dt.Rows[0]["AddressLine"].ToString();
                    txt_SupplierCity.Text = dt.Rows[0]["City"].ToString();
                    txt_SuppplierPincode.Text = dt.Rows[0]["Pincode"].ToString();
                    ddl_SupplierState.Text = dt.Rows[0]["SupplierState"].ToString();
                    txt_SupplierMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
                }
            }
            catch(Exception ex)
            {
                lbl_UpdateSupplierError.Text = ex.Message;
            }
        }

        protected void btn_UpdateSupplier_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))

                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("UpdateSupplierList", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SupplierId", txt_SupplierId.Text);
                    cmd.Parameters.AddWithValue("@Name", txt_SupplierName.Text);
                    cmd.Parameters.AddWithValue("@AddressLine", txt_SupplierAddress.Text);
                    cmd.Parameters.AddWithValue("@City", txt_SupplierCity.Text);
                    cmd.Parameters.AddWithValue("@Pincode", txt_SuppplierPincode.Text);
                    cmd.Parameters.AddWithValue("@SupplierState", ddl_SupplierState.Text);
                    cmd.Parameters.AddWithValue("@MobileNo", txt_SupplierMobileNo.Text);
                    cmd.ExecuteNonQuery();
                    this.ShowMessageAndRedirect("Record Update Successfully", "SupplierList.aspx");
                }
            }
            catch(Exception ex)
            {
                lbl_UpdateSupplierError.Text = ex.Message;
            }
        }
    }
}