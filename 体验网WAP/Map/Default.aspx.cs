using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Xml;

namespace ychmap
{
    public partial class _Default : System.Web.UI.Page
    {
        protected string SystemControlDomain = System.Configuration.ConfigurationManager.AppSettings["SystemControlDomain"];
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //WebRequest myrequest = WebRequest.Create("http://cms.weyoo.cn/" + id + ".xml?" + Math.Round(100000.0));
                WebRequest myrequest = WebRequest.Create("http://drore.weyoo.cn/xml/2771/labels.xml");
                WebResponse myresponse = myrequest.GetResponse();
                Stream stream = myresponse.GetResponseStream();
                XmlDocument doc = new XmlDocument();
                doc.Load(stream);
                //XmlNodeList nodes = doc.SelectNodes("/xml/sign/logo");
                XmlNodeList nodes = doc.SelectNodes("/labels/label");
                if (nodes.Count > 0)
                {
                    System.Text.StringBuilder html = new System.Text.StringBuilder();
                    for (int i = 0; i < nodes.Count; i++)
                    {
                        //html.Append("{'name':'" + nodes[i].Attributes["name"].Value + "','id':'" + nodes[i].Attributes["id"].Value + "','x':'" + nodes[i].Attributes["x"].Value + "','y':'" + nodes[i].Attributes["y"].Value + "','type':'" + nodes[i].Attributes["type"].Value + "','src':'" + nodes[i].Attributes["src"].Value + "','enabled':'" + nodes[i].Attributes["enabled"].Value + "'},");
                        html.Append("{'name':'" + nodes[i].Attributes["name"].Value + "','id':'" + nodes[i].Attributes["key"].Value + "','x':'" + nodes[i].Attributes["x"].Value + "','y':'" + nodes[i].Attributes["y"].Value + "','type':'" + nodes[i].Attributes["type"].Value + "','src':'" + nodes[i].Attributes["src"].Value + "','enabled':'" + nodes[i].Attributes["enabled"].Value + "'},");
                    }
                    string r = html.ToString().Remove(html.Length - 1, 1);
                    Response.Write("<script>var pointlist=[{'result':'1'}," + r + "]</script>");
                }
                else
                {
                    Response.Write("<script>var pointlist=[{'result':'0'}]</script>");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>var pointlist=[{'result':'-1'}]</script>");
            }
        }
    }
}
