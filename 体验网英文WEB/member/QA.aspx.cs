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
    public partial class QA : BasePage
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
            pi.AddCondition<TywqandaDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywqandaDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.OrderBy.Add("create_date", OrderByType.Asc);
            var list = BQA.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string title = Utils.GetFormValue("title");
            string content = Utils.GetFormValue("content");
            var Result = BQA.Add(new TywqandaDTO
            {
                id = System.Guid.NewGuid().ToString(),
                question = title,
                anwser = content,
                publishtarget = Target,
                is_valid = 1,
                create_date = DateTime.Now
            });
            if (Result)
            {
                MessageBox.ShowAndRedirect("添加成功！", "QA.aspx");
                return;
            }
            else
            {
                MessageBox.ShowAndReturnBack("添加失败！");
                return;
            }
        }
    }
}