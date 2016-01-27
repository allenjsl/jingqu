using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public class BQA
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ListApiUrl = RemoteDomain + "/Tywqanda/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywqandaDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywqandaDTO>.SearchPage(ListApiUrl, pi);
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
        public static List<TywqandaDTO> GetList(PageInfo pi, ref int TotalRows)
        {
            TotalRows = 0;
            var Result = APIOP<TywqandaDTO>.SearchPage(ListApiUrl, pi);
            if (Result.total > 0)
            {
                if (Result.data != null)
                {
                    TotalRows = Result.total;
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
        public static TywqandaDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywqanda/GetById/" + Id;
            var result = APIOP<TywqandaDTO>.GetModel(ModelApiUrl);
            if (result.flag)
            {
                if (result.data != null)
                    return result.data;
                else
                    return null;
            }
            else { return null; }
        }
        /// <summary>
        /// 添加
        /// </summary>
        public static bool Add(TywqandaDTO model)
        {
            var result = APIOP<TywqandaDTO>.Add(RemoteDomain + "/Tywqanda/Add", model);
            return result.flag;
        }
    }
}
