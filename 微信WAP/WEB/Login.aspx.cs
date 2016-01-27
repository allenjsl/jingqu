#region 命名空间
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.Model;
using Adpost.YCH.BLL;
using Adpost.YCH.Utility;
using Newtonsoft.Json;
using YCH.DataCenter.DTO;
using ZFramework.Pager;
#endregion

namespace Adpost.YCH.WAP.WEB
{
    public partial class Login : BasePage
    {
        protected string OpenId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OpenId = Utils.GetQueryStringValue("OpenId");
                if (LoginCheck() != null)
                {
                    Response.Redirect("user-center.aspx",true);
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string OpenId = GetOpenId();
            string UserName = Utils.GetFormValue("username");
            string Password = Utils.GetFormValue("userpwd");
            string IsRember = Utils.GetFormValue("cbRember");
            if (string.IsNullOrWhiteSpace(UserName) || string.IsNullOrWhiteSpace(Password))
            {
                MessageBox.ShowAndReturnBack("请输入用户名和密码！");
                return;
            }
            var result = BMember.Login(UserName, Password);
            if (result != null)
            {
                if (!String.IsNullOrWhiteSpace(OpenId)) {
                    if (String.IsNullOrWhiteSpace(result.wzid)) {
                        result.hzwzlx = 第三方登陆类型.微信.ToString();
                        result.wzid = OpenId;
                        BMember.Update(result);
                    }
                }
                HttpCookie Hc = new HttpCookie(_AuthorName);
                Hc.Values.Add("Id", result.id);
                Hc.Values.Add("UserName", result.user_name);
                Hc.Values.Add("nickname", result.nickname);
                if (IsRember == "1")
                    Hc.Expires = DateTime.Now.AddMonths(1);
                HttpContext.Current.Response.Cookies.Add(Hc);
                if (!String.IsNullOrWhiteSpace(Utils.GetQueryStringValue("Url")))
                    MessageBox.ShowAndRedirect("用户登陆成功！", Utils.GetQueryStringValue("Url"));
                else
                    MessageBox.ShowAndRedirect("用户登陆成功！", "user-center.aspx");
                return;
            }
            else
            {
                MessageBox.ShowAndReturnBack("用户名或密码不正确！");
                return;
            }
        }
    }
}