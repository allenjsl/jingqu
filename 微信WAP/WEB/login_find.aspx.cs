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

namespace Adpost.YCH.WAP
{
    public partial class login_find : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string Email = Utils.GetFormValue("txtEmail");
            if (!String.IsNullOrWhiteSpace(Email))
            {
                if (StringValidate.IsEmail(Email) == true)
                {
                    var model = BMember.CheckEmail(Email);
                    if (model != null)
                    {
                        ///获取6位随机密码
                        string NewPassword = MakeValidCode();
                        model.password = NewPassword;
                        var Result = BMember.Update(model);
                        if (Result)
                        {
                            /*
                            EmailHelper mail = new EmailHelper();
                            mail.Subject = "阳澄湖半岛旅游度假区会员密码重置";
                            mail.Body = "尊敬的会员：您的新密码是：" + NewPassword + "，请您到阳澄湖官网登陆并修改您的密码！";
                            mail.ReceiveAddress = Email;  //邮件接收的地址
                            mail.SenderName = "阳澄湖半岛旅游度假区";
                             * */
                            MailSend.sendMail("smtp.163.com", Email, "ychbdsz@163.com", "ychbdsz@163.com", "123@abcd", "阳澄湖半岛旅游度假区会员密码重置", "尊敬的会员：您的新密码是：" + NewPassword + "，请您到阳澄湖官网登陆并修改您的密码！");
                            MessageBox.ShowAndRedirect("密码重置成功!", "login.aspx");
                        }
                        else
                        {
                            MessageBox.ShowAndReturnBack("用户密码修改失败！");
                            return;
                        }
                    }
                    else
                    {
                        MessageBox.ShowAndReturnBack("未找到您的会员信息!");
                    }
                }
                else
                {
                    MessageBox.ShowAndReturnBack("请填写正确的Email!");
                }
            }
            else
            {
                MessageBox.ShowAndReturnBack("请填写Email!");
            }
        }
        /// <summary>
        /// 生成6位数字随机验证码
        /// </summary>
        /// <returns></returns>
        private static string MakeValidCode()
        {
            char[] str = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
            string num = "";
            Random r = new Random();
            for (int i = 0; i < 6; i++)
            {
                num += str[r.Next(0, str.Length)].ToString();
            }

            return num;
        }
    }
}