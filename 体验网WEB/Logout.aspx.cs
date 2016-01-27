using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.Utility;

namespace Adpost.YCH.WEB
{
    public partial class Logout : BasePage
    {
        protected string QQAppid = System.Configuration.ConfigurationManager.AppSettings["QQAppid"];
        protected string WBAppid = System.Configuration.ConfigurationManager.AppSettings["WBAppid"];
        protected string BDAppid = System.Configuration.ConfigurationManager.AppSettings["BDAppid"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utils.GetQueryStringValue("dotype") == "Logout") {
                HttpContext.Current.Response.Cookies[_AuthorName].Expires = DateTime.Now.AddDays(-1);
                //HttpContext.Current.Response.Redirect("/Default.aspx", true);
                Utils.RCWE(UtilsCommons.AjaxReturnJson("1" , ""));
            }
        }
    }
}