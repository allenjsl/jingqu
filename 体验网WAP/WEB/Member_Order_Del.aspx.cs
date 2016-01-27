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
    public partial class Member_Order_Del : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                DelIt();
            }
        }
        private void DelIt()
        {
            string Id = Utils.GetQueryStringValue("Id");
            if (String.IsNullOrWhiteSpace(Id))
            {
                MessageBox.ShowAndReturnBack("请选择要删除的订单");
                return;
            }
            else
            {
                var result = BOrder.Delete(new string[] { Id });
                if (result)
                {
                    MessageBox.ShowAndRedirect("删除成功！", "user-dd.aspx?Type=" + Utils.GetQueryStringValue("Type"));
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("请选择要删除的订单");
                    return;
                }
            }
        }
    }
}