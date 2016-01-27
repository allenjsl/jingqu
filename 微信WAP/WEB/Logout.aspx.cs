using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adpost.YCH.WAP.WEB
{
    public partial class Logout : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cookies[_AuthorName].Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Redirect("/WEB/index.aspx", true);
        }
    }
}