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
    public partial class travel_hotel_order : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var UserModel = LoginCheck();
                if (UserModel == null)
                {
                    MessageBox.ShowAndRedirect("用户未登陆，请登陆后下单!", "/Login.aspx");
                    return;
                }
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var model = BOrder.GetModel(Id);
                    if (model != null)
                    {
                        var ItemList = BOrder.GetList(Id);
                        DsorderdetailDTO ItemModel = null;
                        if (ItemList.Count() > 0)
                            ItemModel = ItemList[0];
                        this.ltrD1.Text = ItemModel.ctime.Value.ToString("yyyy-MM-dd");
                        this.ltrD2.Text = ItemModel.dtime.Value.ToString("yyyy-MM-dd");
                        this.ltrNum.Text = (ItemModel.num + ItemModel.childrennum).ToString();
                        this.ltrChild.Text = ItemModel.childrennum.ToString();
                        var RoomModel = BHotspot.GetRoomModel(ItemModel.roomtype);
                        if (RoomModel != null)
                        {
                            this.ltrRoomType.Text = RoomModel.name;
                        }
                        else
                        {
                            MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                            return;
                        }
                        this.ltrNickName.Text = model.linkman;
                        this.ltrPhone.Text = "<input type=\"text\" value=\"" + model.customerphone + "\" class=\"list_order_input1\" id=\"order_tel\" name=\"phone\">";
                        this.ltrAddress.Text = "<input type=\"text\" class=\"list_order_input3\" value=\"" + model.customeraddress + "\" id=\"order_address\" name=\"address\">";
                        this.ltrRemark.Text = "<textarea class=\"list_order_are1\" id=\"order_bz\" name=\"remark\">"+ model.remark +"</textarea>";
                        this.ltrAmount.Text = ItemModel.amount.ToString();
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
        /// 保存更新订单信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void linkBtnSave_Click(object sender, EventArgs e)
        {
            SaveOrder(false);
        }

        protected void linkBtnPay_Click(object sender, EventArgs e)
        {
            SaveOrder(true);
        }
        private void SaveOrder(bool IsPay) {
            string Id = Utils.GetQueryStringValue("Id");
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
                    var model = BOrder.GetModel(Id);
                    if (model != null)
                    {
                        string phone = Utils.GetFormValue("phone");
                        string address = Utils.GetFormValue("address");
                        string remark = Utils.GetFormValue("remark");

                        model.id = Id;
                        model.orderstatus = "1";
                        model.customerphone = phone;
                        model.customeraddress = address;
                        model.paytype = 0;
                        model.remark = remark;
                        var result = BOrder.Update(model);
                        if (result)
                        {
                            if (IsPay)
                            {
                                MessageBox.ResponseScript("window.open(\"/AliPay/AliTradeTourOrder.aspx?OrderId=" + Id + "&OrderType=" + model.ordertype + "&Pay=alipay\")");
                                MessageBox.ShowAndRedirect("预定成功!", "travel_hotel.aspx");
                                return;
                            }
                            else
                            {
                                MessageBox.ShowAndRedirect("预定成功!", "travel_hotel.aspx");
                                return;
                            }
                        }
                        else
                        {
                            MessageBox.ShowAndReturnBack("订单添加失败!");
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
            }
        }
    }
}