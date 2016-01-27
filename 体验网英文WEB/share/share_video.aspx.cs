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

namespace Adpost.YCH.WEB.share
{
    public partial class share_video : BasePage
    {
        protected string FlvFilePath = "";
        protected string Id = "";
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitPlay();
                InitList();
            }
        }
        private void InitPlay()
        {
            Id = Utils.GetQueryStringValue("Id");
            if (!String.IsNullOrWhiteSpace(Id))
            {
                var model = BVideo.GetModel(Id);
                if (model != null)
                {
                    FlvFilePath = model.videoaddress;
                    this.ltrVideName.Text = model.title;
                        this.ltrDate.Text = model.create_date.ToString("yyyy-MM-dd");
                }
            }
            else {
                var model = BVideo.GetLastModel(Target);
                if (model != null)
                {
                    FlvFilePath = model.videoaddress;
                    this.ltrVideName.Text = model.title;
                        this.ltrDate.Text = model.create_date.ToString("yyyy-MM-dd");
                }
            }
        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList()
        {
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            pi.AddCondition<TywvideosDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywvideosDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BVideo.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
    }
}