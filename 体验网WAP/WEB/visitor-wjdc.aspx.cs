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
    public partial class visitor_wjdc : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitList();
            }
        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList()
        {
            int TotalRows = 0;
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            //pi.AddCondition<TywquestionnairemainDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywquestionnairemainDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //有效活动
            DateTime cDate = DateTime.Now;
            pi.AddCondition<TywquestionnairemainDTO>(o => o.starttime, cDate, QueryMethod.LessThanOrEqual);
            pi.AddCondition<TywquestionnairemainDTO>(o => o.endtime, cDate, QueryMethod.GreaterThan);
            pi.OrderBy.Add("create_date", OrderByType.Asc);
            var list = BQuestionnaire.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
    }
}