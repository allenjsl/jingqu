using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Adpost.YCH.WEB.WebControls
{
    public partial class WebHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                var LoginModel = new BasePage().LoginCheck();
                if (LoginModel == null)
                {
                    //this.ltrLoginInfo.Text = "<p><span><a href=\"/login.aspx\">登录</a></span><span><a href=\"/register.aspx\">注册</a></span></p>";
                }
                else {
                    //this.ltrLoginInfo.Text = "<p><span><a href=\"/member/member_info.aspx\">" + LoginModel.nickname + "</a></span><span><a href=\"/Logout.aspx\">退出</a></span></p>";
                }
            }
        }
    }
}