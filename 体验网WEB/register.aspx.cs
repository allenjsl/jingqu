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

namespace Adpost.YCH.WEB
{
    /// <summary>
    /// 注册页
    /// </summary>
    public partial class register : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string UserName = Utils.GetFormValue("username");
            string Password = Utils.GetFormValue("userpwd");
            string Email = Utils.GetFormValue("usermail");
            string Province = Utils.GetFormValue("seachprov");
            string City = Utils.GetFormValue("homecity");
            string HomeTown = Utils.GetFormValue("seachdistrict");
            if (string.IsNullOrWhiteSpace(UserName))
            {
                MessageBox.ShowAndReturnBack("用户名不可为空");
                return;
            }
            if (string.IsNullOrWhiteSpace(Password))
            {
                MessageBox.ShowAndReturnBack("密码不可为空");
                return;
            }
            if (string.IsNullOrWhiteSpace(Email))
            {
                MessageBox.ShowAndReturnBack("邮箱不可为空");
                return;
            }
            if (string.IsNullOrWhiteSpace(Province))
            {
                MessageBox.ShowAndReturnBack("请选择所在省份");
                return;
            }
            if (string.IsNullOrWhiteSpace(City))
            {
                MessageBox.ShowAndReturnBack("请选择所在城市");
                return;
            }
            if (BMember.IsEmailExist(Email)==true)
            {
                MessageBox.ShowAndReturnBack("此Email已经被注册，请重新填写Email信息");
                return;
            }
            //判断用户是否被占用
            var IsExist = BMember.IsExist(UserName);
            if (IsExist == false) {
                var model = new MbmemberDTO()
                {
                    id = System.Guid.NewGuid().ToString(),
                    user_name = UserName,
                    password = Password,
                    nickname = UserName,
                    mail = Email,
                    khqy1 = Province,
                    khqy2 = City,
                    khqy3 = HomeTown,
                    publishtarget = Target,
                    create_date = DateTime.Now
                };
                var Result = BMember.Add(model);
                if (Result)
                {
                    MessageBox.ShowAndRedirect("用户注册成功！","/Default.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("用户注册失败！");
                    return;
                }
            } else {
                MessageBox.ShowAndReturnBack("用户名被占用，请重新选择新的用户名！");
                return;
            }
        }
    }
}