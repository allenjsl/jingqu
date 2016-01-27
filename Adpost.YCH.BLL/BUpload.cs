using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
using YCH.DataCenter.DTO;
using System.Web;
using Newtonsoft.Json;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 文件上传
    /// </summary>
    public class BUpload
    {
        private static string UploadDomainFix = System.Configuration.ConfigurationManager.AppSettings["UploadFileDomain"];
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        private static string UploadApiUrl = RemoteDomain + "/File/Upload";
        private static string UploadDomain = UploadDomainFix + "";
        /// <summary>
        /// 远程单文件上传
        /// </summary>
        /// <param name="UploadFile"></param>
        /// <returns></returns>
        public static string FileRemoteUpload(HttpPostedFile UploadFile)
        {
            HttpClient client = new HttpClient();
            var list = new List<UploadFileInfoDTO>();
            var byteData = new byte[UploadFile.InputStream.Length];
            UploadFile.InputStream.Read(byteData, 0, byteData.Length);
            list.Add(new UploadFileInfoDTO() { FileBody = byteData, Extension = System.IO.Path.GetExtension(UploadFile.FileName) });
            var strJson = list.ToJSON_Newtonsoft();
            HttpContent httpContent = new StringContent(strJson);
            httpContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/json");
            var str = client.PostAsync(UploadApiUrl, httpContent).Result.Content.ReadAsStringAsync().Result;
            //"{\"data\":[\"/Attachment/2014-08-26/7052482c-29d7-452c-8f7d-d4017fc36235.jpg\"],\"code\":null,\"msg\":\"上传成功！\",\"flag\":true}"
            ApiResult<string[]> result = JsonConvert.DeserializeObject<ApiResult<string[]>>(str);
            if (result.flag)
                return UploadDomain+result.data[0];
            else 
                return null;
        }
    }
}
