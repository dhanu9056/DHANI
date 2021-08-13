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
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView(); 
            }
        }
        private void BindGridView()
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {

                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter sda = new SqlDataAdapter("SelectAllFromProduct", SqlConn);
                    sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    SqlConn.Close();
                }
            }
            catch(Exception ex)
            {
                lbl_ProductListError.Text = ex.Message;
            }
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int id = (int)GridView1.DataKeys[index].Value;
                Response.Redirect("~/UpdateProduct.aspx?ProductId=" + id);
            }
            if (e.CommandName == "DeleteButton")
            {
                try
                {
                    using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                    {

                        SqlConn.Open();
                        int index = Convert.ToInt32(e.CommandArgument);
                        int ProductId = (int)GridView1.DataKeys[index].Value;
                        SqlCommand cmd = new SqlCommand("DeleteRecoredFromProductList", SqlConn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        //SqlCommand cmd = new SqlCommand("Delete from Supplier where SupplierId=@SupplierId",SqlConn);
                        cmd.Parameters.AddWithValue("ProductId",ProductId);
                        cmd.ExecuteNonQuery();
                        this.ShowMessageAndRedirect("Record Deleted Successfully","ProductList.aspx");
                    }
                }
                catch (Exception ex)
                {
                    lbl_ProductListError.Text = ex.Message;
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
            GridView1.DataBind();
        }
    }
}
      