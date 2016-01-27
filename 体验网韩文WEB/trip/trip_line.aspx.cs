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

namespace Adpost.YCH.WEB.trip
{
    public partial class trip_line1 : BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            pi.AddCondition<CptravellineDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<CptravellineDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<CptravellineDTO>(o => o.title, Keyword, QueryMethod.Like);
            }
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BTravelline.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
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