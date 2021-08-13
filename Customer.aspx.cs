using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Gk_Cake_shop
{
    public partial class Customer : System.Web.UI.Page
    {
        private bool _IsSupress;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_CustomerSubmit_Click1(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("InsertIntoCustomer", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", txt_CustomerName.Text);
                    cmd.Parameters.AddWithValue("@AddressLine", txt_CustomerAddress.Text);
                    cmd.Parameters.AddWithValue("@City", txt_City.Text);
                    cmd.Parameters.AddWithValue("@PinCode", txt_Pincode.Text);
                    cmd.Parameters.AddWithValue("@CustomerState", ddl_CustomerState.SelectedValue);
                    cmd.Parameters.AddWithValue("@MobileNo", txt_MobileNo.Text);
                    cmd.ExecuteNonQuery();
                    lbl_Message.Text = "Record Inserted Sucessfully";
                    lbl_Message.Visible = true;
                    ClearDetailControl();
                    lbl_CustomerFormError.Visible = false;
                    
                }
            }
            catch (Exception ex)
            {
                lbl_CustomerFormError.Text = ex.Message;
            }
        }
        private void ClearDetailControl()
        {
            _IsSupress = true;
            txt_CustomerName.Text = " ";
            txt_CustomerAddress.Text = " ";
            txt_MobileNo.Text = " ";
            txt_City.Text = " ";
            ddl_CustomerState.SelectedIndex = 0;
            txt_Pincode.Text = " ";
            _IsSupress = false;
        }
        protected void btn_CustomerReset_Click(object sender, EventArgs e)
        {
            ClearDetailControl();
        }
    }
}