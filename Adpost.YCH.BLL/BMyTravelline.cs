using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 行程定制
    /// </summary>
    public class BMyTravelline
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Tywmytravelline/SearchPage";
        /// <summary>
        /// 取得线路详情
        /// </summary>
        /// <param name="lineId"></param>
        /// <returns></returns>
        public static List<TywmytravellineDTO> GetList(int Target,string lineId,int Days)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            //pi.AddCondition<TywmytravellineDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywmytravellineDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.AddCondition<TywmytravellineDTO>(o => o.uid, lineId, QueryMethod.Equal);
            pi.AddCondition<TywmytravellineDTO>(o => o.days, Days, QueryMethod.Equal);
            pi.OrderBy.Add("ordernum", OrderByType.Asc);
            var Result = APIOP<TywmytravellineDTO>.SearchPage(ApiUrl, pi);
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
        public static List<TywmytravellineDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywmytravellineDTO>.SearchPage(ApiUrl, pi);
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
        public static List<TywmytravellineDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<TywmytravellineDTO>.SearchPage(ApiUrl, pi);
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
        public static bool Add(TywmytravellineDTO model)
        {
            var result = APIOP<TywmytravellineDTO>.Add(RemoteDomain + "/Tywmytravelline/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static TywmytravellineDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywmytravelline/GetById/" + Id;
            var result = APIOP<TywmytravellineDTO>.GetModel(ModelApiUrl);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static TywmytravellineDTO GetLastModel(string Id)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 1;
            pi.AddCondition<TywmytravellineDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.AddCondition<TywmytravellineDTO>(o => o.uid, Id, QueryMethod.Equal);
            pi.OrderBy.Add("ordernum", OrderByType.Desc);
            var Result = APIOP<TywmytravellineDTO>.SearchPage(ApiUrl, pi);
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
        /// <summary>
        /// 删除
        /// </summary>
        public static bool Delete(string[] Ids)
        {
            var result = APIOP<TywmytravellineDTO>.Delete(RemoteDomain + "/Tywmytravelline/Delete", Ids);
            return result.flag;
        }
    }
}
