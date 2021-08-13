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
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString)) 
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SelectUserCount", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if(count>0)
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
            }
            catch(Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlCommand cmd = new SqlCommand("InsertInRegistration", SqlConn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", txt_Name.Text);
                    cmd.Parameters.AddWithValue("@LoginName", txt_LoginName.Text);
                    cmd.Parameters.AddWithValue("@UserPassword", txt_UserPassword.Text);
                    cmd.Parameters.AddWithValue("@MobileNo", txt_MobileNo.Text);
                    cmd.Parameters.AddWithValue("@Email", txt_Email.Text);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
                }
            }
            catch(Exception ex)
            {
                lbl_Error.Text = ex.Message;
            }
        }
    }
}