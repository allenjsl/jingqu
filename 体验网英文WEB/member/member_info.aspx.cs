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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                IsLogin();
                var model = LoginCheck();
                if (model != null)
                {
                    ProvinceId = model.khqy1;
                    CityId = model.khqy2;
                    HomeTown = model.khqy3;
                    this.username.Text = model.nickname;
                    this.userpwd.Text = model.password;
                    this.txtEmail.Text = model.mail;
                    this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.head) + "\" width=\"185\" height==\"185\" />";
                    this.ltrImg2.Text = "<img src=\"" + Common.NoPhotoDefault(model.head) + "\" width=\"70\" height==\"70\" />";
                    if (model.sex.HasValue)
                    {
                        if (model.sex.Value == 0) {
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
    }
}