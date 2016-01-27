using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 站点访问量
    /// </summary>
    public class BPageviewinfo
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Statpageviewinfo/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<StatpageviewinfoDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<StatpageviewinfoDTO>.SearchPage(ApiUrl, pi);
            if (Result.total > 0)
            {
                if (Result.data != null)
                {
                    return Result.data;
                }
                else { return null; }
            }
            else { return null; }
        }
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<StatpageviewinfoDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<StatpageviewinfoDTO>.SearchPage(ApiUrl, pi);
            if (Result.total > 0)
            {
                if (Result.data != null)
                {
                    TotalRowsCount = Result.total;
                    return Result.data;
                }
                else { return null; }
            }
            else { return null; }
        }
        /// <summary>
        /// 添加
        /// </summary>
        public static bool Add(StatpageviewinfoDTO model)
        {
            var result = APIOP<StatpageviewinfoDTO>.Add(RemoteDomain + "/Statpageviewinfo/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static StatpageviewinfoDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Statpageviewinfo/GetById/" + Id;
            var result = APIOP<StatpageviewinfoDTO>.GetModel(ModelApiUrl);
            if (result.flag)
            {
                if (result.data != null)
                    return result.data;
                else
                    return null;
            }
            else { return null; }
        }
    }
}
