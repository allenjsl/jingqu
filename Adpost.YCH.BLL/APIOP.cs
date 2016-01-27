using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    #region API 接口实现类
    /// <summary>
    /// 返回单个实体信息
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class ApiResult<T>
    {
        public T data { get; set; }
        public string code { get; set; }
        public string msg { get; set; }
        public bool flag { get; set; }
    }
    /// <summary>
    /// 返回集合列表
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class ApiListResult<T>
    {        
        public int pageIndex { get; set; }
        public int pageSize { get; set; }
        public int pageCount { get; set; }
        public int total { get; set; }
        /// <summary>
        /// 数据
        /// </summary>
        public List<T> data { get; set; }
    }
    /// <summary>
    /// 接口API操作类
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class APIOP<T>
    {
        #region 远程接口调用方法
        /// <summary>
        /// 添加接口
        /// </summary>
        /// <param name="ApiUrl"></param>
        /// <param name="t"></param>
        /// <returns></returns>
        public static ApiResult<T> Add(string ApiUrl, T t)
        {
            HttpClient client = new HttpClient();
            var strJson = t.ToJSON_Newtonsoft();
            HttpContent httpContent = new StringContent(strJson);
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var str = client.PostAsync(ApiUrl, httpContent).Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<ApiResult<T>>(str);
        }
        /// <summary>
        /// 修改接口
        /// </summary>
        /// <param name="ApiUrl"></param>
        /// <param name="t"></param>
        /// <returns></returns>
        public static ApiResult<T> Update(string ApiUrl, T t)
        {
            HttpClient client = new HttpClient();
            var strJson = t.ToJSON_Newtonsoft();
            HttpContent httpContent = new StringContent(strJson);
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var str = client.PostAsync(ApiUrl, httpContent).Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<ApiResult<T>>(str);
        }
        /// <summary>
        /// 删除接口
        /// </summary>
        /// <param name="ApiUrl"></param>
        /// <param name="t"></param>
        /// <returns></returns>
        public static ApiResult<T> Delete(string ApiUrl, string[] Ids)
        {
            HttpClient client = new HttpClient();
            var strJson = Ids.ToJSON_Newtonsoft();
            HttpContent httpContent = new StringContent(strJson);
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var str = client.PostAsync(ApiUrl, httpContent).Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<ApiResult<T>>(str);
        }
        
        /// <summary>
        /// 取得内容
        /// </summary>
        /// <param name="ApiUrl"></param>
        /// <returns></returns>
        public static ApiResult<T> GetModel(string ApiUrl)
        {
            HttpClient client = new HttpClient();
            return JsonConvert.DeserializeObject<ApiResult<T>>(client.GetAsync(ApiUrl).Result.Content.ReadAsStringAsync().Result);
        }
        /// <summary>
        /// 取得最大序数
        /// </summary>
        /// <param name="ApiUrl"></param>
        /// <returns></returns>
        public static int GetMaxSerialNumber(string ApiUrl)
        {
            HttpClient client = new HttpClient();
            string sn = client.GetAsync(ApiUrl).Result.Content.ReadAsStringAsync().Result;
            if (!String.IsNullOrWhiteSpace(sn))
                return Convert.ToInt32(sn);
            else
                return 0;
        }
        /// <summary>
        /// 单项目搜索
        /// </summary>
        /// <param name="ApiUrl"></param>
        /// <param name="searchDic"></param>
        /// <returns></returns>
        public static ApiResult<T> SearchSingleData(string ApiUrl, Dictionary<string, object> searchDic)
        {
            HttpClient client = new HttpClient();
            var strJson = searchDic.ToJSON_Newtonsoft();
            HttpContent httpContent = new StringContent(strJson);
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var strResult = client.PostAsync(ApiUrl, httpContent).Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<ApiResult<T>>(strResult);
        }
        /// <summary>
        /// 分页搜索
        /// </summary>
        /// <param name="ApiUrl"></param>
        /// <param name="searchPageInfo"></param>
        /// <returns></returns>
        public static ApiListResult<T> SearchPage(string ApiUrl, PageInfo searchPageInfo)
        {
            HttpClient client = new HttpClient();
            var strJson = searchPageInfo.ToJSON_Newtonsoft();
            HttpContent httpContent = new StringContent(strJson);
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var v = client.PostAsync(ApiUrl, httpContent).Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<ApiListResult<T>>(v);
        }
        #endregion
    }
    #endregion
}
