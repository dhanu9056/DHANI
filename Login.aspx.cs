using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace Gk_Cake_shop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ABC"].ConnectionString))
                {
                    SqlConn.Open();
                    SqlDataAdapter da = new SqlDataAdapter("SelectAllFromUserLoginWhereLoginNameAndUserPassword", ConfigurationManager.ConnectionStrings["ABC"].ConnectionString);
                    da.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.AddWithValue("@LoginName", txt_LoginName.Text);
                    da.SelectCommand.Parameters.AddWithValue("@UserPassword", txt_UserPassword.Text);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count == 1)
                    {
                        Session["UserId"] = dt.Rows[0]["UserId"];
                        Session["LoginName"] = dt.Rows[0]["LoginName"];
                        Session["Name"] = dt.Rows[0]["Name"];
                        FormsAuthenticationTicket t = new FormsAuthenticationTicket(1, dt.Rows[0]["LoginName"] + "", DateTime.Now, DateTime.Now.AddMinutes(30), chk_Remember.Checked, "Admin");
                        string hash = FormsAuthentication.Encrypt(t);
                        HttpCookie c = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
                        Response.Cookies.Add(c);
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Label1.Text =("Incorrect Password");
                        Label1.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lbl_Error1.Text = ex.Message;
            }
        }
    }
}