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

namespace Adpost.YCH.WEB.news
{
    public partial class news_endevent : BasePage
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
            pi.AddCondition<CptoutactivitiesDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<CptoutactivitiesDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //已结束活动
            DateTime cDate = DateTime.Now;
            pi.AddCondition<CptoutactivitiesDTO>(o => o.act_enddate, cDate, QueryMethod.LessThanOrEqual);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<CptoutactivitiesDTO>(o => o.act_name, Keyword, QueryMethod.Like);
            }
            pi.OrderBy.Add("create_date", OrderByType.Asc);
            var list = BActivities.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
    }
}