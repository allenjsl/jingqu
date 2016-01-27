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

namespace Adpost.YCH.WAP.WEB
{
    public partial class user_sc : BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                InitList();
            }
        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList()
        {
            CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            var model = LoginCheck();
            pi.AddCondition<MbmycollectDTO>(o => o.memberid, model.id, QueryMethod.Equal);
            pi.AddCondition<MbmycollectDTO>(o => o.collectcategory, 收藏类别.光影记录, QueryMethod.NotEqual);
            pi.OrderBy.Add("collecttime", OrderByType.Desc);
            var list = BMycollect.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        /// <summary>
        /// 绑定收收藏内容
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void InitCollectInfo(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var row = (MbmycollectDTO)e.Item.DataItem;
                Literal ltrCollectInfo = (Literal)e.Item.FindControl("ltrCollectInfo");
                Literal ltrImg = (Literal)e.Item.FindControl("ltrImg");
                string Id = row.collectid;
                switch ((收藏类别)row.collectcategory.Value)
                {
                    case 收藏类别.新闻资讯:
                    case 收藏类别.通知公告:
                        var model = BInfomation.GetModel(Id);
                        if (model != null)
                        {
                            ltrImg.Text = "<img width=\"91\" height=\"66\" src=\"" + ImgSplit(model.imglist) + "\">";
                            ltrCollectInfo.Text = "<h3 class=\"in-it-title\">" + model.title + "</h3><div class=\"in-it-time\">" + (收藏类别)row.collectcategory.Value + "</div><div class=\"in-it-time\">" + model.create_date.ToString("yyyy-MM-dd") + "</div>";
                        }
                        break;
                    case 收藏类别.特色活动:
                        var m1 = BActivities.GetModel(Id);
                        if (m1 != null)
                        {
                            ltrImg.Text = "<img width=\"91\" height=\"66\" src=\"" + Common.NoPhotoDefault(m1.thumb_img) + "\">";
                            ltrCollectInfo.Text = "<h3 class=\"in-it-title\">" + m1.act_name + "</h3><div class=\"in-it-time\">" + (收藏类别)row.collectcategory.Value + "</div><div class=\"in-it-time\">" + m1.create_date.ToString("yyyy-MM-dd") + "</div>";
                        }
                        break;
                    case 收藏类别.线路推荐:
                        var m2 = BTravelline.GetModel(Id);
                        if (m2 != null)
                        {
                            ltrImg.Text = "<img width=\"91\" height=\"66\" src=\"" + Common.NoPhotoDefault(m2.coverphoto) + "\">";
                            ltrCollectInfo.Text = "<h3 class=\"in-it-title\">" + m2.title + "</h3><div class=\"in-it-time\">" + (收藏类别)row.collectcategory.Value + "</div><div class=\"in-it-time\">" + m2.create_date.ToString("yyyy-MM-dd") + "</div>";
                        }
                        break;
                    case 收藏类别.美食推荐:
                        var m3 = BHotspot.GetRestaurantsModel(Id);
                        if (m3 != null)
                        {
                            ltrImg.Text = "<img width=\"91\" height=\"66\" src=\"" + Common.NoPhotoDefault(m3.coverphoto) + "\">";
                            ltrCollectInfo.Text = "<h3 class=\"in-it-title\">" + m3.hotspot_name + "</h3><div class=\"in-it-time\">" + (收藏类别)row.collectcategory.Value + "</div><div class=\"in-it-time\">" + m3.create_date.ToString("yyyy-MM-dd") + "</div>";
                        }
                        break;
                    case 收藏类别.酒店推荐:
                        var m4 = BHotspot.GetHotelModel(Id);
                        if (m4 != null)
                        {
                            ltrImg.Text = "<img width=\"91\" height=\"66\" src=\"" + Common.NoPhotoDefault(m4.coverphoto) + "\">";
                            ltrCollectInfo.Text = "<h3 class=\"in-it-title\">" + m4.hotspot_name + "</h3><div class=\"in-it-time\">" + (收藏类别)row.collectcategory.Value + "</div><div class=\"in-it-time\">" + m4.create_date.ToString("yyyy-MM-dd") + "</div>";
                        }
                        break;
                    case 收藏类别.购物推荐:
                        var m5 = BHotspot.GetShopModel(Id);
                        if (m5 != null)
                        {
                            ltrImg.Text = "<img width=\"91\" height=\"66\" src=\"" + Common.NoPhotoDefault(m5.coverphoto) + "\">";
                            ltrCollectInfo.Text = "<h3 class=\"in-it-title\">" + m5.hotspot_name + "</h3><div class=\"in-it-time\">" + (收藏类别)row.collectcategory.Value + "</div><div class=\"in-it-time\">" + m5.create_date.ToString("yyyy-MM-dd") + "</div>";
                        }
                        break;
                    case 收藏类别.娱乐推荐:
                        var m6 = BHotspot.GetEntertainmentModel(Id);
                        if (m6 != null)
                        {
                            ltrImg.Text = "<img width=\"91\" height=\"66\" src=\"" + Common.NoPhotoDefault(m6.coverphoto) + "\">";
                            ltrCollectInfo.Text = "<h3 class=\"in-it-title\">" + m6.hotspot_name + "</h3><div class=\"in-it-time\">" + (收藏类别)row.collectcategory.Value + "</div><div class=\"in-it-time\">" + m6.create_date.ToString("yyyy-MM-dd") + "</div>";
                        }
                        break;
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
                    return arr[0];
                else
                    return "/Images/img_comingsoon.png";
            }
            else
            {
                return "/Images/img_comingsoon.png";
            }
        }
    }
}