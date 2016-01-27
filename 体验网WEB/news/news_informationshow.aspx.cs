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
#endregion

namespace Adpost.YCH.WEB.news
{
    public partial class news_informationshow : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var model = BInfomation.GetModel(Id);
                    if (model != null)
                    {
                        this.ltrTitle.Text = model.title;
                        this.ltrSubTitle.Text = model.subtitle;
                        if (model.publish_date.HasValue)
                            this.ltrDate.Text = model.publish_date.Value.ToString("yyyy-MM-dd");
                        this.ltrNewsInfo.Text = model.webdesc;
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