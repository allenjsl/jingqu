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
using ZFramework.Pager;
#endregion

namespace Adpost.YCH.WEB.WebControls
{
    public partial class BlogsTalk : System.Web.UI.UserControl
    {
        /// <summary>
        /// 评论类型
        /// </summary>
        public 评论类型 CommentType { get; set; }
        /// <summary>
        /// 被评论编号
        /// </summary>
        public string HotspotId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MbmemberDTO model = new BasePage().LoginCheck();
                if (model != null)
                {
                    this.phLogin.Visible = false;
                    this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.head) + "\" width=\"70\" height=\"68\">";
                    this.ltrUserName.Text = model.nickname + "<br/>" + DateTime.Now.ToString("yyyy-MM-dd");
                }
                else
                {
                    this.phLogin.Visible = true;
                    this.ltrImg.Text = "<img src=\"../images/travel_raiders_tx_img1.jpg\">";
                    this.ltrUserName.Text = "游客<br/>" + DateTime.Now.ToString("yyyy-MM-dd");
                }
            }
        }
    }
}