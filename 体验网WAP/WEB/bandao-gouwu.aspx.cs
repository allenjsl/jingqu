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
    public partial class bandao_gouwu : System.Web.UI.Page
    {
        protected 预订方式 BuyType = 预订方式.不显示预定;
        protected string BuyUrl = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");

                var model = BHotspot.GetShopModel(Id);
                if (model != null)
                {
                    this.ltrName.Text = model.hotspot_name;
                    this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.coverphoto) + "\"/>";
                    this.ltrInfo.Text = model.oneintro;
                    BuyType = (预订方式)(model.bookingType.HasValue ? model.bookingType.Value : 0);
                    BuyUrl = model.thirdpartBookingUrl;
                    InitItemList(Id);
                }
                else
                {
                    MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                    return;
                }
            }
        }
        /// <summary>
        /// 子项绑定
        /// </summary>
        /// <param name="Id"></param>
        private void InitItemList(string Id)
        {
            var model = BHotspot.GetShopModel(Id);
            if (model != null)
            {
                var ItemsList = BHotspot.GetShopItemList(Id);
                if (ItemsList != null)
                {
                    this.rptItemsList.DataSource = ItemsList;
                    this.rptItemsList.DataBind();
                }
            }
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