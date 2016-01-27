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
    public partial class travel_hotel_show : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var model = BHotspot.GetHotelModel(Id);
                    if (model != null)
                    {
                        this.Talk.CommentType = 评论类型.住宿;
                        this.Talk.HotspotId = Id;
                        this.TalkList.CommentType = 评论类型.住宿;
                        this.TalkList.HotspotId = Id;
                        this.ltrTalkCount.Text = BComment.Count(Id, 评论类型.住宿);
                        InitRoomInfo(Id);
                        this.ltrName.Text = model.hotspot_name;
                        this.ltrDesc.Text = model.intro;
                        this.ltrTel.Text = model.servicesphone;
                        this.ltrAddress.Text = model.address;
                        this.ltrSpecial.Text = model.insidefacility;
                        if (!String.IsNullOrWhiteSpace(model.thumb_img))
                        {
                            string[] pl = model.thumb_img.Split('|');
                            System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                            foreach (var str in pl)
                            {
                                if (!String.IsNullOrWhiteSpace(str))
                                    tmpStr.Append("<li><a href=\"#\"><img src=\"" + Common.NoPhotoDefault(str) + "\"/></a></li>");
                            }
                            this.ltrImgList.Text = tmpStr.ToString();
                        }
                    }
                    else
                    {
                        MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                        return;
                    }
                }
            }
            else
            {
                MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                return;
            }
        }
        /// <summary>
        /// 子项绑定
        /// </summary>
        /// <param name="Id"></param>
        private void InitRoomInfo(string Id)
        {
            var ItemsList = BHotspot.GetHotelRoomList(Id);
            if (ItemsList != null)
            {
                this.rptItemsList.DataSource = ItemsList;
                this.rptItemsList.DataBind();
            }
        }
        protected string PhotoList(string photoList)
        {
            if (!String.IsNullOrWhiteSpace(photoList))
            {
                string[] pl = photoList.Split('|');
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                foreach (var str in pl)
                {
                    if (!String.IsNullOrWhiteSpace(str))
                        tmpStr.Append("<li><a href=\"#\"><img src=\"" + str + "\"/></a></li>");
                }
                return tmpStr.ToString();
            }
            else { return ""; }
        }
        
    }
}