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
    public partial class SalePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomerName();
            }
        }
        private void BindCustomerName()
        {
            try
            {

                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {

                    SqlConn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("SelectCustomerIdCustomerName", SqlConn);

                    sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddl_CustomerName.DataTextField = "Name";
                    ddl_CustomerName.DataValueField = "CustomerId";
                    ddl_CustomerName.DataSource = dt;
                    ddl_CustomerName.DataBind();
                    ddl_CustomerName.DataSourceID = null;
                }
            }
            catch (Exception ex)
            {
                lbl_SalePaymentError.Text = ex.Message;
            }
        }

        protected void ddl_CustomerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectAllRemainingPaymentOfCustomer", SqlConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CustomerId", int.Parse(ddl_CustomerName.SelectedValue));
                    SqlDataReader dr = cmd.ExecuteReader();
                    GridView2.DataSource = dr;
                    GridView2.DataBind();
                }
            }
            catch (Exception ex)
            {
                lbl_SalePaymentError.Text = ex.Message;
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            txt_BillId.Text = row.Cells[1].Text;
            txt_BillNo.Text = row.Cells[2].Text;

            txt_Amount.Text = row.Cells[5].Text;
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("InsertDetailIntoSalePayment", SqlConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PaymentDate", txt_PaymentDate.Text);
                    cmd.Parameters.AddWithValue("@BillId", txt_BillId.Text);
                    cmd.Parameters.AddWithValue("@CustomerId", ddl_CustomerName.SelectedValue);
                    cmd.Parameters.AddWithValue("@PaymentType", ddl_PaymentType.SelectedValue);
                    cmd.Parameters.AddWithValue("@TransactionNo", txt_TransactionNo.Text);
                    cmd.Parameters.AddWithValue("@Amount", txt_Payment.Text);
                    cmd.ExecuteNonQuery();

                    lbl_Message.Text = "Data Inserted Sucessfully";
                    lbl_Message.Visible = true;
                    lbl_SalePaymentError.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lbl_SalePaymentError.Text = ex.Message;
                lbl_SalePaymentError.Visible = false;
                lbl_Message.Visible = true;
            }
        }
    }
}
