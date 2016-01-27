
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
    public partial class huodong_view : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitEventInfo();
            }
        }
        /// <summary>
        /// 加载活动信息
        /// </summary>
        private void InitEventInfo()
        {
            string Id = Utils.GetQueryStringValue("Id");
            if (!String.IsNullOrWhiteSpace(Id))
            {
                var model = BActivities.GetModel(Id);
                if (model != null)
                {
                    if (model.act_enddate != null)
                    {
                        if (!String.IsNullOrWhiteSpace(model.thumb_img))
                            this.ltrImg.Text = "<img src=\"" + model.thumb_img + "\">";
                        this.ltrAddress.Text = model.act_address;
                        this.ltract_registration.Text = model.act_registration;
                        this.ltrprebookphone.Text = model.prebookphone;
                        this.ltrpriceinfo.Text = model.price.ToString("F2")+"元";
                        this.ltrambitus_restaurant.Text = model.ambitus_restaurant;
                        this.ltrIntro.Text = model.act_introduce;
                        this.ltract_process.Text = model.act_process;
                        if (model.is_audit != 1) { this.phJoin.Visible = false; }
                        #region 报名次数及参加人数
                        int TotalRows = 0, TotalPeoNumber = 0;
                        PageInfo pi = new PageInfo();
                        pi.PageIndex = 1;
                        pi.PageSize = int.MaxValue;
                        pi.AddCondition<ViewOrderDTO>(o => o.ordertype, (int)订单类型.活动, QueryMethod.Equal);
                        pi.AddCondition<ViewOrderDTO>(o => o.productid, Id, QueryMethod.Equal);
                        pi.AddCondition<ViewOrderDTO>(o => o.is_delete, 0, QueryMethod.Equal);
                        var Tlist = BOrder.GetViewList(pi, ref TotalRows);
                        this.ltrJoinCount.Text = TotalRows.ToString();
                        if (Tlist != null && Tlist.Count() > 0)
                        {
                            foreach (var m in Tlist)
                            {
                                TotalPeoNumber += m.num;
                            }
                        }
                        this.ltrJoinPeoNumber.Text = TotalPeoNumber.ToString();
                        #endregion
                        if (model.allowjointimelimit <= TotalRows)
                            this.phJoin.Visible = false;
                    }
                    else
                    {
                        MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                        return;
                    }
                }
                else
                {
                    MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                    return;
                }
            }
        }
    }
}