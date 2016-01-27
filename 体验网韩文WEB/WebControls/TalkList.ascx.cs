using System;
using System.Collections.Generic;
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

namespace Adpost.YCH.WEB.WebControls
{
    public partial class TalkList : System.Web.UI.UserControl
    {
        /// <summary>
        /// 评论类型
        /// </summary>
        public 评论类型 CommentType { get; set; }
        /// <summary>
        /// 被评论编号
        /// </summary>
        public string HotspotId { get; set; }
        /// <summary>
        /// 会员编号
        /// </summary>
        public string MemberId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { InitReplyList(); }
        }
        /// <summary>
        /// 加载评论列表
        /// </summary>
        private void InitReplyList()
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 50;
            pi.AddCondition<TywcommentDTO>(o => o.datasource,BasePage.Target, QueryMethod.Equal);
            pi.AddCondition<TywcommentDTO>(o => o.objecttype, (int)CommentType, QueryMethod.Equal);
            pi.AddCondition<TywcommentDTO>(o => o.objectid, HotspotId, QueryMethod.Equal);
            pi.AddCondition<TywcommentDTO>(o => o.replyid, "0", QueryMethod.Equal);
            if (!String.IsNullOrEmpty(MemberId))
                pi.AddCondition<TywcommentDTO>(o => o.uid, MemberId, QueryMethod.Equal);
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BComment.GetList(pi);
            if (list != null)
            {
                this.rptMsgList.DataSource = list;
                this.rptMsgList.DataBind();
            }
        }
        /// <summary>
        /// 回复绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptMsgList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptReplyList = (Repeater)e.Item.FindControl("rptReplyList");
                var row = (TywcommentDTO)e.Item.DataItem;
                var TalkId = row.id;
                row = null;
                PageInfo pi = new PageInfo();
                pi.PageIndex = 1;
                pi.PageSize = 50;
                pi.AddCondition<TywcommentDTO>(o => o.replyid, TalkId, QueryMethod.Equal);
                pi.OrderBy.Add("create_date", OrderByType.Desc);
                var list = BComment.GetList(pi);
                if (list != null)
                {
                    rptReplyList.DataSource = list;
                    rptReplyList.DataBind();
                }
            }
        }
    }
}