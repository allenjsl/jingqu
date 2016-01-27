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
    public partial class share_surveys_End :BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
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
            CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            pi.AddCondition<TywquestionnairemainDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywquestionnairemainDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //有效活动
            DateTime cDate = DateTime.Now;
            pi.AddCondition<CptoutactivitiesDTO>(o => o.endtime, cDate, QueryMethod.LessThanOrEqual);
            pi.OrderBy.Add("create_date", OrderByType.Asc);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<TywquestionnairemainDTO>(o => o.name, Keyword, QueryMethod.Like);
            }
            //Response.Write(pi.ToSqlCondition());
            var list = BQuestionnaire.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        /// <summary>
        /// 调查内容绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ItemListBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                TywquestionnairemainDTO Model = (TywquestionnairemainDTO)e.Item.DataItem;
                string QId = Model.id;
                Model = null;
                Repeater rptItemList = (Repeater)e.Item.FindControl("rptItemList");
                var list = BQuestionnaire.GetList(QId);
                if (list != null)
                {
                    rptItemList.DataSource = list;
                    rptItemList.DataBind();
                }
            }
        }
        /// <summary>
        /// 切内容
        /// </summary>
        /// <param name="ItemInfo"></param>
        /// <returns></returns>
        protected string SpliteQuestionItem(string ItemId, string ItemInfo)
        {
            System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
            string[] items = Utils.Split(ItemInfo, "#");
            if (items.Length > 0)
            {
                foreach (string m in items)
                {
                    tmpStr.Append("<tr><td class=\"survey_td1\"><input type=\"radio\" id=\"ItemValue_" + ItemId + "\" name=\"ItemValue_" + ItemId + "\" value=\"" + m + "\">" + m + "</td></tr>");
                }
            }
            return tmpStr.ToString();
        }
    }
}