﻿#region 命名空间
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

namespace Adpost.YCH.WAP.WEB
{
    public partial class bandao_xianlu1 : BasePage
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
            pi.PageSize = int.MaxValue;
            pi.AddCondition<CptravellineDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<CptravellineDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<CptravellineDTO>(o => o.title, Keyword, QueryMethod.Like);
            }
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BTravelline.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
    }
}