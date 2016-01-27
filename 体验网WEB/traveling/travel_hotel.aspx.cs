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
using YCH.DataCenter.DTO.Base;
using ZFramework.Pager;
#endregion

namespace Adpost.YCH.WEB.traveling
{
    public partial class travel_hotel : BasePage
    {
        protected string Id = "";
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
            Id = Utils.GetQueryStringValue("Id");
            int CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<HotspotHotelDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<HotspotHotelDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.OrderBy.Add("order_id", OrderByType.Asc);
            //Response.Write(pi.ToSqlCondition());
            var list = BHotspot.GetHotelsList(pi);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
                if (!String.IsNullOrEmpty(Id))
                {
                    InitRoomInfo(Id);
                }
                else
                {
                    Id = list[0].hotspot_id;
                    InitRoomInfo(Id);
                }
            }
        }
        /// <summary>
        /// 子项绑定
        /// </summary>
        /// <param name="Id"></param>
        private void InitRoomInfo(string Id)
        {
            var model = BHotspot.GetHotelModel(Id);
            if (model != null)
            {
                this.ltrCoverPhoto.Text = "<img src=\"" + Common.PhotoSplit(model.coverphoto,0) + "\">";
                this.ltrHotelImg2.Text = "<img src=\"" + Common.PhotoSplit(model.coverphoto, 1) + "\">";
                ltrName.Text = model.hotspot_name;
                this.ltrDesc.Text = model.oneintro;
                this.ltrHotelTips.Text = model.tips;
                this.ltrInfoLink.Text = "<a href=\"travel_hotel_show.aspx?Id=" + model.hotspot_id + "\"><img src=\"../images/travel_hotel_btn1.jpg\"></a>";
                this.ltrTel.Text = model.complaintphone;
                this.ltrAddress.Text = model.address;
                var ItemsList = BHotspot.GetHotelRoomList(Id);
                if (ItemsList != null)
                {
                    this.rptItemsList.DataSource = ItemsList;
                    this.rptItemsList.DataBind();
                }
            }
        }        
    }
}