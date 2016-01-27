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
    public partial class travel_shopping_order :BasePage
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
                    var model = BHotspot.GetShopItemModel(Id);
                    if (model != null)
                    {
                        this.ltrImgList.Text = "<img src=\"" + Common.NoPhotoDefault(model.webphoto) + "\">";
                        this.ltrProductName.Text = model.good_name;
                        this.ltrPrice.Text = model.price.ToString("F0");
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
        /// 下订单
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveOrder(false);
        }
        protected void linkBtnPay_Click(object sender, EventArgs e)
        {
            SaveOrder(true);
        }
        private void SaveOrder(bool IsPay)
        {
            string HotsPotId = "";
            string Id = Utils.GetQueryStringValue("Id");
            float ItemPrice = 0;
            string ProductlName = "";
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
                    var ItemModel = BHotspot.GetShopItemModel(Id);
                    if (ItemModel != null)
                    {
                        HotsPotId = ItemModel.hotspot_id;
                        ItemPrice = ItemModel.price;
                        var ProductModel = BHotspot.GetShopModel(HotsPotId);
                        if (ProductModel != null) { ProductlName = ProductModel.hotspot_name; }
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
                string linkman = Utils.GetFormValue("linkman");
                string phone = Utils.GetFormValue("phone");
                string remark = Utils.GetFormValue("remark");
                int num = Utils.GetInt(Utils.GetFormValue("num"));
                if (String.IsNullOrEmpty(phone))
                {
                    MessageBox.ShowAndReturnBack("请填写手机号码!");
                    return;
                }
                decimal TotalMoney = num * Convert.ToDecimal(ItemPrice);
                string OrderId = System.Guid.NewGuid().ToString();
                DsorderDTO model = new DsorderDTO();
                model.id = OrderId;
                model.code = DateTime.Now.ToString("yyyyMMddHHmmss");
                model.orderstatus = "1";
                model.member_id = UserModel.id;
                model.member_name = UserModel.user_name;
                model.linkman = linkman;
                model.customerphone = phone;
                model.totalamount = (float)TotalMoney;
                model.paytype = 0;
                model.ordertype = (int)订单类型.购物订单;
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
                    productname = ProductlName,
                    price = ItemPrice,
                    realprice = ItemPrice,
                    num = num,
                    childrennum = 0,
                    amount = (float)TotalMoney,
                    realamount = (float)TotalMoney,
                    roomtype = Id
                });
                model.Items = orderlist;
                var result = BOrder.AddOrder(model);
                if (result)
                {
                    if (IsPay)
                    {
                        MessageBox.ResponseScript("window.open(\"/AliPay/AliTradeTourOrder.aspx?OrderId=" + Id + "&OrderType=" + model.ordertype + "&Pay=alipay\")");
                        MessageBox.ShowAndRedirect("预定成功!", "travel_shopping.aspx");
                        return;
                    }
                    else
                    {
                        MessageBox.ShowAndRedirect("预定成功!", "travel_shopping.aspx");
                        return;
                    }
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