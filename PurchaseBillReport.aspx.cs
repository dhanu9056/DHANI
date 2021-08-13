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
    public partial class PurchaseBillReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btn_Search_Click1(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    Label2.Text = "";
                    DataTable dt = new DataTable();
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("FromDateToDateOnPurchaseBillDetail", SqlConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FromDate", txt_FromDate.Text);
                    cmd.Parameters.AddWithValue("@ToDate", txt_ToDate.Text);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataSourceID = null;
                        GridView1.DataBind();
                    }
                    else
                    {
                        Label2.Text = "Record Not Found";
                    }
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Response.Redirect("~/PurchaseBillDetailsReport.aspx?BillId=" + row.Cells[1].Text);
            }
        }
    }
}
    
