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
            HttpClient client = new HttpClient();
            string ModelApiUrl = RemoteDomain + "/StatisticalAnalysis/StatCollectNumByObjID?objID=42797f64-3b79-451b-af8b-f77f30a4c9b1";
            var model = client.GetAsync(ModelApiUrl).Result.Content.ReadAsStringAsync().Result;
            if (model != null) {
                Response.Write(model);
                var js = JsonConvert.DeserializeObject<Adpost.YCH.BLL.ApiResult<string>>(model);
                Response.Write("<br />" + js.data);
                Response.Write("<br />评论" + BComment.Count("3bfafcaf-1b49-4a2f-81d5-f8347b935781",评论类型.住宿));
            }
            else { Response.Write("null"); }
        }
    }
}