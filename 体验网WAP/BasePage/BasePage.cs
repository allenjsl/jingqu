using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using YCH.DataCenter.DTO;
using Adpost.YCH.Utility;

namespace Adpost.YCH.WAP
{    
    /// <summary>
    /// 用户验让实体
    /// </summary>
    public class MemberLoginModel
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Nickname { get; set; }
    }
    /// <summary>
    /// 所有页面基类
    /// 功能：统一处理页面共性，处理用户身份，存储基本的用户信息，页面元信息的处理方法集合
    /// </summary>
    public class BasePage : System.Web.UI.Page
    {
        #region 属性
        protected const string _AuthorName = "YCHWEBLogin";
        protected static int Target = Utils.GetInt(ConfigurationManager.AppSettings["Language"]);
        private string ClientId = ConfigurationManager.AppSettings["ClientId"];
        private string ClientSecret = ConfigurationManager.AppSettings["ClientSecret"];
        private string TokenUri = ConfigurationManager.AppSettings["TokenUri"];
        private string strMenuIdFromUrl = Utils.GetQueryStringValue("MenuId");
        #endregion
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            Adpost.Common.License.License.CheckLicense();
            if (!String.IsNullOrWhiteSpace(strMenuIdFromUrl))
            {
                SetSeoInfo(Common.MenuSeoInfo(strMenuIdFromUrl));
            }
            else
            {
                SetStatPageViewInfo();
            }
        }
        /// <summary>
        /// 页面访问记录
        /// </summary>
        private void SetStatPageViewInfo()
        {

            Adpost.YCH.BLL.BPageviewinfo.Add(new StatpageviewinfoDTO
            {
                id = System.Guid.NewGuid().ToString(),
                appname = Convert.ToString((YCHTarget)Target),
                modulename = this.Title,
                pagename = this.Title,
                pageurl = HttpContext.Current.Request.Url.PathAndQuery,
                clientIP = GetIP(),
                clientbrowser = Request.Browser.Browser,
                clientprovince = "",
                createdate = DateTime.Now
            });
        }
        private string GetIP()
        {
            string result = String.Empty;

            result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(result))
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            if (string.IsNullOrEmpty(result))
            {
                result = HttpContext.Current.Request.UserHostAddress;
            }
            if (string.IsNullOrEmpty(result))
            {
                return "127.0.0.1";
            }
            return result;
        }
        /// <summary>
        /// SEO 设置
        /// </summary>
        /// <param name="model"></param>
        protected void SetSeoInfo(SeoInfo model)
        {
            if (model != null)
            {
                if (!String.IsNullOrWhiteSpace(model.WebTitle))
                    this.Header.Title = model.WebTitle;
                if (!String.IsNullOrWhiteSpace(model.Keywords))
                    AddMetaTag("keywords", model.Keywords);
                if (!String.IsNullOrWhiteSpace(model.Description))
                    AddMetaTag("description", model.Description);
                SetStatPageViewInfo();
            }
        }
        #region meta 标记
        /// <summary>
        /// 添加Meta 标记到页面头部
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        protected virtual void AddMetaTag(string name, string value)
        {
            if (String.IsNullOrEmpty(name) || String.IsNullOrEmpty(value))
            {
                return;
            }

            HtmlMeta meta = new HtmlMeta();
            meta.Name = name;
            meta.Content = value;
            if (Page.Header != null)
            {
                Page.Header.Controls.Add(meta);
            }
        }

        /// <summary>
        /// 添加Content-Type Meta标记到页面头部
        /// </summary>
        protected virtual void AddMetaContentType()
        {
            HtmlMeta meta = new HtmlMeta();
            //meta.HttpEquiv = "content-type";
            //meta.Content = Response.ContentType + "; charset=" + Response.ContentEncoding.HeaderName;
            meta.Attributes["charset"] = Response.ContentEncoding.HeaderName;
            if (Page.Header != null)
            {
                Page.Header.Controls.Add(meta);
            }
        }
        /// <summary>
        /// 添加IE8兼容IE7 Meta Tag.
        /// </summary>
        protected virtual void AddMetaIE8Compatible()
        {
            HtmlMeta meta = new HtmlMeta();
            meta.HttpEquiv = "X-UA-Compatible";
            meta.Content = "IE=EmulateIE7";
            if (Page.Header != null)
            {
                Page.Header.Controls.Add(meta);
            }
        }
        #endregion
        #region 登陆验证
        /// <summary>
        /// 登陆验证
        /// </summary>
        public void IsLogin()
        {
            if (LoginCheck() == null)
            {
                Response.Redirect("/WEB/Login.aspx?Url=" + Request.Url, true);
                return;
            }
        }
        /// <summary>
        /// 登陆验证
        /// </summary>
        public MbmemberDTO LoginCheck()
        {
            MemberLoginModel model = new MemberLoginModel();
            HttpCookie hc = HttpContext.Current.Request.Cookies[_AuthorName];
            if (hc != null)
            {
                bool IsLoginState = true;
                if (!String.IsNullOrWhiteSpace(hc["Id"]))
                {
                    model.Id = hc["Id"];
                }
                else
                {
                    IsLoginState = false;
                }

                if (!String.IsNullOrWhiteSpace(hc["UserName"]))
                {
                    model.UserName = hc["UserName"];
                }
                else
                {
                    IsLoginState = false;
                }
                if (!String.IsNullOrWhiteSpace(hc["nickname"]))
                {
                    model.Nickname = hc["nickname"];
                }
                if (IsLoginState)
                {
                    var MemberModel = Adpost.YCH.BLL.BMember.GetModel(model.Id);
                    if (MemberModel != null) { return MemberModel; } else { return null; }
                }
                else
                {
                    return null;
                }
            }
            else { return null; }
        }
        #endregion
    }
}