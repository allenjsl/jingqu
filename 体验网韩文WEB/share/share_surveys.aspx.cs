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
    /// <summary>
    /// 调查问卷
    /// </summary>
    public partial class share_surveys : BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utils.GetQueryStringValue("dotype") == "save")
            {
                PostSurveys();
                return;
            }
            if (!IsPostBack)
            {
                InitList();
            }
        }
        /// <summary>
        /// 投票
        /// </summary>
        private void PostSurveys()
        {
            var UserModel = LoginCheck();
            string MemberId = "";
            if(UserModel!=null)
                MemberId = UserModel.id;
            //Id="+Id+"&ItemId="+json.ItemId[i].Id+"&v="
            string Id = Utils.GetQueryStringValue("Id");
            string ItemId = Utils.GetQueryStringValue("ItemId");
            string SelectV = Utils.GetQueryStringValue("v");
            if (!String.IsNullOrWhiteSpace(SelectV))
                SelectV = Server.UrlDecode(SelectV.Trim());
            var result = BQuestionnaire.AddReply(new TywquestionnairereplyDTO
            {
                id = System.Guid.NewGuid().ToString(),
                qid = Id,
                sid = ItemId,
                answer = SelectV,
                memberid = MemberId
            });
            if (result)
            {
                Response.Clear();
                Response.Write(UtilsCommons.AjaxReturnJson("0", "投票成功！"));
                Response.End();
                return;
            }
            else
            { 
            Response.Clear();
            Response.Write(UtilsCommons.AjaxReturnJson("0", "投票失败！"));
            Response.End();
            return;
            }
        }
        /// <summary>
        /// 加载列表
        /// </summary>
        private void InitList()
        {
            CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            pi.AddCondition<TywquestionnairemainDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywquestionnairemainDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            //有效活动
            DateTime cDate = DateTime.Now;
            pi.AddCondition<TywquestionnairemainDTO>(o => o.starttime, cDate, QueryMethod.LessThanOrEqual);
            pi.AddCondition<TywquestionnairemainDTO>(o => o.endtime, cDate, QueryMethod.GreaterThan);
            pi.OrderBy.Add("create_date", OrderByType.Asc);
            if (!String.IsNullOrWhiteSpace(Keyword))
            {
                pi.AddCondition<TywquestionnairemainDTO>(o => o.name, Keyword, QueryMethod.Like);
            }
            //Response.Write(pi.ToSqlCondition());
            var list = BQuestionnaire.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
        }
        /// <summary>
        /// 调查内容绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ItemListBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
                TywquestionnairemainDTO Model = (TywquestionnairemainDTO)e.Item.DataItem;
                string QId = Model.id;
                Model = null;
                Literal ltrItem = (Literal)e.Item.FindControl("ltrItem");
                var list = BQuestionnaire.GetList(QId);
                if (list != null)
                {
                    string ItemStr = "";
                    System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                    foreach (var m in list)
                    {
                        tmpStr.Append("<tr><td>"+m.name+"</td></tr>");
                        tmpStr.Append(SpliteQuestionItem(m.id, m.qoption));
                        ItemStr = ItemStr +"{\"Id\":\""+ m.id +"\"}"+ ",";
                    }
                    tmpStr.Append("<tr><td align=\"center\"><a href='javascript:checkradio({\"Id\":\"" + QId + "\",\"ItemId\":[" + ItemStr.TrimEnd(',') + "]});'>提 交</a></td></tr>");
                    ltrItem.Text = tmpStr.ToString();
                }
            }
        }
        /// <summary>
        /// 切内容
        /// </summary>
        /// <param name="ItemInfo"></param>
        /// <returns></returns>
        protected string SpliteQuestionItem(string ItemId,string ItemInfo) {
            System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
            string[] items = Utils.Split(ItemInfo, "#");
            if (items.Length > 0) {
                foreach (string m in items) {
                    tmpStr.Append("<tr><td class=\"survey_td1\"><input type=\"radio\" id=\"ItemValue_" + ItemId + "\" name=\"ItemValue_" + ItemId + "\" value=\"" + m + "\">" + m + "</td></tr>");
                }
            }
            return tmpStr.ToString();
        }
    }
}