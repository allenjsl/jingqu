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

namespace Adpost.YCH.WAP.WEB
{
    public partial class zixun_view : System.Web.UI.Page
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
                        this.ltrImg.Text = ImgSplit(model.imglist);
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
        /// <summary>
        /// 返回图片
        /// </summary>
        /// <param name="imgagelist"></param>
        /// <returns></returns>
        protected string ImgSplit(string imgagelist)
        {
            if (!String.IsNullOrWhiteSpace(imgagelist))
            {
                var arr = imgagelist.Split('|');
                if (arr.Length > 0)
                    return "<img src=\"" + arr[0] + "\">";
                else
                    return "<img src=\"/Images/img_comingsoon.png\">";
            }
            else
            {
                return "<img src=\"/Images/img_comingsoon.png\">";
            }
        }
    }
}