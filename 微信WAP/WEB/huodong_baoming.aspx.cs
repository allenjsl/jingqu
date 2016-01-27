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

namespace Adpost.YCH.WAP.WEB
{
    /// <summary>
    /// 活动报名
    /// </summary>
    public partial class huodong_baoming : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                InitUserInfo();
                InitEventInfo();
            }
        }
        private void InitUserInfo()
        {
            var LoginModel = LoginCheck();
            if (LoginModel != null)
            {
                //已登陆
                this.ltrUserInfo.Text = LoginModel.user_name ;
                this.txtEmail.Value = LoginModel.mail;
            }
        }
        /// <summary>
        /// 加载活动信息
        /// </summary>
        private void InitEventInfo()
        {
            string Id = Utils.GetQueryStringValue("Id");
            if (!String.IsNullOrWhiteSpace(Id))
            {
                var model = BActivities.GetModel(Id);
                if (model != null)
                {
                    this.ltrRemark.Text = model.act_registration;
                    if (model.is_audit == 1)
                    {
                        this.btnSubmit.Visible = true;
                    }
                    else
                    {
                        this.btnSubmit.Visible = false;
                    }
                    #region 报名次数及参加人数
                    string str = "<tr class=\"tempRow\"><td><input name=\"txtAName\" type=\"text\" style=\"width:30px;\"></td> <td><input name=\"txtASex\" type=\"text\" style=\"width:30px;\"></td><td><input name=\"txtAIdCard\" type=\"text\" style=\"width:30px;\"></td><td><input name=\"txtAMobile\" type=\"text\" style=\"width:30px;\"></td></tr>";
                    if (model.personnumlimit > 1)
                    {
                        for (int j = 0; j < model.personnumlimit - 1; j++)
                        {
                            str += "<tr class=\"tempRow\"><td><input name=\"txtAName\" type=\"text\" style=\"width:30px;\" ></td> <td><input name=\"txtASex\" type=\"text\" class=\"theme_input1\" style=\"width:30px;\"></td><td><input name=\"txtAIdCard\" type=\"text\" class=\"theme_input1\" style=\"width:30px;\"></td><td><input name=\"txtAMobile\" type=\"text\" class=\"theme_input1\" style=\"width:30px;\"></td></tr>";
                        }
                    }
                    this.ltrBuyContactInfo.Text = str;
                    int TotalRows = 0;
                    PageInfo pi = new PageInfo();
                    pi.PageIndex = 1;
                    pi.PageSize = int.MaxValue;
                    pi.AddCondition<ViewOrderDTO>(o => o.ordertype, (int)订单类型.活动, QueryMethod.Equal);
                    pi.AddCondition<ViewOrderDTO>(o => o.productid, Id, QueryMethod.Equal);
                    pi.AddCondition<ViewOrderDTO>(o => o.is_delete, 0, QueryMethod.Equal);
                    var Tlist = BOrder.GetViewList(pi, ref TotalRows);
                    #endregion
                    if (model.allowjointimelimit <= TotalRows)
                        this.btnSubmit.Visible = false;
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
        /// <summary>
        /// 提交保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string MemberId = "", UserName = "", LinkName = "", ContactSex = "";
            var LoginModel = LoginCheck();
            if (LoginModel == null)
            {
                MessageBox.ShowAndReturnBack("用户未登陆！");
            }
            else
            {
                MemberId = LoginModel.id;
            }
            var MemberModel = BMember.GetModel(MemberId);
            if (MemberModel != null)
            {
                UserName = MemberModel.user_name;
                LinkName = MemberModel.uname;
                if (MemberModel.sex.HasValue)
                {
                    ContactSex = MemberModel.sex.Value == 0 ? "女" : "男";
                }
            }
            string Id = Utils.GetQueryStringValue("Id");
            //取登记数据
            string PlanTime = Utils.GetFormValue("txtPlanTime");
            string MobilePhone = Utils.GetFormValue("txtMobilePhone");
            string Email = Utils.GetFormValue("txtEmail");
            string Address = Utils.GetFormValue("txtAddress");
            int JoinNumber = Utils.GetInt(Utils.GetFormValue("txtJoinNumber"));
            //份数
            int CountNumber = Utils.GetInt(Utils.GetFormValue("txtFenNumber"));
            int isneedtool = Utils.GetInt(Utils.GetFormValue("dj"));
            string Remark = Utils.GetFormValue("txtRemark");
            //string Remark = "";
            string[] arrName = Utils.GetFormValues("txtAName");
            string[] arrSex = Utils.GetFormValues("txtASex");
            string[] arrIdCard = Utils.GetFormValues("txtAIdCard");
            string[] arrPhone = Utils.GetFormValues("txtAMobile");
            if (arrName.Length < 1)
            {
                MessageBox.ShowAndReturnBack("请填写报名人信息!");
                return;
            }
            for (int j = 0; j < arrName.Length; j++)
            {
                if (j == 0)
                {
                    if (String.IsNullOrWhiteSpace(arrName[j]) || String.IsNullOrWhiteSpace(arrSex[j]) || String.IsNullOrWhiteSpace(arrIdCard[j]) || String.IsNullOrWhiteSpace(arrPhone[j]))
                    {
                        MessageBox.ShowAndReturnBack("第一个报名信息必须录入完整!");
                        return;
                    }
                }
                else
                {
                    if (!String.IsNullOrWhiteSpace(arrName[j]))
                    {
                        if (String.IsNullOrWhiteSpace(arrIdCard[j]))
                        {
                            MessageBox.ShowAndReturnBack("第" + (j + 1) + "个报名信息请录入姓名和证件号码!");
                            return;
                        }
                    }
                }
            }
            int TotalRows = 0, TotalPeoNumber = 0;
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<ViewOrderDTO>(o => o.ordertype, (int)订单类型.活动, QueryMethod.Equal);
            pi.AddCondition<ViewOrderDTO>(o => o.productid, Id, QueryMethod.Equal);
            pi.AddCondition<ViewOrderDTO>(o => o.is_delete, 0, QueryMethod.Equal);
            var Tlist = BOrder.GetViewList(pi, ref TotalRows);
            int TotalCount = 1;
            if (Tlist != null && Tlist.Count() > 0)
            {
                foreach (var m in Tlist)
                {
                    TotalPeoNumber += m.num;
                    TotalCount += m.childrennum;
                }
            }
            TotalCount = TotalCount + CountNumber;
            #region 写订单结构
            var Amodel = BActivities.GetModel(Id);
            if (Amodel != null)
            {
                if (Amodel.allowjointimelimit <= TotalCount)
                {
                    MessageBox.ShowAndReturnBack("报名份数超过最大可报名份数!");
                    return;
                }
                float TotalMoney = Amodel.price * CountNumber;
                string orderstatus = Convert.ToString((int)订单状态.待支付);
                if (TotalMoney == 0)
                    orderstatus = Convert.ToString((int)订单状态.已支付);
                string OrderId = System.Guid.NewGuid().ToString();
                DsorderDTO model = new DsorderDTO();
                model.id = OrderId;
                model.code = DateTime.Now.ToString("yyyyMMddHHmmss");
                model.orderstatus = orderstatus;
                model.member_id = MemberId;
                model.member_name = UserName;
                model.linkman = LinkName;
                model.customerphone = MobilePhone;
                model.customeraddress = Address;
                model.totalamount = TotalMoney;
                model.paytype = (int)支付类型.支付宝;
                model.ordertype = (int)订单类型.活动;
                model.orderdate = DateTime.Now;
                model.datasource = Target;
                model.remark = Remark;
                model.publishtarget = Target;
                model.is_valid = 1;
                model.create_date = DateTime.Now;
                List<DsorderdetailDTO> orderlist = new List<DsorderdetailDTO>();
                orderlist.Add(new DsorderdetailDTO
                {
                    id = System.Guid.NewGuid().ToString(),
                    ds_order_id = OrderId,
                    productid = Id,
                    productname = Amodel.act_name,
                    price = Amodel.price,
                    realprice = Amodel.price,
                    num = JoinNumber,
                    childrennum = CountNumber,
                    amount = (float)TotalMoney,
                    realamount = (float)TotalMoney,
                    roomtype = Id
                });
                model.Items = orderlist;
                List<Dsorderactivitiyperson> ActList = new List<Dsorderactivitiyperson>();
                for (int i = 0; i < arrName.Length; i++)
                {

                    ActList.Add(new Dsorderactivitiyperson
                    {
                        id = System.Guid.NewGuid().ToString(),
                        ds_order_id = OrderId,
                        name = arrName[i],
                        sex = arrSex[i],
                        idcard = arrIdCard[i],
                        phone = arrPhone[i]
                    });
                }
                model.Items2 = ActList;
                var result = BOrder.AddOrder(model);
                if (result)
                {
                    //if (TotalMoney > 0)
                    //MessageBox.ResponseScript("window.open(\"/AliPay/AliTradeTourOrder.aspx?OrderId=" + OrderId + "&OrderType=" + (int)订单类型.活动 + "&Pay=alipay\")");
                    //MessageBox.ResponseScript("window.open('/Alipay/default.aspx?OrderId=" + OrderId + "');alert('报名成功!');window.location.href='bandao-huodong.aspx';");
                    //MessageBox.ShowAndRedirect("报名成功!", "bandao-huodong.aspx");
                    MessageBox.ShowAndRedirect("报名成功!\\n进入订单中心进行支付。", "user-dd2.aspx?Type=" + (int)订单类型.活动);
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("订单添加失败!");
                    return;
                }
            }
            else
            {
                MessageBox.ShowAndReturnBack("未找到报名的活动！");
                return;
            }
            #endregion
        }
    }
}