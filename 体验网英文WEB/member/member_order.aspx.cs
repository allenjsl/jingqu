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

namespace Adpost.YCH.WEB.member
{
    public partial class member_order : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                InitInfo();
            }
        }
        /// <summary>
        /// 加载信息
        /// </summary>
        private void InitInfo()
        {
            string Id = Utils.GetQueryStringValue("Id");
            if (!String.IsNullOrWhiteSpace(Id)) {
                var model = BOrder.GetViewModel(Id);
            if (model != null) {
                this.ltrCode.Text = model.code;
                this.ltrProductName.Text = model.productname;
                this.ltrDate.Text = model.create_date.ToString("yyyy-MM-dd");
                this.ltrPay.Text = Convert.ToString((支付类型)model.paytype);
                this.ltrStat.Text = Convert.ToString((订单状态)Convert.ToInt32(model.orderstatus));
                this.ltrContact.Text = model.linkman + "/"+ model.customerphone + "/" + model.customeraddress;
                this.ltrRemark.Text = model.remark;
                if (Convert.ToInt32(model.orderstatus) < (int)订单状态.已支付) {
                    this.ltrDel.Text = "<span class=\"member_order_btn1\"><a href=\"Member_Order_Del.aspx?Id=" + model.id + "&Type=" + model.ordertype + "\">删除订单</a></span>";
                    switch (model.ordertype)
                    {
                        case (int)订单类型.酒店订单:
                        case (int)订单类型.景点:
                        case (int)订单类型.购物订单:
                            this.ltrPayBtn.Text = "<span class=\"member_order_btn2\"><a href=\"/AliPay/AliTradeTourOrder.aspx?OrderId=" + model.id + "&OrderType=" + model.ordertype + "&Pay=alipay\" target=\"_blank\">立即支付</a></span>";
                                break;
                    }
                }
            }
            else
            {
                MessageBox.ShowAndReturnBack("未找到您要查看的订单");
                return;
            }
            }
            else
            {
                MessageBox.ShowAndReturnBack("未找到您要查看的订单");
                return;
            }
        }
    }
}