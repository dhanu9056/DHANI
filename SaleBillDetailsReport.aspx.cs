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
    public partial class SaleBillDetailsReport : System.Web.UI.Page
    {
        string BillId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            BillId = Request.QueryString["BillId"].ToString();
            if (!IsPostBack)
            {
                BindTextBoxValue();
                BindGridView();
            }
        }
        private void BindTextBoxValue()
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectAllSaleBillWhereBillId", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BillId", BillId);
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    txt_SaleBillId.Text = dt.Rows[0]["BillId"].ToString();
                    txt_SaleBillNo.Text = dt.Rows[0]["BillNo"].ToString();
                    txt_SaleBillDate.Text = dt.Rows[0]["BillDate"].ToString();
                    txt_SaleBillMode.Text = dt.Rows[0]["BillMode"].ToString();
                    txt_CustomerId.Text = dt.Rows[0]["CustomerId"].ToString();
                    txt_BillAmount.Text = dt.Rows[0]["BillAmount"].ToString();
                    txt_RoundupAmount.Text = dt.Rows[0]["RoundupAmount"].ToString();
                    txt_FinalAmount.Text = dt.Rows[0]["FinalAmount"].ToString();
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }

        private void BindGridView()
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {

                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectSaleBillDeatilFromBillDetails", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BillId", BillId);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                   
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }
        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("SaleBillReport.aspx");
        }
    }
}
   