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
    public partial class xingcheng_list : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var UserModel = LoginCheck();
                if (UserModel == null)
                {
                    MessageBox.ShowAndRedirect("用户未登陆，请登陆后再进行行程定制!", "Login.aspx?Url="+Request.Url);
                    return;
                }
                else
                {
                    InitScenicList();
                    InitFoodList();
                    InitHotelList();
                }
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
            pi.OrderBy.Add("order_id", OrderByType.Asc);
            var list = BHotspot.GetScenicsList(pi);
            if (list != null)
            {
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                
                for (int i = 0; i < list.Count(); i++)
                {
                    tmpStr.Append("<li>");
                    tmpStr.Append("<img src=\"" + Common.NoPhotoDefault(list[i].coverphoto) + "\"><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\"  class=\"jingdianAdd\">&nbsp;</a><h1>" + list[i].hotspot_name + "</h1>");
                    tmpStr.Append("</li>");
                }
                
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
            pi.OrderBy.Add("order_id", OrderByType.Asc);
            var list = BHotspot.GetRestaurantsList(pi);
            if (list != null)
            {
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                
                for (int i = 0; i < list.Count(); i++)
                {
                    tmpStr.Append("<li>");
                    tmpStr.Append("<img src=\"" + Common.NoPhotoDefault(list[i].coverphoto) + "\"><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\"  class=\"foodAdd\">&nbsp;</a><h1>" + list[i].hotspot_name + "</h1>"); tmpStr.Append("</li>");
                }
               
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
            pi.OrderBy.Add("order_id", OrderByType.Asc);
            var list = BHotspot.GetHotelsList(pi);
            if (list != null)
            {
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
               
                for (int i = 0; i < list.Count(); i++)
                {
                    tmpStr.Append("<li>");
                    tmpStr.Append("<img src=\"" + Common.NoPhotoDefault(list[i].coverphoto) + "\"><a href=\"javascript:void(0)\" ID=\"" + list[i].id + "\" EID=\"" + list[i].hotspot_id + "\"  class=\"hotelAdd\">&nbsp;</a><h1>" + list[i].hotspot_name + "</h1>"); tmpStr.Append("</li>");
                }
                
                this.ltrHotel.Text = tmpStr.ToString();
            }
        }
        #endregion
        /// <summary>
        /// 保存行程规划
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
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
                    MessageBox.ShowAndRedirect("行程订制成功!", "xingcheng-list.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("请至少选择一项行程"); return;
                }
            }
        }
    }
}