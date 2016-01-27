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
    public partial class visitor_wjdcview :BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utils.GetQueryStringValue("dotype") == "save")
            {
                PostSurveys();
                return;
            }
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    var list = BQuestionnaire.GetList(Id);
                    if (list != null)
                    {
                        string ItemStr = "";
                        System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                        int i = 0;
                        foreach (var m in list)
                        {
                            tmpStr.Append("<tr><td>" + (++i).ToString() + "、" + m.name + "</td></tr>");
                            tmpStr.Append(SpliteQuestionItem(m.id, m.qoption));
                            ItemStr = ItemStr + "{\"Id\":\"" + m.id + "\"}" + ",";
                        }
                        tmpStr.Append("<tr><td align=\"center\"><input type=\"button\" class=\"login_btn1\" value=\"提 交\" onclick='checkradio({\"Id\":\"" + Id + "\",\"ItemId\":[" + ItemStr.TrimEnd(',') + "]})'></td></tr>");
                        this.ltrItem.Text = tmpStr.ToString();
                    }
                }
                else
                {
                    MessageBox.ShowAndReturnBack("未发现您要查看的信息!");
                    return;
                }
            }
        }
        /// <summary>
        /// 投票
        /// </summary>
        private void PostSurveys()
        {
            var UserModel = LoginCheck();
            string MemberId = "";
            if (UserModel != null)
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
        /// 切内容
        /// </summary>
        /// <param name="ItemInfo"></param>
        /// <returns></returns>
        private string SpliteQuestionItem(string ItemId,string ItemInfo) {
            System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
            string[] items = Utils.Split(ItemInfo, "#");
            if (items.Length > 0) {
                foreach (string m in items) {
                    tmpStr.Append("<tr><td><input type=\"radio\" id=\"ItemValue_" + ItemId + "\" name=\"ItemValue_" + ItemId + "\" value=\"" + m + "\">" + m + "</td></tr>");
                }
            }
            return tmpStr.ToString();
        }
    }
}