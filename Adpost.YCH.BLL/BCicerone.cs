using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;
using System.Text;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 导游
    /// </summary>
    public class BCicerone
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Basecicerone/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<BaseciceroneDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<BaseciceroneDTO>.SearchPage(ApiUrl, pi);
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
        public static List<BaseciceroneDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<BaseciceroneDTO>.SearchPage(ApiUrl, pi);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static BaseciceroneDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Basecicerone/GetById/" + Id;
            var result = APIOP<BaseciceroneDTO>.GetModel(ModelApiUrl);
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
