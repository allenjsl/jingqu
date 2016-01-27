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

namespace Adpost.YCH.WEB.news
{
    public partial class news_notice : BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitList();
            }
        }
        private void InitList()
        {
            CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            int infoType = (int)资讯类别.通知公告;
            pi.AddCondition<TywinformationDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywinformationDTO>(o => o.info_type, infoType, QueryMethod.Equal);
            pi.AddCondition<TywinformationDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<TywinformationDTO>(o => o.title, Keyword, QueryMethod.Like);
            }
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BInfomation.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        /// <summary>
        /// 返回图片
        /// </summary>
        /// <param name="imgagelist"></param>
        /// <returns></returns>
        protected string ImgSplit(string imgagelist)
        {
            if (!String.IsNullOrWhiteSpace(imgagelist))
            {
                var arr = imgagelist.Split('|');
                if (arr.Length > 0)
                    return "<img width=\"403\" height=\"183\" src=\"" + arr[0] + "\">";
                else
                    return "<img width=\"403\" height=\"183\" src=\"../images/news_event_img1.jpg\">";
            }
            else
            {
                return "<img width=\"403\" height=\"183\" src=\"../images/news_event_img1.jpg\">";
            }
        }
    }
}