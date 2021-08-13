using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Gk_Cake_shop
{
    public static class MessageBox
    {
        public static void ShowMessage(this Page c, string Message)
        {
            ScriptManager.RegisterStartupScript(c, c.GetType(), "alertMessage", "alert('" + Message + "');", true);
        }
        public static void ShowMessageAndRedirect(this Page c, string Message, string RedirectURL)
        {
            ScriptManager.RegisterStartupScript(c, c.GetType(), "alertMessage", "alert('" + Message + "');window.location.href='" + RedirectURL + "'", true);
        }
    }
}