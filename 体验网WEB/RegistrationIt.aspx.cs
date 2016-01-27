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
    public partial class RegistrationIt : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                var model = LoginCheck();
                if (model != null)
                {
                    if (BMemberSign.IsSign(model.id) == false)
                    {
                        BMemberSign.Add(new MbmembersignDTO
                        {
                            memberid = model.id,
                            signdate = DateTime.Now.ToString("yyyy-MM-dd")
                        });
                        MessageBox.ShowAndRedirect("签到成功！", "/");
                    }
                    else
                    {
                        MessageBox.ShowAndReturnBack("您今天已签到");
                    }
                }
            }
        }
    }
}