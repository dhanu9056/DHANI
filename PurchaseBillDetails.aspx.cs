using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Gk_Cake_shop
{
    public partial class PurchaseBillDetails : System.Web.UI.Page
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

                    SqlDataAdapter sda = new SqlDataAdapter("SelectListPurchaseDetail", SqlConn);
                    sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    SqlConn.Close();
                }
            }
            catch (Exception ex)
            {
                lbl_PurchaseBillDetailListError.Text = ex.Message;
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

