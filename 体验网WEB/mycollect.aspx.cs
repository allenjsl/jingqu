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
    public partial class mycollect : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                var MemberModel = LoginCheck();
                if (MemberModel == null) {
                    MessageBox.ShowAndRedirect("请先登陆再进行操作！","/Login.aspx");
                    return;
                }
                string Id = Utils.GetQueryStringValue("Id");
                string Url = Utils.GetQueryStringValue("RUrl");
                int TypeId = Utils.GetInt(Utils.GetQueryStringValue("TypeId"));
                if (String.IsNullOrWhiteSpace(Id))
                {
                    MessageBox.ShowAndReturnBack("收藏失败！");
                    return;
                }
                if (!String.IsNullOrWhiteSpace(Url))
                    Url = Server.UrlDecode(Url);
                var model = new MbmycollectDTO() { 
                id=System.Guid.NewGuid().ToString(),
                memberid = MemberModel.id,
                collectcategory = TypeId,
                collecttime = DateTime.Now,
                collectid = Id
                };
                var result = BMycollect.CollectAdd(model);
                if (result) {
                    MessageBox.ShowAndReturnBack("收藏成功！");
                } else {
                    MessageBox.ShowAndReturnBack("收藏失败！");
                }
            }
        }
    }
}