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

namespace Adpost.YCH.WEB.member
{
    public partial class member_line : BasePage
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
                        tmpStr.Append("<div class=\"menu_head current\"><table><tr><td width=\"8%\" class=\"head_td1\">DAY " + Convert.ToString(days).PadLeft(2, '0') + "</td><td width=\"91%\" class=\"head_td3\">");
                        tmpStr2.Append("<div class=\"menu_body\"><h1>行程详细</h1><ul>");
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
                                int typeid = (int)HostpostModel.type_id;
                                bool IsScenic = typeid == Convert.ToInt32(热点类型.景区);
                                if (IsScenic)
                                {
                                    tmpStr2.Append("<li><div class=\"line_lt left\"><img src=\"" + Common.PhotoSplit(Common.NoPhotoDefault(HostpostModel.coverphoto.ToString()),0) + "\"><p><a href=\"/about/about_scenic.aspx?Id=" + HostpostModel.hotspot_id + "#ScenicInfo\">景点详细介绍</a></p></div><div class=\"line_rt right\"><table><tr><td width=\"14%\" align=\"right\" class=\"line_rt_td1\">简介：</td><td width=\"86%\">" + HostpostModel.intro + "</td></tr><tr><td align=\"right\" class=\"line_rt_td1\">游玩时间：</td><td>" + HostpostModel.tourtime + "</td></tr><tr><td align=\"right\" class=\"line_rt_td1\">门票：</td><td>免费</td></tr><tr><td align=\"right\" class=\"line_rt_td1\">开放时间：</td><td>" + HostpostModel.begin_time + " 到 " + HostpostModel.end_time + "</td></tr><tr><td align=\"right\" class=\"line_rt_td1\">地址：</td><td>" + HostpostModel.address + "</td></tr><tr<td align=\"right\" class=\"line_rt_td1\">小贴士：</td><td>" + HostpostModel.tips + "</td></tr></table></div></li>");
                                }
                            }
                        }
                        tmpStr2.Append("</ul></div>");
                        tmpStr.Append("</td></tr></table></div>" + tmpStr2.ToString());
                        
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