using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public enum 收藏类别
    {
        新闻资讯,
        通知公告,
        特色活动,
        光影记录,
        旅游攻略,
        半岛游记,
        线路推荐,
        景点推荐,
        美食推荐,
        酒店推荐,
        购物推荐,
        娱乐推荐
    }
    public class BMycollect
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        #region 收藏
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Mbmycollect/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<MbmycollectDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<MbmycollectDTO>.SearchPage(ApiUrl, pi);
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
        public static List<MbmycollectDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<MbmycollectDTO>.SearchPage(ApiUrl, pi);
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
        /// 收藏 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static bool CollectAdd(MbmycollectDTO model)
        {
            var result = APIOP<MbmycollectDTO>.Add(RemoteDomain + "/Mbmycollect/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static MbmycollectDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Mbmycollect/GetById/" + Id;
            var result = APIOP<MbmycollectDTO>.GetModel(ModelApiUrl);
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
        public static bool Delete(string[] Ids)
        {
            var result = APIOP<MbmycollectDTO>.Delete(RemoteDomain + "/Mbmycollect/Delete", Ids);
            return result.flag;
        }
        /// <summary>
        /// 根据编号统计收藏数
        /// </summary>
        /// <param name="CollectId"></param>
        /// <returns></returns>
        public static string Count(string CollectId) {
            string ModelApiUrl = RemoteDomain + "/StatisticalAnalysis/StatCollectNumByObjID?objID=" + CollectId;
            var result = APIOP<string>.GetModel(ModelApiUrl);
            if (result.flag)
            {
                if (result.data != null)
                    return result.data;
                else
                    return "0";
            }
            else { return "0"; }
        }
        #endregion
    }
}
