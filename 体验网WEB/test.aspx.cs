using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using YCH.DataCenter.DTO;
using ZFramework.Pager;
using Adpost.YCH.BLL;


namespace Adpost.YCH.WEB
{
    public partial class test : System.Web.UI.Page
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        protected void Page_Load(object sender, EventArgs e)
        {
            string ApiUrl = "http://122.224.201.244/ychapitest/api/V1/Tywcomment/SearchPage";
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 50;
            pi.AddCondition<TywcommentDTO>(o => o.datasource, BasePage.Target, QueryMethod.Equal);
            pi.AddCondition<TywcommentDTO>(o => o.objecttype, (int)评论类型.游记, QueryMethod.Equal);
            pi.AddCondition<TywcommentDTO>(o => o.objectid, "921b7cc7-78c1-486e-96bf-0f26ac68ea7d", QueryMethod.Equal);
            pi.AddCondition<TywcommentDTO>(o => o.replyid, "0", QueryMethod.Equal);
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            //Response.Write(pi.ToSqlCondition());
            HttpClient client = new HttpClient();
            var strJson = pi.ToJSON_Newtonsoft();
            HttpContent httpContent = new StringContent(strJson);
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var v = client.PostAsync(ApiUrl, httpContent).Result.Content.ReadAsStringAsync().Result;
            Response.Write(v);
        }
    }
}