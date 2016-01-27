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
    public partial class member_info : BasePage
    {
        protected string ProvinceId = "0", CityId = "0", HomeTown = "0";
        protected string TrueName = "会员名", CardNo = "YCHP2014100113210001";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                IsLogin();
                var model = LoginCheck();
                if (model != null)
                {
                    TrueName = Server.UrlEncode(model.uname);
                    CardNo = model.vipcardno;
                    if (model.IsEMember == 0)
                    {
                        this.phGetCard.Visible = false;
                        this.phPoint.Visible = false;
                    }
                    else
                    {
                        this.phGetCard.Visible = false;
                        this.phPoint.Visible = true;
                        this.ltrPoint.Text = BMemberIntegral.GetMemberInteral(model.id).ToString("F2");
                    }
                    ProvinceId = model.khqy1;
                    CityId = model.khqy2;
                    HomeTown = model.khqy3;
                    this.ltrUserName.Text = model.user_name;
                    this.username.Text = model.nickname;
                    this.userpwd.Text = model.password;
                    this.txtEmail.Text = model.mail;
                    this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.head) + "\" width=\"185\" height==\"185\" />";
                    this.ltrImg2.Text = "<img src=\"" + Common.NoPhotoDefault(model.head) + "\" width=\"70\" height==\"70\" />";
                    if (model.sex.HasValue)
                    {
                        if (model.sex.Value == 0)
                        {
                            this.ltrSex.Text = "<input type=\"radio\" name=\"sex\" value=\"1\">男&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"radio\" name=\"sex\" checked=\"checked\" value=\"0\">女";
                        }
                        else
                        {
                            this.ltrSex.Text = "<input type=\"radio\" name=\"sex\" checked=\"checked\" value=\"1\">男&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"radio\" name=\"sex\" value=\"0\">女";
                        }
                    }
                    else
                    {
                        this.ltrSex.Text = "<input type=\"radio\" name=\"sex\" value=\"1\">男&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"radio\" name=\"sex\" value=\"0\">女";
                    }
                    if (model.birthday.HasValue)
                    {
                        this.txtBirthday.Text = model.birthday.Value.ToString("yyyy-MM-dd");
                    }
                    if (model.identity_name.HasValue)
                    {
                        for (int i = 0; i < this.ddlCerType.Items.Count; i++)
                        {
                            if (model.identity_name.Value.ToString() == this.ddlCerType.Items[i].Value)
                                this.ddlCerType.Items[i].Selected = true;
                        }
                    }
                    this.txtCerNumber.Text = model.identity_id;
                    this.txtAddress.Text = string.IsNullOrWhiteSpace(model.address) ? model.comm_address : model.address;
                    this.txtPostCode.Text = model.postcode;
                    if (model.hasMarry == 0)
                    {
                        this.ltrMarry.Text = "<input type=\"radio\" name=\"rbMarry\" value=\"1\">已婚&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"radio\" name=\"rbMarry\" checked=\"checked\" value=\"0\">未婚";
                    }
                    else
                    {
                        this.ltrMarry.Text = "<input type=\"radio\" name=\"rbMarry\" checked=\"checked\" value=\"1\">已婚&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"radio\" name=\"rbMarry\" value=\"0\">未婚";
                    }
                    if (model.hasChildren == 0)
                    {
                        this.ltrChildren.Text = "<input type=\"radio\" name=\"rbChildren\" value=\"1\">有&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"radio\" name=\"rbMarry\" checked=\"checked\" value=\"0\">无";
                    }
                    else
                    {
                        this.ltrChildren.Text = "<input type=\"radio\" name=\"rbChildren\" checked=\"checked\" value=\"1\">有&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"radio\" name=\"rbMarry\" value=\"0\">无";
                    }
                    if (!String.IsNullOrWhiteSpace(model.monthlySalary))
                    {
                        for(int i=0;i<this.ddlMonthlySalary.Items.Count;i++)
                        {
                            if (model.monthlySalary==this.ddlMonthlySalary.Items[i].Value)
                                this.ddlMonthlySalary.Items[i].Selected = true;
                        }
                    }
                    if (!String.IsNullOrWhiteSpace(model.job))
                    {
                        for (int i = 0; i < this.ddlJob.Items.Count; i++)
                        {
                            if (model.job == this.ddlJob.Items[i].Value)
                                this.ddlJob.Items[i].Selected = true;
                        }
                    }
                    if (string.IsNullOrWhiteSpace(model.interest))
                    {
                        this.ltrInterest.Text = "<input type=\"checkbox\" name=\"cbInterest\" value=\"精彩活动\">精彩活动&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"文旅资讯\">文旅资讯&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"度假优惠\">度假优惠&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"度假服务及设施\">度假服务及设施&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"其它\">其它";
                    }
                    else {
                        string[] arrInterest = model.interest.Split(',');
                        this.ltrInterest.Text = "<input type=\"checkbox\" name=\"cbInterest\" value=\"精彩活动\"" + (StringValidate.IsStringExists("精彩活动", arrInterest) ? " checked=\"checked\"" : "") + ">精彩活动&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"文旅资讯\"" + (StringValidate.IsStringExists("文旅资讯", arrInterest) ? " checked=\"checked\"" : "") + ">文旅资讯&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"度假优惠\"" + (StringValidate.IsStringExists("度假优惠", arrInterest) ? " checked=\"checked\"" : "") + ">度假优惠&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"度假服务及设施\"" + (StringValidate.IsStringExists("度假服务及设施", arrInterest) ? " checked=\"checked\"" : "") + ">度假服务及设施&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"cbInterest\" value=\"其它\"" + (StringValidate.IsStringExists("其它", arrInterest) ? " checked=\"checked\"" : "") + ">其它";
                    }
                }
            }
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void linkBtnSave_Click(object sender, EventArgs e)
        {
            var LoginModel = LoginCheck();
            if (LoginModel != null)
            {
                string nickname = Utils.GetFormValue("username");
                string Password = Utils.GetFormValue("userpwd");
                string Email = Utils.GetFormValue("txtEmail");
                string Province = Utils.GetFormValue("seachprov");
                string City = Utils.GetFormValue("homecity");
                string HomeTown = Utils.GetFormValue("seachdistrict");
                int sex = Utils.GetInt(Utils.GetFormValue("sex"));
                string strBirthday = Utils.GetFormValue(txtBirthday.UniqueID);
                int CerType = Utils.GetInt(Utils.GetFormValue(ddlCerType.UniqueID));
                string CerId = Utils.GetFormValue(txtCerNumber.UniqueID);
                string Address = Utils.GetFormValue(txtAddress.UniqueID);
                string PostCode = Utils.GetFormValue(txtPostCode.UniqueID);
                int Marry = Utils.GetInt(Utils.GetFormValue("rbMarry"));
                int Children = Utils.GetInt(Utils.GetFormValue("rbChildren"));
                string MonthlySalary = Utils.GetFormValue(ddlMonthlySalary.UniqueID);
                string Job = Utils.GetFormValue(ddlJob.UniqueID);
                string Interest = Utils.GetFormValue("cbInterest");
                #region 头像
                string HeadPhoto = GetAttachFile();
                #endregion
                if (!String.IsNullOrWhiteSpace(Password))
                    LoginModel.password = Password;
                LoginModel.nickname = nickname;
                LoginModel.mail = Email;
                LoginModel.khqy1 = Province;
                LoginModel.khqy2 = City;
                LoginModel.khqy3 = HomeTown;
                LoginModel.sex = sex;
                LoginModel.head = HeadPhoto;
                if (!String.IsNullOrWhiteSpace(strBirthday) && StringValidate.IsDateTime(strBirthday) == true)
                    LoginModel.birthday = Utils.GetDateTime(strBirthday);
                LoginModel.identity_name = CerType;
                LoginModel.identity_id = CerId;
                LoginModel.address = Address;
                LoginModel.postcode = PostCode;
                LoginModel.hasMarry = Marry;
                LoginModel.hasChildren = Children;
                LoginModel.monthlySalary = MonthlySalary;
                LoginModel.job = Job;
                LoginModel.interest = Interest;
                var Result = BMember.Update(LoginModel);
                if (Result)
                {
                    MessageBox.ShowAndRedirect("用户修改成功！", "member_info.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("用户修改失败！");
                    return;
                }
            }
            else
            {
                MessageBox.ShowAndRedirect("用户未登陆！", "/Default.aspx");
                return;
            }
        }
        /// <summary>
        /// 上传的附件
        /// </summary>
        /// <returns></returns>
        protected string GetAttachFile()
        {
            var files1 = UploadControl.Files;
            var files2 = UploadControl.YuanFiles;
            if (files1 != null && files1.Count > 0)
            {
                return files1[0].FilePath;
            }
            if (files2 != null && files2.Count > 0)
            {
                return files2[0].FilePath;
            }
            return string.Empty;
        }
        /// <summary>
        /// 会员卡申领
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGetVipCard_Click(object sender, EventArgs e)
        {
            var LoginModel = LoginCheck();
            if (LoginModel != null)
            {
                int SerialNumber = BMember.GetMaxSerialNumber() + 1;
                string truename = Utils.GetFormValue("truename");
                string mobilePhone = Utils.GetFormValue("mobilePhone");
                if (String.IsNullOrWhiteSpace(truename))
                {
                    MessageBox.ShowAndReturnBack("请填写真实姓名！");
                    return;
                }
                if (String.IsNullOrWhiteSpace(mobilePhone))
                {
                    MessageBox.ShowAndReturnBack("请填写手机号码！");
                    return;
                }
                if (BMember.IsMobilePhoneExist(mobilePhone))
                {
                    MessageBox.ShowAndReturnBack("该手机号码已被注册！");
                    return;
                }
                LoginModel.uname = truename;
                LoginModel.phone = mobilePhone;
                LoginModel.serialnumber = SerialNumber;
                LoginModel.vipcardno = "YCHP" + mobilePhone;
                LoginModel.IsEMember = 1;
                var Result = BMember.Update(LoginModel);
                if (Result)
                {
                    MessageBox.ShowAndRedirect("会员卡申领成功！", "member_info.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("会员卡申领失败！");
                    return;
                }

            }
            else
            {
                MessageBox.ShowAndRedirect("用户未登陆！", "/Default.aspx");
                return;
            }
        }
    }
}