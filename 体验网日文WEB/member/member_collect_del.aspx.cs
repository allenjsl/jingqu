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
    public partial class member_collect_del : BasePage
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
                MessageBox.ShowAndReturnBack("请选择要删除的收藏");
                return;
            }
            else
            {
                var result = BMycollect.Delete(new string[] { Id });
                if (result)
                {
                    MessageBox.ShowAndRedirect("删除成功！", "member_collect.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("请选择要删除的收藏");
                    return;
                }
            }
        }
    }
}