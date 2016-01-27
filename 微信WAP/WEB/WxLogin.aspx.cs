using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.Model;
using Adpost.YCH.BLL;
using Adpost.YCH.Utility;

namespace Adpost.YCH.WAP.WEB
{
    public partial class WxLogin : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                string OpenId = Utils.GetQueryStringValue("openid");
                string RedirectUrl = Utils.GetQueryStringValue("redirUrl");
                if (!String.IsNullOrWhiteSpace(OpenId))
                {
                    if (!String.IsNullOrWhiteSpace(RedirectUrl)) {
                        RedirectUrl = Server.UrlDecode(RedirectUrl);
                        var result = BMember.Login(第三方登陆类型.微信, OpenId);
                        if (result != null)
                        {
                            HttpCookie Hc = new HttpCookie(_AuthorName);
                            Hc.Values.Add("Id", result.id);
                            Hc.Values.Add("UserName", result.user_name);
                            Hc.Values.Add("nickname", result.nickname);
                            HttpContext.Current.Response.Cookies.Add(Hc);
                            Response.Redirect(RedirectUrl, true);
                        }
                        else
                        {
                            //保存 OpenId Cookies
                            HttpCookie Hc = new HttpCookie(_OpenIdCookieName);
                            Hc.Values.Add("OpenId", OpenId);
                            HttpContext.Current.Response.Cookies.Add(Hc);
                            Response.Redirect(RedirectUrl, true);
                        }
                    } else {
                        Response.Redirect("/", true);
                    }
                }
                else {
                    Response.Redirect(RedirectUrl, true);
                }
            }
        }
    }
}