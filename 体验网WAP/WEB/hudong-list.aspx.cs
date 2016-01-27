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

namespace Adpost.YCH.WAP.WEB
{
    /// <summary>
    /// 调用光影记录
    /// </summary>
    public partial class hudong_list : BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = int.MaxValue;
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
                this.rptList.DataSource =  list;
                this.rptList.DataBind();
            }
        }
    }
}