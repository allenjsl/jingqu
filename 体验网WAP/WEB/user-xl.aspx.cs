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
    public partial class user_xl : BasePage
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
            CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            //pi.AddCondition<TywmytravellineDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            //pi.AddCondition<TywmytravellineDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            var model = LoginCheck();
            pi.AddCondition<TywmytravellineDTO>(o => o.member_id, model.id, QueryMethod.Equal);
            pi.AddCondition<TywmytravellineDTO>(o => o.ordernum, 0, QueryMethod.Equal);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<TywmytravellineDTO>(o => o.title, Keyword, QueryMethod.Like);
            }
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BMyTravelline.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        /// <summary>
        /// 线路详情绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LineDetailBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var row = (TywmytravellineDTO)e.Item.DataItem;
                Literal lineInfo = (Literal)e.Item.FindControl("ltrLineInfo");
                string Id = row.id;
                List<TywmytravellineDTO> ItemList = null;
                int days = 0;
                int rowsCount = 0;
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                System.Text.StringBuilder tmpStr2 = new System.Text.StringBuilder();
                do
                {
                    days++;
                    ItemList = BMyTravelline.GetList(Target, Id, days);
                    if (ItemList != null)
                    {
                        rowsCount = ItemList.Count();
                        tmpStr.Append("<p class=\"in-it-text\">DAY " + Convert.ToString(days).PadLeft(2, '0') + " ");
                        for (int i = 0; i < rowsCount; i++)
                        {
                            var HostpostModel = BHotspot.GetModel(ItemList[i].hotspot_id);
                            if (HostpostModel != null)
                            {
                                if (i != rowsCount - 1)
                                {
                                    tmpStr.Append(HostpostModel.hotspot_name + "&nbsp;&nbsp;→");
                                }
                                else
                                {
                                    tmpStr.Append(HostpostModel.hotspot_name);
                                }
                            }
                        }
                        tmpStr.Append("</p>");

                    }
                    else
                    {
                        rowsCount = 0;
                    }
                } while (rowsCount > 0);
                lineInfo.Text = tmpStr.ToString();
            }
        }
    }
}