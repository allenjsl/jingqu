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
#endregion

namespace Adpost.YCH.WEB.about
{
    public partial class about_location : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ltrInfo.Text = BIntoIsland.ContentInfo(Target, 走进半岛.半岛位置);
            }
        }
    }
}