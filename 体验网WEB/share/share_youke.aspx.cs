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

namespace Adpost.YCH.WEB.share
{
    public partial class share_youke : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitTourCenter();
                InitScencis(); 
                InitList();
            }
        }
        private void InitTourCenter()
        {
            var model = BTourCenter.GetTourCenterInfo(Target);
            if (model != null)
            {
                this.ltrTitle.Text = model.title;
                this.ltrInfo.Text = model.centerdesc;
            }
        }
        private void InitScencis()
        {
            var list = BHotspot.GetTollScenics(Target);
            if (list != null)
            {
                this.rptScenics.DataSource = list;
                this.rptScenics.DataBind();
            }

        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList()
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<TywinformationDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywinformationDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //Response.Write(pi.ToSqlCondition());
            var list = BCicerone.GetList(pi);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int TypeId = Utils.GetInt(Utils.GetFormValue("hidType"));
            string Id = Utils.GetFormValue("hidId");
            string ProductName = "";
            if (TypeId == (int)订单类型.导游)
            {
                var Pmodel = BCicerone.GetModel(Id);
                if (Pmodel != null)
                {
                    ProductName = Pmodel.name;
                }
            }
            else
            {
                var Pmodel = BHotspot.GetScenicsModel(Id);
                if (Pmodel != null)
                {
                    ProductName = Pmodel.hotspot_name;
                }
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
            else
            {
                MessageBox.ShowAndReturnBack("用户未登陆，请登陆后再进行预定!");
                return;
            }
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
            model.totalamount = TotalMoney;
            model.paytype = 0;
            model.ordertype = TypeId;
            model.totalquantity = num;
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
                objtype = (int)预约类型.游客,
                obj_id = Id,
                datasource = Target
            });
             * */
            if (result)
            {
                MessageBox.ShowAndRedirect("预定成功!", "share_youke.aspx");
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