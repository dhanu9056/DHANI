using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Gk_Cake_shop
{
    public partial class Supplier : System.Web.UI.Page
    {
        private bool _IsSupress;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
     
        protected void btn_SupplierSubmit_Click1(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("InsertIntoSupplier", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", txt_SupplierName.Text);
                    cmd.Parameters.AddWithValue("@AddressLine", txt_SupplierAddress.Text);
                    cmd.Parameters.AddWithValue("@City", txt_SupplierCity.Text);
                    cmd.Parameters.AddWithValue("@PinCode", txt_SuppplierPincode.Text);
                    cmd.Parameters.AddWithValue("@SupplierState", ddl_SupplierState.SelectedValue);
                    cmd.Parameters.AddWithValue("@MobileNo", txt_SupplierMobileNo.Text);
                    cmd.ExecuteNonQuery();
                    lbl_Message.Text = "Record Inserted Sucessfully";
                    lbl_Message.Visible = true;
                    ClearDetailControl();
                    lbl_SuppplierFormError.Visible = false;
                   
                }
            }
            catch (Exception ex)
            {
                lbl_SuppplierFormError.Text = ex.Message;
            }
        }
        private void ClearDetailControl()
        {
            _IsSupress = true;
            txt_SupplierName.Text = " ";
            txt_SupplierAddress.Text = " ";
            txt_SupplierCity.Text = " ";
            ddl_SupplierState.SelectedIndex = 0;
            txt_SuppplierPincode.Text = " ";
            txt_SupplierMobileNo.Text = " ";
            _IsSupress = false;
        }
        protected void btn_SupplierReset_Click(object sender, EventArgs e)
        {
            ClearDetailControl();
        }
    }
}