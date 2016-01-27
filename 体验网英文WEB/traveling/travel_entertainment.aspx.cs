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
    public partial class travel_entertainment : BasePage
    {
        protected string Id = "";
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
            Id = Utils.GetQueryStringValue("Id");
            int CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = 4;
            pi.AddCondition<HotspotAmusementDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<HotspotAmusementDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //Response.Write(pi.ToSqlCondition());
            pi.OrderBy.Add("order_id", OrderByType.Asc);
            var list = BHotspot.GetEntertainmentsList(pi);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
                if (!String.IsNullOrEmpty(Id))
                    InitItemInfo(Id);
                else
                {
                    Id = list[0].hotspot_id;
                    InitItemInfo(Id);
                }                    
            }
        }
        private void InitItemInfo(string Id)
        {
            var model = BHotspot.GetEntertainmentModel(Id);
            if (model != null)
            {
                this.ltrCoverPhoto.Text = "<img src=\"" + Common.NoPhotoDefault(model.coverphoto) + "\">";
                ltrName.Text = model.hotspot_name;
                this.ltrDesc.Text = model.oneintro;
                var FoodsList = BHotspot.GetEntertainmentItemList(Id);
                if (FoodsList != null)
                {
                    this.rptFoodsList.DataSource = FoodsList;
                    this.rptFoodsList.DataBind();
                }
            }
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
             * */
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