using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.BLL;

namespace Adpost.YCH.WEB.WebControls
{
    public partial class WebHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                //Response.Write(Request.CurrentExecutionFilePath);
                if (Request.CurrentExecutionFilePath.ToLower() == "/default.aspx" || Request.CurrentExecutionFilePath.ToLower() == "default.aspx")
                    this.phLanguage.Visible = true;
                var LoginModel = new BasePage().LoginCheck();
                if (LoginModel == null)
                {
                    this.ltrLoginInfo.Text = "<p><a href=\"/login.aspx\">登录</a><a href=\"/register.aspx\">注册</a></p>";
                }
                else {
                    if (BMemberSign.IsSign(LoginModel.id) == false)
                    {
                        this.ltrLoginInfo.Text = "<p><a href=\"/RegistrationIt.aspx\" class=\"qd-btn\">签到</a><a href=\"/member/member_info.aspx\">" + LoginModel.nickname + "</a><a href=\"/Logout.aspx\">退出</a></p>";
                    }
                    else
                    {
                        this.ltrLoginInfo.Text = "<p><a href=\"/RegistrationIt.aspx\" class=\"qd-btn\">今日已签</a><a href=\"/member/member_info.aspx\">" + LoginModel.nickname + "</a><a href=\"/Logout.aspx\">退出</a></p>";
                    }
                }
            }
        }
    }
}