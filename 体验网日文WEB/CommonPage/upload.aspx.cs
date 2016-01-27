using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.Utility;
using System.Net.Http;
using System.IO;
using YCH.DataCenter.DTO;

namespace Adpost.YCH.WEB.CommonPage
{
    public partial class upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get the Upload File Type.
            string fileType = Utils.GetFormValue("filetype");
            string IsThumbnail = Utils.GetFormValue("IsThumbnail");
            string ThumbnailType = Utils.GetFormValue("ThumbnailType");
            int ThumbnailWidth = Utils.GetInt(Utils.GetFormValue("ThumbnailWidth"));
            int ThumbnailHeight = Utils.GetInt(Utils.GetFormValue("ThumbnailHeight"));
            if (IsThumbnail != "1")
                IsThumbnail = "0";
            if (!String.IsNullOrEmpty(ThumbnailType))
                ThumbnailType = "W";
            if (ThumbnailWidth == 0)
                ThumbnailWidth = 60;
            if (ThumbnailHeight == 0)
                ThumbnailHeight = 60;
            // Get the file data.
            
            HttpPostedFile image_upload = Request.Files["Filedata"];

            if (image_upload == null || image_upload.ContentLength <= 0)
            {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'上传的文件为空'}");
                Response.End();
            }

            else if (image_upload.ContentLength > 52428800)
            {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'上传的文件超过了指定的大小'}");
                Response.End();
            }

            string fileExt = System.IO.Path.GetExtension(image_upload.FileName);
            string fileName = Utils.GenerateFileName(fileExt);
            // 允许上传的文件格式
            string[] fileTypeList = new[] { ".xls", ".rar", ".pdf", ".doc", ".swf", ".jpg", ".gif", ".jpeg", ".png", ".dot" };
            if (!fileTypeList.Contains(fileExt.ToLower()))
            {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'文件格式错误!'}");
                Response.End();
            }

            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            #region 本地文件保存
            /*
            //原图完整路径
            string relativePath = "/UploadFiles/" + year + "/" + month + "/" + fileName;
            //原图文件夹
            string relativeDirPath = "/UploadFiles/" + year + "/" + month + "/";

            string desFilePath = Server.MapPath(relativePath);
            string desDirPath = Server.MapPath(relativeDirPath);

            if (!Directory.Exists(desDirPath))
            {
                Directory.CreateDirectory(desDirPath);
            }
            image_upload.SaveAs(desFilePath);
            //自动缩略
            if (IsThumbnail == "1")
            {
                ThumbnailModel tm = ThumbnailModel.W;
                switch (ThumbnailType)
                {
                    case "HW":
                        tm = ThumbnailModel.HW;
                        break;
                    case "H":
                        tm = ThumbnailModel.H;
                        break;
                    case "Cut":
                        tm = ThumbnailModel.Cut;
                        break;
                }
                Thumbnail.MakeThumbnail(Server.MapPath(relativePath), Server.MapPath(relativeDirPath + "S_" + fileName), ThumbnailWidth, ThumbnailHeight, tm);
            }
            */
#endregion
            var RemoteFileName = Adpost.YCH.BLL.BUpload.FileRemoteUpload(image_upload);
            if (RemoteFileName != null) { 
            Response.Clear();

            Response.StatusCode = 200;

            Response.Write("{\"fileid\":\"" + image_upload.FileName + "|" + RemoteFileName + "\"}");
            Response.End();
            }
            else {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'上传到数据中心发生错误!'}");
                Response.End();
            }
        }        
    }
}