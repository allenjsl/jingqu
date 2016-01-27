using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.Utility;
using Adpost.YCH.BLL;

namespace Adpost.YCH.WEB.member
{
    public partial class member_guangyindel : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                Del();
            }
        }
        private void Del()
        {
            string Id = Utils.GetQueryStringValue("Id");
            if (!String.IsNullOrWhiteSpace(Id))
            {
                var model = Bphotoalbum.GetModel(Id);
                if (model != null) {
                    var result = Bphotoalbum.Delete(new string[] { Id });
                    if (result)
                    {
                        MessageBox.ShowAndRedirect("删除成功!", "member_guangyin.aspx");
                        return;
                    }
                    else
                    {
                        MessageBox.ShowAndReturnBack("删除失败!");
                        return;
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
    }
}