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
    public partial class user_info : BasePage
    {
        protected string TrueName = "会员名", CardNo = "YCHP2014100113210001";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                var model = LoginCheck();
                if (model != null)
                {
                    TrueName = Server.UrlEncode(model.uname);
                    CardNo = model.vipcardno;
                    if (model.IsEMember == 0)
                    {
                        this.phGetCard.Visible = true;
                    }
                    else
                    {
                        this.phGetCard.Visible = false;
                    }
                    this.ltrName.Text = model.nickname;
                    this.ltrEmail.Text = model.mail;
                    this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.head) + "\"  class=\"user-imga\" />";
                    if (model.sex.HasValue)
                    {
                        if (model.sex.Value == 0)
                        {
                            this.ltrSex.Text = "女";
                        }
                        else
                        {
                            this.ltrSex.Text = "男";
                        }
                    }
                    else
                    {
                        this.ltrSex.Text = "";
                    }
                }
            }
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
                LoginModel.uname = truename;
                LoginModel.phone = mobilePhone;
                LoginModel.serialnumber = SerialNumber;
                LoginModel.vipcardno = "YCHP" + mobilePhone;
                var Result = BMember.Update(LoginModel);
                if (Result)
                {
                    MessageBox.ShowAndRedirect("会员卡申领成功！", "user-info.aspx");
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