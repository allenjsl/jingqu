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

namespace Adpost.YCH.WEB
{
    /// <summary>
    /// 登陆
    /// </summary>
    public partial class login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            string UserName = Utils.GetFormValue("username");
            string Password = Utils.GetFormValue("userpwd");
            string IsRember = Utils.GetFormValue("cbRember");
            if (string.IsNullOrWhiteSpace(UserName) || string.IsNullOrWhiteSpace(Password)) {
                MessageBox.ShowAndReturnBack("请输入用户名和密码！");
                return;
            }
            var result = BMember.Login(UserName, Password);
            if (result != null) {
                HttpCookie Hc = new HttpCookie(_AuthorName);
                Hc.Values.Add("Id", result.id);
                Hc.Values.Add("UserName", result.user_name);
                Hc.Values.Add("nickname", result.nickname);
                if (IsRember == "1")
                    Hc.Expires = DateTime.Now.AddMonths(1);
                HttpContext.Current.Response.Cookies.Add(Hc);
                MessageBox.ShowAndRedirect("用户登陆成功！", "/member/member_info.aspx");
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