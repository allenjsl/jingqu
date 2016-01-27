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
    public partial class travel_entertainment_show : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var model = BHotspot.GetEntertainmentModel(Id);
                    if (model != null)
                    {
                        this.Talk.CommentType = 评论类型.娱乐;
                        this.Talk.HotspotId = Id;
                        this.TalkList.CommentType = 评论类型.娱乐;
                        this.TalkList.HotspotId = Id;
                        this.ltrTalkCount.Text = BComment.Count(Id, 评论类型.娱乐);
                        InitRoomInfo(Id);
                        this.ltrName.Text = model.hotspot_name;
                        this.ltrDesc.Text = model.actintro;
                        this.ltrTel.Text = model.servicesphone;
                        this.ltrAddress.Text = model.address;
                        this.ltrSpecial.Text = model.oneintro;
                        if (!String.IsNullOrWhiteSpace(model.thumb_img))
                        {
                            string[] pl = model.thumb_img.Split('|');
                            System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                            foreach (var str in pl)
                            {
                                if (!String.IsNullOrWhiteSpace(str))
                                    tmpStr.Append("<li><a href=\"#\"><img src=\"" + str + "\"/></a></li>");
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
            var ItemsList = BHotspot.GetEntertainmentItemList(Id);
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
                        tmpStr.Append("<li><a href=\"#\"><img src=\"" + Common.NoPhotoDefault(str) + "\"/></a></li>");
                }
                return tmpStr.ToString();
            }
            else { return ""; }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Id = Utils.GetFormValue("hidId");
            string ProductName = "";
            var Pmodel = BHotspot.GetEntertainmentModel(Id);
            if (Pmodel != null)
            {
                ProductName = Pmodel.hotspot_name;
            }
            string UserName = "";
            string MemberId = "";
            int num = Utils.GetInt(Utils.GetFormValue("num"));
            string name = Utils.GetFormValue("bookName");
            string time = Utils.GetFormValue("time");
            string remark = Utils.GetFormValue("remark");
            string contact = Utils.GetFormValue("contact");
            var UserModel = LoginCheck();
            if (UserModel != null) { MemberId = UserModel.id; UserName = UserModel.user_name; }
            float TotalMoney = 0;
            string OrderId = System.Guid.NewGuid().ToString();
            DsorderDTO model = new DsorderDTO();
            model.id = OrderId;
            model.code = DateTime.Now.ToString("yyyyMMddHHmmss");
            model.orderstatus = "1";
            model.member_id = MemberId;
            model.member_name = UserName;
            model.linkman = name;
            model.customerphone = contact;
            model.plandate = time;
            model.totalamount = TotalMoney;
            model.paytype = 0;
            model.ordertype = (int)订单类型.娱乐;
            model.totalquantity = num;
            //model.orderdate = time;
            model.datasource = Target;
            model.remark = remark;
            model.publishtarget = Target;
            model.is_valid = 1;
            model.create_date = DateTime.Now;
            List<DsorderdetailDTO> orderlist = new List<DsorderdetailDTO>();
            orderlist.Add(new DsorderdetailDTO
            {
                id = System.Guid.NewGuid().ToString(),
                ds_order_id = OrderId,
                productid = Id,
                productname = ProductName,
                price = 0,
                realprice = 0,
                num = num,
                childrennum = 0,
                amount = TotalMoney,
                realamount = TotalMoney,
                roomtype = ""
            });
            model.Items = orderlist;
            var result = BOrder.AddOrder(model);
            /*
            var result = BBooking.Add(new TywbookingDTO
            {
                id = System.Guid.NewGuid().ToString(),
                person_num = num,
                booking_date = DateTime.Now,
                remark = remark,
                booking_userid = MemberId,
                booking_username = UserName,
                bookingusercontacts = contact,
                objtype = (int)预约类型.娱乐,
                obj_id = Id,
                datasource = Target
            });
            */
            if (result)
            {
                MessageBox.ShowAndRedirect("预定成功!", "travel_entertainment.aspx");
                return;
            }
            else
            {
                MessageBox.ShowAndReturnBack("预定失败!");
                return;
            }
        }
    }
}