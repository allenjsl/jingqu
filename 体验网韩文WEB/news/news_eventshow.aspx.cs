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

namespace Adpost.YCH.WEB.news
{
    public partial class news_eventshow : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitUserInfo();
                InitEventInfo();
            }
        }
        private void InitUserInfo() {
            var LoginModel = LoginCheck();
            if (LoginModel == null) {
            //未登陆
                this.ltrUserInfo.Text = "<tr><td width=\"15%\" class=\"theme_td1\">用户名</td><td width=\"85%\"><input type=\"text\"  name=\"username\" class=\"login_input1\"></td></tr><tr><td width=\"15%\" class=\"theme_td1\">密码</td><td width=\"85%\"><input type=\"password\" name=\"userpwd\" class=\"login_input2\"></td></tr>";
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
                    else
                    {
                        this.ltrShowBtn.Visible = false;
                    }
                    bool IsOpen = true;
                    if (model.act_enddate != null)
                    {
                        if (model.act_startdate <= DateTime.Now && model.act_enddate > DateTime.Now)
                        {
                            this.ltrTitle.Text = "开展中的活动";
                            this.ltrShowBtn.Text = "<div class=\"pane_content_list_show1_btn\">我要报名</div>";
                        }
                        else{
                            IsOpen = false;
                            this.ltrTitle.Text = "已结束的活动";}
                    }
                    if (!String.IsNullOrWhiteSpace(model.thumb_img))
                        this.ltrImg.Text = "<img src=\"" + model.thumb_img + "\">";
                    this.ltrAddress.Text = model.act_address;
                    this.ltract_registration.Text = model.act_registration;
                    this.ltrprebookphone.Text = model.prebookphone;
                    this.ltrpriceinfo.Text = model.priceinfo + "    " + model.pricedesc;
                    this.ltrambitus_restaurant.Text = model.ambitus_restaurant;
                    this.ltrIntro.Text = model.act_introduce;
                    this.ltract_process.Text = model.act_process;
                    var NextModel = BActivities.GetNextModel(Target, model.create_date, IsOpen);
                    if (NextModel != null) { this.ltrNext.Text = "<p><a href=\"news_eventshow.aspx?Id=" + NextModel.id + "\">下一则：" + NextModel.act_name + "</a></p>"; } else { this.ltrNext.Text = "<p><a href=\"#\">下一则：暂无</a></p>"; }
                    var PreModel = BActivities.GetPreModel(Target, model.create_date, IsOpen);
                    if (PreModel != null) { this.ltrPre.Text = "<p><a href=\"news_eventshow.aspx?Id=" + PreModel.id + "\">上一则：" + PreModel.act_name + "</a></p>"; } else { this.ltrNext.Text = "<p><a href=\"#\">上一则：暂无</a></p>"; }
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
            string MemberId = "";
            var LoginModel = LoginCheck();
            if (LoginModel == null)
            {
                string UserName = Utils.GetFormValue("username");
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
            string Id = Utils.GetQueryStringValue("Id");
            //取登记数据
            string PlanTime = Utils.GetFormValue("txtPlanTime");
            string MobilePhone = Utils.GetFormValue("txtMobilePhone");
            string Email = Utils.GetFormValue("txtEmail");
            string Address = Utils.GetFormValue("txtAddress");
            int JoinNumber = Utils.GetInt(Utils.GetFormValue("txtJoinNumber"));
            int isneedtool = Utils.GetInt(Utils.GetFormValue("dj"));
            string Remark = Utils.GetFormValue("txtRemark");
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
        }
    }
}