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
using YCH.DataCenter.DTO.Base;
using ZFramework.Pager;
#endregion

namespace Adpost.YCH.WEB.member
{
    /// <summary>
    /// 积分商品
    /// </summary>
    public partial class IntegralShop : BasePage
    {
        private string HostpotId = "2015ychjfsc1y";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
                InitIntegralProductList();
            }
        }
        /// <summary>
        /// 绑定
        /// </summary>
        /// <param name="Id"></param>
        private void InitIntegralProductList()
        {
            var ItemsList = BHotspot.GetIntegralList(Target, HostpotId);
            if (ItemsList != null)
            {
                this.rptItemsList.DataSource = ItemsList;
                this.rptItemsList.DataBind();
            }
        }
        protected string PhotoList(string photoList)
        {
            if (!String.IsNullOrWhiteSpace(photoList))
            {
                string[] pl = photoList.Split('|');
                string str = "<img src=\"" + pl[0] + "\"/>";
                return str;
            }
            else { return ""; }
        }
    }
}