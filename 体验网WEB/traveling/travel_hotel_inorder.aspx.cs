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
    public partial class travel_hotel_inorder : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var UserModel = LoginCheck();
                if (UserModel == null) {
                    MessageBox.ShowAndRedirect("用户未登陆，请登陆后下单!", "/Login.aspx");
                    return;
                }
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var model = BHotspot.GetRoomModel(Id);
                    if (model != null)
                    {
                        this.ltrRoomName.Text = model.name;
                        this.ltrPrice.Text = model.price.ToString();
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
        /// 提交订单
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string HotsPotId = Utils.GetQueryStringValue("Hid");
            string Id = Utils.GetQueryStringValue("Id");
            float RoomPrice = 0;
            string HotelName = "";
            var UserModel = LoginCheck();
            if (UserModel == null)
            {
                MessageBox.ShowAndRedirect("用户未登陆，请登陆后下单!", "/Login.aspx");
                return;
            }
            else
            {
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var RoomModel = BHotspot.GetRoomModel(Id);
                    if (RoomModel != null)
                    {
                        HotsPotId = RoomModel.hotspot_id;
                        RoomPrice = RoomModel.price;
                        var HotelModel = BHotspot.GetHotelModel(HotsPotId);
                        if (HotelModel != null) { HotelName = HotelModel.hotspot_name; }
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
                else
                {
                    MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                    return;
                }
                DateTime d1 = Utils.GetDateTime(Utils.GetFormValue("dpd1"));
                DateTime d2 = Utils.GetDateTime(Utils.GetFormValue("dpd2"));
                int CheckInDays = Utils.GetInt(Utils.GetFormValue("dpd3"));
                string linkman = Utils.GetFormValue("linkman");
                string phone = Utils.GetFormValue("phone");
                string address = Utils.GetFormValue("address");
                string remark = Utils.GetFormValue("remark");
                int peo1 = Utils.GetInt(Utils.GetFormValue("peo1"));
                int peo2 = Utils.GetInt(Utils.GetFormValue("peo2"));
                if (String.IsNullOrEmpty(phone))
                {
                    MessageBox.ShowAndReturnBack("请填写手机号码!");
                    return;
                }
                decimal TotalMoney = peo1 * Convert.ToDecimal(RoomPrice) * CheckInDays;
                string OrderId = System.Guid.NewGuid().ToString();
                DsorderDTO model = new DsorderDTO();
                model.id = OrderId;
                model.code = DateTime.Now.ToString("yyyyMMddHHmmss");
                model.orderstatus = "0";
                model.member_id = UserModel.id;
                model.member_name = UserModel.user_name;
                model.linkman = linkman;
                model.customerphone = phone;
                model.customeraddress = address;
                model.totalamount = (float)TotalMoney;
                model.paytype = 0;
                model.ordertype = (int)订单类型.酒店订单;
                model.orderdate = DateTime.Now;
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
                    productid = HotsPotId,
                    productname = HotelName,
                    price = RoomPrice,
                    realprice = RoomPrice,
                    num = peo1,
                    childrennum = peo2,
                    amount = (float)TotalMoney,
                    realamount = (float)TotalMoney,
                    roomtype = Id,
                    ctime = d1,
                    dtime = d2
                });
                model.Items = orderlist;
                var result = BOrder.AddOrder(model);
                if (result)
                {
                    //MessageBox.ShowAndRedirect("预定成功!", "travel_hotel_order.aspx?Id=" + OrderId);
                    Response.Redirect("travel_hotel_order.aspx?Id=" + OrderId, true);
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("订单添加失败!");
                    return;
                }
            }
        }
    }
}