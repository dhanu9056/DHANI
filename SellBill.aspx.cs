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
    public partial class SellBill : System.Web.UI.Page
    {
        private bool _IsSupress;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //txt_SaleBillDate.Text = DateTime.Now.ToShortDateString();
                BindGridView();
                BindProductType();
                BindCustomerName();
                BillNo();
            }      
        }
        private void BillNo()
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    int a;
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectMaxBillNoFromSaleBill", SqlConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        string val = dr[0].ToString();
                        if (val == "")
                        {
                            txt_SaleBillNo.Text = "";
                        }
                        else
                        {
                            a =dr[0].ToString().ToInt();
                            a = a + 1;
                            txt_SaleBillNo.Text = a.ToString();
                        }
                    }

                }
            }

            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }

        }
        private void BindGridView()
        {
            DataTable oDT = new DataTable();
            oDT.Columns.Add("ProductId");
            oDT.Columns.Add("ProductType");
            oDT.Columns.Add("Quantity");
            oDT.Columns.Add("Rate");
            oDT.Columns.Add("Discount");
            oDT.Columns.Add("Total");

            GridView2.DataSource = oDT;
            GridView2.DataBind();
            ViewState["detail"] = oDT;
        }
        private void BindProductType()
        {
            try
            {

                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {

                    SqlConn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("SelectProductIdProductTypeFromProduct", SqlConn);
                    sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddl_SaleProductType.DataTextField = "ProductType";
                    ddl_SaleProductType.DataValueField = "ProductId";
                    ddl_SaleProductType.DataSource = dt;
                    ddl_SaleProductType.DataBind();
                    ddl_SaleProductType.DataSourceID = null;
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
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
                lbl_Error.Text = ex.Message;
            }
        }
        
        protected void btn_SaleProductAdd_Click1(object sender, EventArgs e)
        {
            DataTable oDT = ViewState["detail"] as DataTable;
            DataRow oDR = oDT.NewRow();
            oDR["ProductId"] = ddl_SaleProductType.SelectedValue;
            oDR["ProductType"] = ddl_SaleProductType.SelectedItem.Text;
            oDR["Quantity"] = txt_Quantity.Text;
            oDR["Rate"] = txt_Rate.Text;
            oDR["Discount"] = txt_Discount.Text; ;
            oDR["Total"] = txt_Total.Text;
            oDT.Rows.Add(oDR);
            GridView2.DataSource = oDT;
            GridView2.DataBind();
            ViewState["detail"] = oDT;

            CalculationFinalAmount(txt_Total.Text.ToDecimal());
            ClearDetailControl();
        }

        private void CalculationFinalAmount(decimal total)
        {
            
            decimal billamt = txt_BillAmount.Text.ToDecimal();
            billamt = billamt + total;
            txt_BillAmount.Text = billamt.ToString();
            decimal final = Math.Round(billamt, 0);
            txt_RoundupAmount.Text = (final - billamt).ToString();
            txt_FinalAmount.Text = final.ToString();
        }
        private void CalculationTotal()
        {
            if (!_IsSupress)
            {
                int qty = txt_Quantity.Text.ToInt();
                decimal rate = txt_Rate.Text.ToDecimal();
                decimal total = qty * rate;
                decimal dis = txt_Discount.Text.ToDecimal();
                decimal discount = total * dis / 100;
                decimal totalAmount = total - discount;
                txt_Total.Text = totalAmount.ToString();
            }
        }
        protected void txt_Rate_TextChanged(object sender, EventArgs e)
        {
            CalculationTotal();
            txt_Discount.Focus();
        }

        protected void txt_Quantity_TextChanged(object sender, EventArgs e)
        {
            CalculationTotal();
            txt_Rate.Focus();
        }

        protected void txt_Discount_TextChanged(object sender, EventArgs e)
        {
            CalculationTotal();
            txt_Total.Focus();
        }

        private void ClearDetailControl()
        {
            _IsSupress = true;
            ddl_SaleProductType.SelectedIndex = 0;
            txt_Rate.Text = "";
            txt_Quantity.Text = "";
            txt_Discount.Text = "";
            txt_Total.Text = "";
            _IsSupress = false;
        }
        protected void ddl_ProductType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("SelectSaleRatefromProduct", SqlConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductId", ddl_SaleProductType.SelectedItem.Value);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        txt_Rate.Text = sdr["SaleRate"].ToString();
                        lbl_AvailableQuantity.Text = sdr["BalanceQuantity"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }
        protected void btn_Submit_Click1(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("InsertSaleBill", SqlConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BillNo", txt_SaleBillNo.Text);
                    cmd.Parameters.AddWithValue("@BillDate", txt_SaleBillDate.Text);
                    cmd.Parameters.AddWithValue("@BillMode", ddl_SaleBillMode.SelectedValue);
                    cmd.Parameters.AddWithValue("@CustomerId", ddl_CustomerName.SelectedValue);
                    cmd.Parameters.AddWithValue("@BillAmount", txt_BillAmount.Text);
                    cmd.Parameters.AddWithValue("@RoundupAmount", txt_RoundupAmount.Text);
                    cmd.Parameters.AddWithValue("@FinalAmount", txt_FinalAmount.Text);
                    cmd.Parameters.AddWithValue("@DetailXML", (ViewState["detail"] as DataTable).ToXML());
                    cmd.ExecuteNonQuery();
                    lbl_Message.Text = "Bill Inserted Sucessfully";
                    BillNo();
                    lbl_Message.Visible = true;
                    lbl_Error.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
                lbl_Error.Visible = false;
                lbl_Message.Visible = true;
            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable oDT = ViewState["detail"] as DataTable;
            DataRow oDR = oDT.Rows[e.RowIndex];
            decimal total = oDR["Total"].ToDecimal() * -1;
            CalculationFinalAmount(total);
            oDR.Delete();
            GridView2.DataSource = oDT;
            GridView2.DataBind();
        }
      /*  protected void txt_SaleBillDate_TextChanged(object sender, EventArgs e)
        {
            txt_SaleBillDate.Text = DateTime.Now.ToShortDateString();
            // TextBoxStartDate.Text = DateTime.Now();
        }*/
    }

}
