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
    public partial class Product : System.Web.UI.Page
    {
        private bool _IsSupress;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_ProductSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("InsertIntoProduct", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductType", txt_ProductType.Text);
                    cmd.Parameters.AddWithValue("@WithEgg",rb_WithEgg.SelectedValue);
                    cmd.Parameters.AddWithValue("@Flavor", txt_Flavor.Text);
                    cmd.Parameters.AddWithValue("@Theme",ddl_ProductTheme.SelectedValue);
                    cmd.Parameters.AddWithValue("@Occassion", ddl_Occassion.SelectedValue);
                    cmd.Parameters.AddWithValue("@ProductWeight", txt_ProductWeight.Text);
                    cmd.Parameters.AddWithValue("@Measurement", txt_ProductMeasurement.Text);
                    cmd.Parameters.AddWithValue("@Shape",ddl_Shape.Text);
                    cmd.Parameters.AddWithValue("@SaleRate",txt_SaleRate.Text);
                    cmd.ExecuteNonQuery();
                    lbl_Message.Text = "Record Inserted Sucessfully";
                    lbl_Message.Visible = true;
                    ClearDetailControl();
                    lbl_ProductFormError.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lbl_ProductFormError.Text = ex.Message;
            }
        }
        private void ClearDetailControl()
        {
            _IsSupress = true;
            txt_ProductType.Text = " ";
            rb_WithEgg.Text = " ";
            txt_Flavor.Text = " ";
            ddl_ProductTheme.SelectedIndex = 0;
            ddl_Occassion.SelectedIndex = 0;
            txt_ProductWeight.Text = " ";
            ddl_Shape.SelectedIndex = 0;
            txt_SaleRate.Text = " ";
            _IsSupress = false;
        }
        protected void btn_ProductReset_Click(object sender, EventArgs e)
        {
            ClearDetailControl();
        }
    }
}