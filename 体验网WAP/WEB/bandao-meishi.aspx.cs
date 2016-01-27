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
    public partial class bandao_meishi : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                 var model = BHotspot.GetRestaurantsModel(Id);
                 if (model != null)
                 {
                     this.ltrName.Text = model.hotspot_name;
                     this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.coverphoto) + "\"/>";
                     this.ltrFoodInfo.Text = model.oneintro;
                     this.ltrTel.Text = model.servicesphone;
                     this.ltrAddress.Text = model.address;
                     this.ltrSpecial.Text = model.specialfood;
                     InitRestaurantsInfo(Id);
                 }
                 else
                 {
                     MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                     return;
                 }
            }
        }
        private void InitRestaurantsInfo(string Id)
        {
            var model = BHotspot.GetRestaurantsModel(Id);
            if (model != null)
            {
                var FoodsList = BHotspot.GetFoodsList(Id);
                if (FoodsList != null)
                {
                    this.rptList.DataSource = FoodsList;
                    this.rptList.DataBind();
                }
            }
        }
    }
}