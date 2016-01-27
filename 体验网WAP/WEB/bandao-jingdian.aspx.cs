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
    public partial class bandao_jingdian : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id)) {
                    InitScenicInfo(Id);
                } else {
                    MessageBox.ShowAndReturnBack("未找到您要查看信息!");
                }
            }
        }
        private void InitScenicInfo(string Id)
        {
            var model = BHotspot.GetScenicsModel(Id);
            if (model != null)
            {
                ltrName.Text = model.hotspot_name;
                this.ltrInfo.Text = model.description;
                if (!String.IsNullOrWhiteSpace(model.thumb_img))
                {
                    string[] pl = model.thumb_img.Split('|');
                    if (pl.Length > 0)
                    {
                        this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(pl[0]) + "\" alt=\"\">";
                    }
                }
            }
        }
    }
}