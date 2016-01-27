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
    /// CommentSubmit 的摘要说明
    /// </summary>
    public class CommentSubmit : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string Remark = context.Request.QueryString["trk"];
            string talkid = Utils.GetQueryStringValue("talkid");
            int CommentType = Utils.GetInt(context.Request.QueryString["CommentType"]);
            string HotspotId = context.Request.QueryString["HotspotId"];
            context.Response.ContentType = "text/plain";
            context.Response.Expires = 0;
            context.Response.CacheControl = "no-cache";
            context.Response.Cache.SetNoStore();
            if (!String.IsNullOrEmpty(Remark))
            {
                string Uid = "";
                string name = "匿名";
                MbmemberDTO model = new BasePage().LoginCheck();
                if (model != null)
                {
                    Uid = model.id;
                    name = model.nickname;
                }
                TywcommentDTO m = new TywcommentDTO();
                m.id = System.Guid.NewGuid().ToString();
                m.uid = Uid;
                m.name = name;
                m.content = Remark;
                m.commenttime = DateTime.Now;
                m.objecttype = CommentType;
                m.objectid = HotspotId;
                if (!String.IsNullOrWhiteSpace(talkid))
                    m.replyid = talkid;
                else
                    m.replyid = "0";
                m.datasource = BasePage.Target;
                var Result = BComment.Add(m);
                if (Result)
                {
                    Utils.RCWE(UtilsCommons.AjaxReturnJson("1", "评论成功！"));
                    return;
                }
                else
                {
                    Utils.RCWE(UtilsCommons.AjaxReturnJson("0", "评论失败！"));
                    return;
                }

            }
            else
            {
                Utils.RCWE(UtilsCommons.AjaxReturnJson("0", "评论失败！"));
            }
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