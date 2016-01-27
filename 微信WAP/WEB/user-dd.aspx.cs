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
    public partial class user_dd : BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                InitList();
            }
        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList()
        {
            int typeId = Utils.GetInt(Utils.GetQueryStringValue("Type"));
            CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            //pi.AddCondition<ViewOrderDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<ViewOrderDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            if (typeId != 0)
            {
                pi.AddCondition<ViewOrderDTO>(o => o.ordertype, typeId, QueryMethod.Equal);
            }
            else
            {
                pi.AddCondition<ViewOrderDTO>(o => o.ordertype, (int)订单类型.酒店订单, QueryMethod.Equal);
            }
            var model = LoginCheck();
            pi.AddCondition<ViewOrderDTO>(o => o.member_id, model.id, QueryMethod.Equal);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<ViewOrderDTO>(o => o.productname, Keyword, QueryMethod.Like);
            }
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BOrder.GetViewList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        /// <summary>
        /// 订单操作管理
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="Stat"></param>
        /// <returns></returns>
        protected string Op(string Id, 订单状态 Stat)
        {
            if (Stat == 订单状态.已支付)
            {
                return "";//<a href=\"member_order.aspx?Id=" + Id + "&Type=" + Utils.GetQueryStringValue("Type") + "\">查看</a>
            }
            else
            {
                return "<a href=\"Member_Order_Del.aspx?Id=" + Id + "&Type=" + Utils.GetQueryStringValue("Type") + "\">删除</a>";
            }
        }
    }
}