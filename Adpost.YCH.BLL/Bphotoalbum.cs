using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 光影记录
    /// </summary>
    public class Bphotoalbum
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Tywphotoalbum/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywphotoalbumDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywphotoalbumDTO>.SearchPage(ApiUrl, pi);
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
        public static List<TywphotoalbumDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<TywphotoalbumDTO>.SearchPage(ApiUrl, pi);
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
        public static bool Add(TywphotoalbumDTO model)
        {
            var result = APIOP<TywphotoalbumDTO>.Add(RemoteDomain + "/Tywphotoalbum/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static TywphotoalbumDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywphotoalbum/GetById/" + Id;
            var result = APIOP<TywphotoalbumDTO>.GetModel(ModelApiUrl);
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
        /// 删除
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static bool Delete(string[] ids)
        {
            var result = APIOP<TywphotoalbumDTO>.Delete(RemoteDomain + "/Tywphotoalbum/Delete", ids);
            return result.flag;
        }
    }
}
