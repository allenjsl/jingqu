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
    public partial class InteralShowDetail : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                SaveToOrder();
            }
        }
        /// <summary>
        /// 保存到订单
        /// </summary>
        private void SaveToOrder()
        {
            string HotsPotId = "";
            string Id = Utils.GetQueryStringValue("Id");
            float ItemPrice = 0;
            string ProductlName = "";
            var UserModel = LoginCheck();
            if (UserModel == null)
            {
                MessageBox.ShowAndRedirect("用户未登陆，请登陆后下单!", "Login.aspx");
                return;
            }
            else
            {
                decimal MemberIntegral = BMemberIntegral.GetMemberInteral(UserModel.id);
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var ItemModel = BHotspot.GetIntegralModel(Id);
                    if (ItemModel != null)
                    {
                        HotsPotId = ItemModel.hotspot_id;
                        ItemPrice = ItemModel.price;
                        ProductlName = ItemModel.good_name;
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
                string linkman = UserModel.nickname;
                string phone = UserModel.phone;
                string remark = "积分商品兑换";
                int num = 1;
                decimal TotalMoney = num * Convert.ToDecimal(ItemPrice);
                if (TotalMoney > MemberIntegral)
                {
                    MessageBox.ShowAndReturnBack("积分不足，不能兑换商品！");
                    return;
                }
                string OrderId = System.Guid.NewGuid().ToString();
                DsorderDTO model = new DsorderDTO();
                model.id = OrderId;
                model.code = DateTime.Now.ToString("yyyyMMddHHmmss");
                model.orderstatus = Convert.ToString((int)订单状态.已支付);
                model.member_id = UserModel.id;
                model.member_name = UserModel.user_name;
                model.linkman = linkman;
                model.customerphone = phone;
                model.totalamount = (float)TotalMoney;
                model.paytype = (int)支付类型.会员积分;
                model.ordertype = (int)订单类型.积分兑换;
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
                    //添加积分流水
                    //写会员积分
                    MbmemberintegralchangeDTO IntegralModel = new MbmemberintegralchangeDTO
                    {
                        id = System.Guid.NewGuid().ToString(),
                        billtype = Convert.ToInt32(model.ordertype),
                        objid = OrderId,
                        memberid = UserModel.id,
                        outnum = (float)TotalMoney,
                        absract = "积分兑换，订单编号：" + model.code,
                        year_num = DateTime.Now.Year,
                        create_date = DateTime.Now,
                        currentdate = DateTime.Now
                    };
                    BMemberIntegral.Add(IntegralModel);
                    MessageBox.ShowAndRedirect("兑换成功!", "jfList.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("兑换失败!");
                    return;
                }
            }
        }
    }
}