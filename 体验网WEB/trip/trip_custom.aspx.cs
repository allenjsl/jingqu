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

namespace Adpost.YCH.WEB.trip
{
    /// <summary>
    /// 行程定制
    /// </summary>
    public partial class trip_custom : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string doType = Utils.GetQueryStringValue("doType");
            if (doType == "IsCheck") { CheckLogin(); return; }
            if (doType == "save") { SaveTrip(); return; }
            if (!IsPostBack)
            {
                    //var UserModel = LoginCheck();                
                    InitScenicList();
                    InitFoodList();
                    InitHotelList();
            }
        }
        private void CheckLogin()
        {
            var LoginModel = LoginCheck();
            if (LoginModel == null)
            {
                Utils.RCWE(UtilsCommons.AjaxReturnJson("0", "/Login.aspx?Url=" + Server.UrlEncode("/trip/trip_custom.aspx")));
            }
            else
            {
                Utils.RCWE(UtilsCommons.AjaxReturnJson("1", "已登陆"));
            }
        }
        #region 景点
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitScenicList()
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<HotspotScenicsDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<HotspotScenicsDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //Response.Write(pi.ToSqlCondition());
            var list = BHotspot.GetScenicsList(pi);
            if (list != null)
            {
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                tmpStr.Append("<li>");
                for (int i = 0; i < list.Count(); i++)
                {
                    if ((i + 1) % 2 == 0)
                    {
                        tmpStr.Append("<div class=\"list_div right\"><img class=\"list_img\" src=\"" + Common.NoPhotoDefault(list[i].coverphoto) + "\"><h1>" + list[i].hotspot_name + "</h1><p>" + list[i].tourtime + "</p><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\" class=\"jingdianAdd\">&nbsp;</a></div>");
                    }
                    else
                    {
                        tmpStr.Append("<div class=\"list_div left\"><img class=\"list_img\" src=\"" + Common.NoPhotoDefault(list[i].coverphoto) + "\"><h1>" + list[i].hotspot_name + "</h1><p>" + list[i].tourtime + "</p><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\" class=\"jingdianAdd\">&nbsp;</a></div>");
                    }
                    
                    if ((i+1) % 2 == 0) { tmpStr.Append("</li><li>"); }
                }
                tmpStr.Append("</li>");
                this.ltrJD.Text = tmpStr.ToString();
            }
        }
        /// <summary>
        /// 景点图片
        /// </summary>
        /// <param name="thumb_img"></param>
        /// <returns></returns>
        private string ScenicPhoto(string thumb_img)
        {
            if (!String.IsNullOrWhiteSpace(thumb_img))
            {
                string[] pl = thumb_img.Split('|');
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                foreach (var str in pl)
                {
                    if (!String.IsNullOrWhiteSpace(str))
                        tmpStr.Append(str);
                }
                return tmpStr.ToString();
            }
            else { return ""; }
        }
        #endregion
        #region 美食
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitFoodList()
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<HotspotRestaurantDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<HotspotRestaurantDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            var list = BHotspot.GetRestaurantsList(pi);
            if (list != null)
            {
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                tmpStr.Append("<li>");
                for (int i = 0; i < list.Count(); i++)
                {
                    if ((i + 1) % 2 == 0)
                    {
                        tmpStr.Append("<div class=\"list_div right\"><img class=\"list_img\" src=\"" + Common.NoPhotoDefault(list[i].coverphoto) + "\"><h1>" + list[i].hotspot_name + "</h1><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\" class=\"foodAdd\">&nbsp;</a></div>");
                    }
                    else
                    {
                        tmpStr.Append("<div class=\"list_div left\"><img class=\"list_img\" src=\"" + Common.NoPhotoDefault(list[i].coverphoto) + "\"><h1>" + list[i].hotspot_name + "</h1><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\" class=\"foodAdd\">&nbsp;</a></div>");
                    }

                    if ((i + 1) % 2 == 0) { tmpStr.Append("</li><li>"); }
                }
                tmpStr.Append("</li>");
                this.ltrFood.Text = tmpStr.ToString();
            }
        }
        #endregion
        #region 酒店
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitHotelList()
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<HotspotHotelDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<HotspotHotelDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            var list = BHotspot.GetHotelsList(pi);
            if (list != null)
            {
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                tmpStr.Append("<li>");
                for (int i = 0; i < list.Count(); i++)
                {
                    if ((i + 1) % 2 == 0)
                    {
                        tmpStr.Append("<div class=\"list_div right\"><img class=\"list_img\" src=\"" + Common.PhotoSplit(list[i].coverphoto,0) + "\"><h1>" + list[i].hotspot_name + "</h1><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\" class=\"hotelAdd\">&nbsp;</a></div>");
                    }
                    else
                    {
                        tmpStr.Append("<div class=\"list_div left\"><img class=\"list_img\" src=\"" + Common.PhotoSplit(list[i].coverphoto, 0) + "\"><h1>" + list[i].hotspot_name + "</h1><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\" class=\"hotelAdd\">&nbsp;</a></div>");
                    }

                    if ((i + 1) % 2 == 0) { tmpStr.Append("</li><li>"); }
                }
                tmpStr.Append("</li>");
                this.ltrHotel.Text = tmpStr.ToString();
            }
        }
        #endregion
        /// <summary>
        /// 保存行程规划
        /// </summary>
        private void SaveTrip() {
            var UserModel = LoginCheck();
            if (UserModel == null)
            {
                MessageBox.ShowAndRedirect("用户未登陆，请先登陆!", "/Login.aspx");
                return;
            }
            else
            {
                string TourName = Utils.GetFormValue("tourname");
                DateTime TourDate = Utils.GetDateTime(Utils.GetFormValue("tourdate"));
                string TourRemark = Utils.GetFormValue("lineremark");
                string[] days = Utils.GetFormValues("days");
                string[] hotspotId = Utils.GetFormValues("hotspotId");
                string[] remark = Utils.GetFormValues("remark");
                if (days.Length > 0)
                {
                    string Id = System.Guid.NewGuid().ToString();
                    string MId = Id;
                    for (int i = 0; i < days.Length; i++)
                    {
                        if (i > 0)
                            Id = System.Guid.NewGuid().ToString();
                        BMyTravelline.Add(new TywmytravellineDTO
                        {
                            id = Id,
                            member_id = UserModel.id,
                            title = TourName,
                            linedesc = TourRemark,
                            days = Utils.GetInt(days[i]),
                            hotspot_id = hotspotId[i],
                            Tags = remark[i],
                            begindate = TourDate,
                            ordernum = i,
                            uid = MId,
                            publishtarget = Target,
                            is_valid = 1,
                            is_delete = 0,
                            create_date = DateTime.Now,
                            create_userid = UserModel.id
                        });
                    }
                    Utils.RCWE(UtilsCommons.AjaxReturnJson("1", "行程订制成功", "trip_custom_map.aspx?Id=" + MId));
                    return;
                }
                else
                {
                    Utils.RCWE(UtilsCommons.AjaxReturnJson("0", "请至少选择一项行程"));
                    return;
                }
            }
        }
    }
}