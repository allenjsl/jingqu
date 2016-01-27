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

namespace Adpost.YCH.WEB.news
{
    public partial class news_eventshow : BasePage
    {
        protected string StartDate = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string doType = Utils.GetQueryStringValue("doType");
            if (doType == "IsCheck") { CheckLogin(); return; }
            if (!IsPostBack)
            {
                InitUserInfo();
                InitEventInfo();
            }
        }
        private void CheckLogin() {
            var LoginModel = LoginCheck();
            if (LoginModel == null)
            {
                Utils.RCWE(UtilsCommons.AjaxReturnJson("0", "/Login.aspx?Url=" + Server.UrlEncode("/news/news_eventshow.aspx?Id=" + Utils.GetQueryStringValue("Id"))));
            }
            else {
                Utils.RCWE(UtilsCommons.AjaxReturnJson("1", "已登陆"));
            }
        }
        private void InitUserInfo() {
            var LoginModel = LoginCheck();
            if (LoginModel == null)
            {
                //MessageBox.ShowAndRedirect("用户未登陆，请登陆后下单!", "/Login.aspx?Url="+Server.UrlEncode(Request.Url.ToString()));
                //return;
            }
            if (LoginModel == null) {
            //未登陆
                //this.ltrUserInfo.Text = "<tr><td width=\"15%\" class=\"theme_td1\">用户名</td><td width=\"85%\"><input type=\"text\"  name=\"username\" class=\"login_input1\"></td></tr><tr><td width=\"15%\" class=\"theme_td1\">密码</td><td width=\"85%\"><input type=\"password\" name=\"userpwd\" class=\"login_input2\"></td></tr>";
            } else { 
            //已登陆
                this.ltrUserInfo.Text = "<tr><td width=\"15%\" class=\"theme_td1\">用户名</td><td width=\"85%\">" + LoginModel.user_name+ "</td></tr>";
                this.txtEmail.Value = LoginModel.mail;
            }
        }
        /// <summary>
        /// 加载活动信息
        /// </summary>
        private void InitEventInfo() {
            string Id = Utils.GetQueryStringValue("Id");
            if (!String.IsNullOrWhiteSpace(Id))
            {
                var model = BActivities.GetModel(Id);
                if (model != null)
                {
                    if (model.is_audit == 1)
                    {
                        this.ltrShowBtn.Visible = true;
                    }
                    else {
                        this.ltrShowBtn.Visible = false;
                    }
                    bool IsOpen = true;
                    if (model.act_startdate.HasValue)
                        StartDate = model.act_startdate.Value.ToString("yyyy-MM-dd");
                    if (model.act_enddate != null)
                    {                       
                        if (model.act_startdate <= DateTime.Now && model.act_enddate > DateTime.Now)
                        {
                            this.ltrTitle.Text = "开展中的活动";
                            this.ltrShowBtn.Text = "<div id=\"btnEventJoinClick\" class=\"pane_content_list_show1_btn\">我要报名</div>";
                        }
                        else
                        {
                            IsOpen = false;
                            this.ltrTitle.Text = "已结束的活动";
                        }                            
                    }
                    if (!String.IsNullOrWhiteSpace(model.thumb_img))
                        this.ltrImg.Text = "<img src=\"" + model.thumb_img + "\">";
                    this.ltrAddress.Text = model.act_address;
                    this.ltract_registration.Text = model.act_registration;
                    this.ltrprebookphone.Text = model.prebookphone;
                    this.ltrpriceinfo.Text = model.price+" 元";
                    this.ltrambitus_restaurant.Text = model.ambitus_restaurant;
                    this.ltrIntro.Text = model.act_introduce;
                    this.ltract_process.Text = model.act_process;
                    this.ltrRemark.Text = model.act_registration;
                    #region 报名次数及参加人数
                    string str = "<tr class=\"tempRow\"><td width=\"100\"><input name=\"txtAName\" type=\"text\" class=\"theme_input1\" style=\"width:100px;\"></td> <td width=\"100\"><input name=\"txtASex\" type=\"text\" class=\"theme_input1\" style=\"width:100px;\"></td><td width=\"200\"><input name=\"txtAIdCard\" type=\"text\" class=\"theme_input1\" style=\"width:200px;\"></td><td width=\"200\"><input name=\"txtAMobile\" type=\"text\" class=\"theme_input1\" style=\"width:200px;\"></td></tr>";
                    if (model.personnumlimit > 1)
                    {
                        for (int j = 0; j < model.personnumlimit - 1; j++)
                        {
                            str += "<tr class=\"tempRow\"><td width=\"100\"><input name=\"txtAName\" type=\"text\" class=\"theme_input1\" style=\"width:100px;\"></td> <td width=\"100\"><input name=\"txtASex\" type=\"text\" class=\"theme_input1\" style=\"width:100px;\"></td><td width=\"200\"><input name=\"txtAIdCard\" type=\"text\" class=\"theme_input1\" style=\"width:200px;\"></td><td width=\"200\"><input name=\"txtAMobile\" type=\"text\" class=\"theme_input1\" style=\"width:200px;\"></td></tr>";
                        }                        
                    }
                    this.ltrBuyContactInfo.Text = str;
                    int TotalRows = 0,TotalPeoNumber = 0;
                    PageInfo pi = new PageInfo();
                    pi.PageIndex = 1;
                    pi.PageSize = int.MaxValue;
                    pi.AddCondition<ViewOrderDTO>(o => o.ordertype, (int)订单类型.活动, QueryMethod.Equal);
                    pi.AddCondition<ViewOrderDTO>(o => o.productid, Id, QueryMethod.Equal);
                    pi.AddCondition<ViewOrderDTO>(o => o.is_delete, 0, QueryMethod.Equal);
                    var Tlist = BOrder.GetViewList(pi, ref TotalRows);
                    int TotalCount = 1;
                    this.ltrallowjointimelimit.Text = model.allowjointimelimit.ToString();
                    this.ltrJoinCount.Text = TotalRows.ToString();
                    if (Tlist!=null && Tlist.Count() > 0)
                    {
                        foreach (var m in Tlist)
                        {
                            TotalPeoNumber += m.num;
                            TotalCount += m.childrennum;
                        }
                    }
                    this.ltrJoinPeoNumber.Text = TotalPeoNumber.ToString();
                    #endregion
                    if (model.allowjointimelimit <= TotalCount)
                        this.ltrShowBtn.Visible = false;
                    var NextModel = BActivities.GetNextModel(Target, model.create_date, IsOpen);
                    if (NextModel != null)
                    {
                        this.ltrNext.Text = "<p><a href=\"news_eventshow.aspx?Id=" + NextModel.id + "\">下一则：" + NextModel.act_name + "</a></p>";
                    }
                    else
                    {
                        this.ltrNext.Text = "<p><a href=\"#\">下一则：暂无</a></p>";
                    }
                    var PreModel = BActivities.GetPreModel(Target, model.create_date, IsOpen);
                    if (PreModel != null)
                    {
                        this.ltrPre.Text = "<p><a href=\"news_eventshow.aspx?Id=" + PreModel.id + "\">上一则：" + PreModel.act_name + "</a></p>";
                    }
                    else
                    {
                        this.ltrPre.Text = "<p><a href=\"#\">上一则：暂无</a></p>";
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
        /// <summary>
        /// 参与活动
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnJoin_Click(object sender, EventArgs e)
        {
            string MemberId = "",UserName = "",LinkName = "",ContactTel = "",ContactSex="男";
            var LoginModel = LoginCheck();
            if (LoginModel == null)
            {
                UserName = Utils.GetFormValue("username");
                string Password = Utils.GetFormValue("userpwd");
                if (string.IsNullOrWhiteSpace(UserName) || string.IsNullOrWhiteSpace(Password))
                {
                    MessageBox.ShowAndReturnBack("请输入用户名和密码！");
                    return;
                }
                var result = BMember.Login(UserName, Password);
                if (result != null)
                {
                    HttpCookie Hc = new HttpCookie(_AuthorName);
                    Hc.Values.Add("Id", result.id);
                    Hc.Values.Add("UserName", result.user_name);
                    Hc.Values.Add("nickname", result.nickname);
                    HttpContext.Current.Response.Cookies.Add(Hc);
                    MemberId = result.id;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("用户名或密码不正确！");
                    return;
                }
            }
            else {
                MemberId = LoginModel.id;
            }
            var MemberModel = BMember.GetModel(MemberId);
            if (MemberModel != null)
            {
                UserName = MemberModel.user_name;
                LinkName = MemberModel.uname;
                if(MemberModel.sex.HasValue){
                    ContactSex = MemberModel.sex.Value==0?"女":"男";
                }
            }
            string Id = Utils.GetQueryStringValue("Id");
            //取登记数据
            string PlanTime = Utils.GetFormValue("txtPlanTime");
            string MobilePhone = Utils.GetFormValue("txtMobilePhone");
            string Email = Utils.GetFormValue("txtEmail");
            string Address = Utils.GetFormValue("txtAddress");
            //人数
            int JoinNumber = Utils.GetInt(Utils.GetFormValue("txtJoinNumber"));
            //份数
            int CountNumber = Utils.GetInt(Utils.GetFormValue("txtFenNumber"));
            int isneedtool = Utils.GetInt(Utils.GetFormValue("dj"));
            string Remark = Utils.GetFormValue("txtRemark");
            string[] arrName = Utils.GetFormValues("txtAName");
            string[] arrSex = Utils.GetFormValues("txtASex");
            string[] arrIdCard = Utils.GetFormValues("txtAIdCard");
            string[] arrPhone = Utils.GetFormValues("txtAMobile");
            if (arrName.Length < 1) {
                MessageBox.ShowAndReturnBack("请填写报名人信息!");
                return;
            }
            for (int j = 0; j < arrName.Length; j++) {
                if (j == 0) {
                    if (String.IsNullOrWhiteSpace(arrName[j]) || String.IsNullOrWhiteSpace(arrSex[j]) || String.IsNullOrWhiteSpace(arrIdCard[j]) || String.IsNullOrWhiteSpace(arrPhone[j])) {
                        MessageBox.ShowAndReturnBack("第一个报名信息必须录入完整!");
                        return;
                    }
                } else {
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
            int TotalRows = 0,TotalPeoNumber = 0;
                    PageInfo pi = new PageInfo();
                    pi.PageIndex = 1;
                    pi.PageSize = int.MaxValue;
                    pi.AddCondition<ViewOrderDTO>(o => o.ordertype, (int)订单类型.活动, QueryMethod.Equal);
                    pi.AddCondition<ViewOrderDTO>(o => o.productid, Id, QueryMethod.Equal);
                    pi.AddCondition<ViewOrderDTO>(o => o.is_delete, 0, QueryMethod.Equal);
                    var Tlist = BOrder.GetViewList(pi, ref TotalRows);
                    int TotalCount = 1;
                    if (Tlist!=null && Tlist.Count() > 0)
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
                 if (Amodel.allowjointimelimit <= TotalCount) {
                     MessageBox.ShowAndReturnBack("报名份数超过最大可报名份数!");
                     return;
                 }
                 float TotalMoney = Amodel.price * CountNumber;
                 string orderstatus = Convert.ToString((int)订单状态.待支付);
                 if(TotalMoney==0)
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
                     MessageBox.ShowAndRedirect("报名成功!", "../member/member_order_list.aspx?Type="+(int)订单类型.活动);
                     return;
                 }
                 else
                 {
                     MessageBox.ShowAndReturnBack("订单添加失败!");
                     return;
                 }
             }
             else {
                 MessageBox.ShowAndReturnBack("未找到报名的活动！");
                 return;
             }
            #endregion
            /*
            var Result = BMyActivities.Add(new MbmyactivitiesDTO{
            id=System.Guid.NewGuid().ToString(),
            memberid = MemberId,
            activitiesid = Id,
                //PlanTime = PlanTime,
            moblie = MobilePhone,
            email = Email,
            comm_address = Address,
            joinnum = JoinNumber,
            isneedtool = isneedtool,
            memo = Remark,
            datasource = Target
            });
            if (Result)
            {
                MessageBox.ShowAndRedirect("报名成功！", "news_event.aspx");
                return;
            }
            else
            {
                MessageBox.ShowAndReturnBack("报名失败！");
                return;
            }
             * */
        }
    }
}