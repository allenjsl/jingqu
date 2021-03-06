﻿#region 命名空间
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
    public partial class tehui_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");

                var model = BCoupon.GetModel(Id);
                if (model != null)
                {
                    this.ltrTitle.Text = model.title;
                    this.ltrImg.Text = "<img src=\"" + model.photo + "\">";
                    this.ltrWebDesc.Text = model.webdesc;
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