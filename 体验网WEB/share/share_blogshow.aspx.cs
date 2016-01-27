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

namespace Adpost.YCH.WEB.share
{
    public partial class share_blogshow : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitInfo();
            }
        }
        /// <summary>
        /// 加载活动信息
        /// </summary>
        private void InitInfo()
        {
            string Id = Utils.GetQueryStringValue("Id");
            if (!String.IsNullOrWhiteSpace(Id))
            {
                var model = BBlog.GetModel(Id);
                if (model != null)
                {
                    this.Talk.CommentType = 评论类型.游记;
                    this.Talk.HotspotId = Id;
                    this.TalkList.CommentType = 评论类型.游记;
                    this.TalkList.HotspotId = Id;
                    this.ltrTalkCount.Text = BComment.Count(Id, 评论类型.游记);
                    if (!String.IsNullOrWhiteSpace(model.coverphoto))
                        this.ltrImg.Text = "<img src=\"" + model.coverphoto + "\">";
                    this.ltrTitle.Text = model.title;
                    this.ltrCreateUser.Text = model.create_userid;
                    this.ltrDate.Text = model.create_date.ToString("yyyy-MM-dd");
                    this.ltrContent.Text = model.content;
                    var NextModel = BBlog.GetNextModel(Target, model.create_date);
                    if (NextModel != null) { this.ltrNext.Text = "<p><a href=\"share_blogshow.aspx?Id=" + NextModel.id + "\">下一则：" + NextModel.title + "</a></p>"; } else { this.ltrNext.Text = "<p><a href=\"#\">下一则：暂无</a></p>"; }
                    var PreModel = BBlog.GetPreModel(Target, model.create_date);
                    if (PreModel != null) { this.ltrPre.Text = "<p><a href=\"share_blogshow.aspx?Id=" + PreModel.id + "\">上一则：" + PreModel.title + "</a></p>"; } else { this.ltrNext.Text = "<p><a href=\"#\">上一则：暂无</a></p>"; }
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