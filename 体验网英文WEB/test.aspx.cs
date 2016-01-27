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
            string ModelApiUrl = RemoteDomain + "/Hotspot/GetByID?hotspotId=0f7fc0a4-115e-419a-b57d-f1f096ff5492";
            var model = client.GetAsync(ModelApiUrl).Result.Content.ReadAsStringAsync().Result;
            if (model != null) {
                Response.Write(model);
                var js = JsonConvert.DeserializeObject<Adpost.YCH.BLL.ApiResult<dynamic>>(model);
                Response.Write("<br />" + js.data.hotspot_name);
            }
            else { Response.Write("null"); }
        }
    }
}