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
    public partial class user_center : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                var model = LoginCheck();
                if (model != null)
                {
                    if (BMemberSign.IsSign(model.id) == false) { this.ltrRegistrationTex.Text = "<a href=\"RegistrationIt.aspx\"><img src=\"../images/qd1.png\" width=\"50\"></a>"; } else { this.ltrRegistrationTex.Text = "<img src=\"../images/qd2.png\" width=\"50\">"; }
                    if (model.IsEMember == 0)
                    {
                        this.phJF.Visible = false;
                    }
                    else
                    {
                        this.phJF.Visible = true;
                    }
                    this.ltrJiFen.Text = BMemberIntegral.GetMemberInteral(model.id).ToString("F2");
                    this.ltrNickName.Text = model.nickname;
                    this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.head) + "\" class=\"user-img\" />";
                }
            }
        }
    }
}