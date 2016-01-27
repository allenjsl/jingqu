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
#endregion

namespace Adpost.YCH.WEB.trip
{
    public partial class trip_line_show : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var model = BTravelline.GetModel(Id);
                    if (model != null)
                    {

                        if (!String.IsNullOrWhiteSpace(model.photolist))
                        {
                            this.ltrTitle.Text = model.title;
                            this.ltrIntro.Text = model.introduction;
                            this.ltradultprice.Text = model.adultprice.ToString();
                            this.ltrchildprice.Text = model.childprice.ToString();
                            this.ltrdiscount.Text = model.discount.ToString();
                            this.ltrcontent.Text = model.content;
                            this.ltraggregateinfo.Text = model.aggregateinfo;
                            this.ltrgroupdate.Text = model.groupdate.HasValue?model.groupdate.Value.ToString("yyyy年MM月dd日"):"";
                            this.ltrtravelnotes.Text = model.travelnotes;
                            this.ltrbuynotes.Text = model.buynotes;
                            this.ltrflownotes.Text = model.flownotes;
                            string[] pl = model.photolist.Split('|');
                            System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                            foreach (var str in pl)
                            {
                                if (!String.IsNullOrWhiteSpace(str))
                                    tmpStr.Append("<p><img src=\"" + Common.NoPhotoDefault(str) + "\"/></p>");
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

        protected void linkBtnPay_Click(object sender, EventArgs e)
        {
            SaveOrder(true);
        }

        protected void linkBtnSave_Click(object sender, EventArgs e)
        {
            SaveOrder(false);
        }
        /// <summary>
        /// 保存订单
        /// </summary>
        private void SaveOrder(bool IsPay)
        {
            float PPrice = 0, CPrice = 0;
            string Id = Utils.GetFormValue("hidId");
            string ProductName = "";
            var Pmodel = BTravelline.GetModel(Id);
            if (Pmodel != null)
            {
                ProductName = Pmodel.title;
                PPrice = Pmodel.adultprice;
                CPrice = Pmodel.childprice;
            }
            else
            {
                MessageBox.ShowAndReturnBack("未找到您要预定的线路");
                return;
            }
            string UserName = "";
            string MemberId = "";
            int pnum = Utils.GetInt(Utils.GetFormValue("num"));
            int cnum = Utils.GetInt(Utils.GetFormValue("num2"));
            string name = Utils.GetFormValue("bookName");
            string time = Utils.GetFormValue("time");
            string remark = Utils.GetFormValue("remark");
            string contact = Utils.GetFormValue("contact");
            var UserModel = LoginCheck();
            if (UserModel != null) { MemberId = UserModel.id; UserName = UserModel.user_name; }
            float TotalMoney = pnum * PPrice + cnum * CPrice;
            string OrderId = System.Guid.NewGuid().ToString();
            DsorderDTO model = new DsorderDTO();
            model.id = OrderId;
            model.code = DateTime.Now.ToString("yyyyMMddHHmmss");
            model.orderstatus = "1";
            model.member_id = MemberId;
            model.member_name = UserName;
            model.linkman = name;
            model.customerphone = contact;
            model.totalamount = TotalMoney;
            model.paytype = 0;
            model.ordertype = (int)订单类型.线路;
            model.totalquantity = pnum + cnum;
            model.plandate = time;
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
                num = pnum,
                childrennum = cnum,
                amount = TotalMoney,
                realamount = TotalMoney,
                roomtype = Id
            });
            model.Items = orderlist;
            var result = BOrder.AddOrder(model);
            if (result)
            {
                if (IsPay)
                {
                    MessageBox.ResponseScript("window.open(\"/AliPay/AliTradeTourOrder.aspx?OrderId=" + Id + "&OrderType=" + model.ordertype + "&Pay=alipay\")");
                    MessageBox.ShowAndRedirect("预定成功!", "trip_line.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndRedirect("预定成功!", "trip_line.aspx");
                    return;
                }
            }
            else
            {
                MessageBox.ShowAndReturnBack("预定失败!");
                return;
            }

        }
    }
}