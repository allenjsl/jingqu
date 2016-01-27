using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.Utility;

namespace Adpost.YCH.WAP.WEB
{
    public partial class TUrl : System.Web.UI.Page
    {
        protected string url = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                url = Utils.GetQueryStringValue("rurl");
                if (!String.IsNullOrWhiteSpace(url))
                    url = Server.UrlDecode(url);
            }
        }
    }
}