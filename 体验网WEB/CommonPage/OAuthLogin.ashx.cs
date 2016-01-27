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

namespace Adpost.YCH.WEB.CommonPage
{
    /// <summary>
    /// 第三方登陆用户信息保存
    /// </summary>
    public class OAuthLogin : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            bool IsResult = false;
            string msg = "登陆失败!";
            int Target = Utils.GetInt(Utils.GetQueryStringValue("Target"));
            string LoginType = Utils.GetQueryStringValue("LoginType");
            string openId = Utils.GetQueryStringValue("openId");
            string accessToken = Utils.GetQueryStringValue("accessToken");
            string head = Utils.GetQueryStringValue("head");
            string nickname = Utils.GetQueryStringValue("nickname");
            context.Response.ContentType = "text/plain";
            context.Response.Expires = 0;
            context.Response.CacheControl = "no-cache";
            context.Response.Cache.SetNoStore();
            switch (LoginType)
            {
                case "QQ":
                    if (!String.IsNullOrWhiteSpace(openId))
                    {
                        var IsExist = BMember.IsExist(第三方登陆类型.QQ, openId);
                        if (IsExist == false)
                        {
                            var model = new MbmemberDTO()
                            {
                                id = System.Guid.NewGuid().ToString(),
                                user_name = openId,
                                password = "123456",
                                nickname = nickname,
                                mail = "",
                                khqy1 = "0",
                                khqy2 = "0",
                                khqy3 = "0",
                                head = head,
                                hzwzlx = 第三方登陆类型.QQ.ToString(),
                                wzid = openId,
                                publishtarget = Target,
                                create_date = DateTime.Now
                            };
                            var Result = BMember.Add(model);
                            if (Result)
                            {
                                var result = BMember.Login(第三方登陆类型.QQ, openId);
                                if (result != null)
                                {
                                    HttpCookie Hc = new HttpCookie(BasePage._AuthorName);
                                    Hc.Values.Add("Id", result.id);
                                    Hc.Values.Add("UserName", result.user_name);
                                    Hc.Values.Add("nickname", result.nickname);
                                    HttpContext.Current.Response.Cookies.Add(Hc);
                                    msg = "用户登陆成功！";
                                    IsResult = true;
                                }
                                else
                                {
                                    msg = "用户登陆失败！";
                                }
                            }
                            else
                            {
                                msg = "添加用户失败！";
                            }
                        }
                        else {
                            var result = BMember.Login(第三方登陆类型.QQ, openId);
                            if (result != null)
                            {
                                HttpCookie Hc = new HttpCookie(BasePage._AuthorName);
                                Hc.Values.Add("Id", result.id);
                                Hc.Values.Add("UserName", result.user_name);
                                Hc.Values.Add("nickname", result.nickname);
                                HttpContext.Current.Response.Cookies.Add(Hc);
                                msg = "用户登陆成功！";
                                IsResult = true;
                            }
                            else
                            {
                                msg = "用户登陆失败！";
                            }
                        }
                    }
                    else
                    {
                        msg = "取得用户标识失败！";
                    }
                    break;
            }
            Utils.RCWE(UtilsCommons.AjaxReturnJson(IsResult ? "1" : "0", msg));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}