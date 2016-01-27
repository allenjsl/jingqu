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
    public partial class yule_view : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    InitModel(Id);
                }
                else { MessageBox.ShowAndReturnBack("未找到您要查看的美食!"); }
            }
        }
        /// <summary>
        /// 加载产品信息
        /// </summary>
        /// <param name="Id"></param>
        private void InitModel(string Id)
        {
            var model = BHotspot.GetEntertainmentModel(Id);
            if (model != null)
            {
                this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.coverphoto) + "\" alt=\"\">";
                this.ltrName.Text = model.hotspot_name;
                this.ltrInfo.Text = model.actintro;
            }
            else { MessageBox.ShowAndReturnBack("未找到您要查看的美食!"); }

        }
    }
}