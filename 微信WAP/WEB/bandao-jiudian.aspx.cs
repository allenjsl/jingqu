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

namespace Adpost.YCH.WAP.WEB
{
    public partial class bandao_jiudian : System.Web.UI.Page
    {
        protected 预订方式 BuyType = 预订方式.不显示预定;
        protected string BuyUrl = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
             string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var model = BHotspot.GetHotelModel(Id);
                    if (model != null)
                    {
                        ltrName.Text = model.hotspot_name;
                        this.ltrImg.Text = "<img src=\"" + Common.PhotoSplit(model.coverphoto, 0) + "\"/>";
                        InitRoomInfo(Id);
                        this.ltrInfo.Text = model.intro;
                        BuyType = (预订方式)(model.bookingType.HasValue ? model.bookingType.Value : 0);
                        BuyUrl = model.thirdpartBookingUrl;
                    }
                    else
                    {
                        MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                        return;
                    }
                }
            }
            else
            {
                MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                return;
            }
        }
        /// <summary>
        /// 子项绑定
        /// </summary>
        /// <param name="Id"></param>
        private void InitRoomInfo(string Id)
        {
            var ItemsList = BHotspot.GetHotelRoomList(Id);
            if (ItemsList != null)
            {
                this.rptItemsList.DataSource = ItemsList;
                this.rptItemsList.DataBind();
            }
        }
        protected string PhotoList(string photoList)
        {
            if (!String.IsNullOrWhiteSpace(photoList))
            {
                string[] pl = photoList.Split('|');
                if (pl.Length > 0) { return pl[0]; }
                else
                {
                    return Common.NoPhotoDefault("");
                }
            }
            else { return ""; }
        }
        protected string BuyButton(string Id)
        {
            string str = "";
            switch (BuyType)
            {
                case 预订方式.跳转淘宝店:
                    str = "<a href=\"TUrl.aspx?rurl=" + Server.UrlEncode(BuyUrl) + "\" class=\"yuding-btn\">预定</a>";
                    break;
            }
            return str;
        }
    }
}