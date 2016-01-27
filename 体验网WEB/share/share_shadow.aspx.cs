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

namespace Adpost.YCH.WEB.share
{
    public partial class share_shadow : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitList();
            }
        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList()
        {
            int CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<TywphotoalbumDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = Bphotoalbum.GetList(pi);
            if (list != null)
            {
                this.rptList.DataSource=this.rptList2.DataSource = list;
                this.rptList.DataBind();
                this.rptList2.DataBind();
            }
        }
        /// <summary>
        /// 加载评论数
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void InitTalkCount(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptTalkList = (Repeater)e.Item.FindControl("rptTalkList");
                var Id = ((TywphotoalbumDTO)e.Item.DataItem).id;
                Literal ltrCollectCount = (Literal)e.Item.FindControl("ltrCollectCount");
                ltrCollectCount.Text = BMycollect.Count(Id);
                Literal ltrTalkCount = (Literal)e.Item.FindControl("ltrTalkCount");
                ltrTalkCount.Text = BComment.Count(Id,评论类型.光影);
                #region 评论列表
                PageInfo pi = new PageInfo();
                pi.PageIndex = 1;
                pi.PageSize = 10;
                pi.AddCondition<TywcommentDTO>(o => o.datasource, BasePage.Target, QueryMethod.Equal);
                pi.AddCondition<TywcommentDTO>(o => o.objecttype, (int)Adpost.YCH.BLL.评论类型.光影, QueryMethod.Equal);
                pi.AddCondition<TywcommentDTO>(o => o.objectid, Id, QueryMethod.Equal);
                pi.AddCondition<TywcommentDTO>(o => o.replyid, "0", QueryMethod.Equal);
                pi.OrderBy.Add("commenttime", OrderByType.Desc);
                var list = BComment.GetList(pi);
                if (list != null)
                {
                    rptTalkList.DataSource = list;
                    rptTalkList.DataBind();
                }
                #endregion
            }
        }
        /// <summary>
        /// 列表子集绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptList2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var Id = ((TywphotoalbumDTO)e.Item.DataItem).id;                
                Literal ltrCollectCount = (Literal)e.Item.FindControl("ltrCollectCount");
                ltrCollectCount.Text = BMycollect.Count(Id);
                Literal ltrTalkCount = (Literal)e.Item.FindControl("ltrTalkCount");
                ltrTalkCount.Text = BComment.Count(Id, 评论类型.光影);                
            }
        }
    }
}