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
    public partial class PurchaseBillDetailsReport : System.Web.UI.Page
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
                    SqlCommand cmd = new SqlCommand("SelectAllPurchaseBillWhereBillId", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BillId", BillId);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                   
                    sda.Fill(dt);
                    txt_PurchaseBillId.Text = dt.Rows[0]["BillId"].ToString();
                    txt_PurchaseBillNo.Text = dt.Rows[0]["BillNo"].ToString();
                    txt_PurchaseBillDate.Text = dt.Rows[0]["BillDate"].ToString();
                    txt_PurchaseBillMode.Text = dt.Rows[0]["BillMode"].ToString();
                    txt_SupplierId.Text = dt.Rows[0]["SupplierId"].ToString();
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
                    SqlCommand cmd = new SqlCommand("SelectPurchaseBillDeatilFromBillDetails", SqlConn);
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
            Response.Redirect("PurchaseBillReport.aspx");
        }
    }

}