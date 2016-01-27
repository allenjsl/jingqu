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

namespace Adpost.YCH.WEB.about
{
    /// <summary>
    /// 景点
    /// </summary>
    public partial class about_scenic : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                InitList(Id);
            }
        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList(string Id)
        {
            int CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = 10;
            pi.AddCondition<HotspotScenicsDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<HotspotScenicsDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //Response.Write(pi.ToSqlCondition());
            pi.OrderBy.Add("order_id", OrderByType.Asc);
            var list = BHotspot.GetScenicsList(pi);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
                if (!String.IsNullOrEmpty(Id))
                    InitScenicInfo(Id);
                else
                    InitScenicInfo(list[0].hotspot_id);
            }
        }
        private void InitScenicInfo(string Id) {
            var model = BHotspot.GetScenicsModel(Id);
            if (model != null) {
                ltrScenicName.Text = model.hotspot_name;
                this.ltrDesc.Text = model.description;
                if (!String.IsNullOrWhiteSpace(model.thumb_img))
                {
                    string[] pl = model.thumb_img.Split('|');
                    System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                    foreach (var str in pl)
                    {
                        if(!String.IsNullOrWhiteSpace(str))
                            tmpStr.Append("<li><a href=\"#\"><img src=\"" + str + "\"/></a></li>");
                    }
                    this.ltrScenicPhotoList.Text = tmpStr.ToString();
                }
            }
        }
    }
}