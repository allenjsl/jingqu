using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public class BVideo
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Tywvideos/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywvideosDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywvideosDTO>.SearchPage(ApiUrl, pi);
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
        public static List<TywvideosDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<TywvideosDTO>.SearchPage(ApiUrl, pi);
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
        public static TywvideosDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywvideos/GetById/" + Id;
            var result = APIOP<TywvideosDTO>.GetModel(ModelApiUrl);
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
        /// 取得第一个视频
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static TywvideosDTO GetLastModel(int Target)
        {
            PageInfo pi = new PageInfo();
            pi.PageSize = 1;
            pi.PageIndex = 1;
            pi.AddCondition<TywvideosDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywvideosDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var Result = APIOP<TywvideosDTO>.SearchPage(ApiUrl, pi);
            if (Result.total > 0)
            {
                if (Result.data != null)
                {
                    return Result.data[0];
                }
                else { return null; }
            }
            else { return null; }
        }
    }
}
