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
    public partial class travel_shopping :BasePage
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
            pi.AddCondition<HotspotMallDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<HotspotMallDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //Response.Write(pi.ToSqlCondition());
            pi.OrderBy.Add("order_id", OrderByType.Asc);
            var list = BHotspot.GetShopsList(pi);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
                if (!String.IsNullOrEmpty(Id))
                    InitItemList(Id);
                else
                {
                    Id = list[0].hotspot_id;
                    InitItemList(Id);
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
                this.ltrCoverPhoto.Text = "<img src=\"" + Common.NoPhotoDefault(model.coverphoto) + "\">";
                ltrName.Text = model.hotspot_name;
                this.ltrDesc.Text = model.intro;
                var ItemsList = BHotspot.GetShopItemList(Id);
                if (ItemsList != null)
                {
                    this.rptItemsList.DataSource = ItemsList;
                    this.rptItemsList.DataBind();
                }
            }
        }
    }
}