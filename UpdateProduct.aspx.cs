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
    public partial class UpdateProduct : System.Web.UI.Page
    {
        string ProductId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ProductId"] != null)
            {
                ProductId = Request.QueryString["ProductId"].ToString();
                if (!IsPostBack)
                {
                    BindTextBoxValue();
                }
            }
            else
            {
                this.ShowMessageAndRedirect("Please Select Record to update", "ProductList.aspx");
            }
        }
        private void BindTextBoxValue()
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectProductListFromUpdateProduct", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductId", ProductId);
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    txt_ProductId.Text = dt.Rows[0]["ProductId"].ToString();
                    txt_ProductType.Text = dt.Rows[0]["ProductType"].ToString();
                    rb_WithEgg.Text = dt.Rows[0]["WithEgg"].ToString();
                    txt_Flavor.Text = dt.Rows[0]["Flavor"].ToString();
                    ddl_ProductTheme.Text = dt.Rows[0]["Theme"].ToString();
                    ddl_Occassion.Text = dt.Rows[0]["Occassion"].ToString();
                    txt_ProductWeight.Text = dt.Rows[0]["ProductWeight"].ToString();
                    txt_ProductMeasurement.Text = dt.Rows[0]["Measurement"].ToString();
                    ddl_Shape.Text = dt.Rows[0]["Shape"].ToString();
                    txt_SaleRate.Text = dt.Rows[0]["SaleRate"].ToString();
                }
            }
            catch (Exception ex)
            {
                lbl_UpdateProductError.Text = ex.Message;
            }
        }

        protected void btn_UpdateProduct_Click(object sender, EventArgs e)
        {
            using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
            {
                SqlConn.Open();
                SqlCommand cmd = new SqlCommand("UpdateProductList", SqlConn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId",txt_ProductId.Text);
                cmd.Parameters.AddWithValue("@ProductType",txt_ProductType.Text);
                cmd.Parameters.AddWithValue("@WithEgg",rb_WithEgg.Text);
                cmd.Parameters.AddWithValue("@Flavor",txt_Flavor.Text);
                cmd.Parameters.AddWithValue("@Theme",ddl_ProductTheme.Text);
                cmd.Parameters.AddWithValue("@Occassion",ddl_Occassion.Text);
                cmd.Parameters.AddWithValue("@ProductWeight",txt_ProductWeight.Text);
                cmd.Parameters.AddWithValue("@Measurement",txt_ProductMeasurement.Text);
                cmd.Parameters.AddWithValue("@Shape",ddl_Shape.Text);
                cmd.Parameters.AddWithValue("@SaleRate",txt_SaleRate.Text);
                cmd.ExecuteNonQuery();
                 this.ShowMessageAndRedirect("Record Update Successfully", "ProductList.aspx");
            }
        }
    }
}
    