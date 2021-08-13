using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gk_Cake_shop
{
    public partial class cake : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            //Clear Authentication Cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            //Clear session cookie (not necessary for your current problem but i would recommand you do it anyway)
            SessionStateSection sessionStateSection = (SessionStateSection)WebConfigurationManager.GetSection("system.web/sessionState");
            HttpCookie cookie2 = new HttpCookie(sessionStateSection.CookieName, "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);
          
            Response.Redirect("Login.aspx");
        }
    }
}