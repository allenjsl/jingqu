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
            pi.AddCondition<TywphotoalbumDTO>(o => o.source, Target, QueryMethod.Equal);
            var list = Bphotoalbum.GetList(pi);
            if (list != null)
            {
                this.rptList.DataSource=this.rptList2.DataSource = list;
                this.rptList.DataBind();
                this.rptList2.DataBind();
            }
        }
        protected void InitTalkCount(object sender, RepeaterItemEventArgs e)
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