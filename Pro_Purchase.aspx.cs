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
    public partial class Purchase : System.Web.UI.Page
    {
        private bool _IsSupress;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindProductType();
                BindSupplierName();

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
            GridView1.DataSource = oDT;
            GridView1.DataBind();
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
                    ddl_PurchaseProductType.DataTextField = "ProductType";
                    ddl_PurchaseProductType.DataValueField = "ProductId";
                    ddl_PurchaseProductType.DataSource = dt;
                    ddl_PurchaseProductType.DataBind();
                    ddl_PurchaseProductType.DataSourceID = null;
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }
        private void BindSupplierName()
        {
            try
            {

                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {

                    SqlConn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("SelectSupplierIdSupplierName", SqlConn);
                    sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddl_SupplierName.DataTextField = "Name";
                    ddl_SupplierName.DataValueField = "SupplierId";
                    ddl_SupplierName.DataSource = dt;
                    ddl_SupplierName.DataBind();
                    ddl_SupplierName.DataSourceID = null;
                }
            }
            catch (Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }
        protected void btn_PurchaseProductAdd_Click(object sender, EventArgs e)
        {
            DataTable oDT = ViewState["detail"] as DataTable;
            DataRow oDR = oDT.NewRow();
            oDR["ProductId"] = ddl_PurchaseProductType.SelectedValue;
            oDR["ProductType"] = ddl_PurchaseProductType.SelectedItem.Text;
            oDR["Quantity"] = txt_Quantity.Text;
            oDR["Rate"] = txt_Rate.Text;
            oDR["Discount"] = txt_Discount.Text; ;
            oDR["Total"] = txt_Total.Text;
            oDT.Rows.Add(oDR);
            GridView1.DataSource = oDT;
            GridView1.DataBind();
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
            ddl_PurchaseProductType.SelectedIndex = 0;
            txt_Rate.Text = "";
            txt_Quantity.Text = "";
            txt_Discount.Text = "";
            txt_Total.Text = "";
            _IsSupress = false;
        }
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("InsertPurchaseBill", SqlConn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BillNo", txt_PurchaseBillNo.Text);
                    cmd.Parameters.AddWithValue("@BillDate", txt_PurchaseBillDate.Text);
                    cmd.Parameters.AddWithValue("@BillMode", ddl_PurchaseBillMode.SelectedValue);
                    cmd.Parameters.AddWithValue("@SupplierId", ddl_SupplierName.SelectedValue);
                    cmd.Parameters.AddWithValue("@BillAmount", txt_BillAmount.Text);
                    cmd.Parameters.AddWithValue("@RoundupAmount", txt_RoundupAmount.Text);
                    cmd.Parameters.AddWithValue("@FinalAmount", txt_FinalAmount.Text);
                    cmd.Parameters.AddWithValue("@DetailXML", (ViewState["detail"] as DataTable).ToXML());
                    cmd.ExecuteNonQuery();

                    lbl_Message.Text = "Bill Inserted Sucessfully";
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable oDT = ViewState["detail"] as DataTable;
            DataRow oDR = oDT.Rows[e.RowIndex];
            decimal total = oDR["Total"].ToDecimal() * -1;
            CalculationFinalAmount(total);
            oDR.Delete();
            GridView1.DataSource = oDT;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
            GridView1.DataBind();
        }
    }
}

        