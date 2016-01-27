using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 我的活动
    /// </summary>
    public class BMyActivities {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Mbmyactivities/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<MbmyactivitiesDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<MbmyactivitiesDTO>.SearchPage(ApiUrl, pi);
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
        public static List<MbmyactivitiesDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<MbmyactivitiesDTO>.SearchPage(ApiUrl, pi);
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
        /// 参加活动
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static bool Add(MbmyactivitiesDTO model)
        {
            var result = APIOP<MbmyactivitiesDTO>.Add(RemoteDomain + "/Mbmyactivities/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static MbmyactivitiesDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Mbmyactivities/GetById/" + Id;
            var result = APIOP<MbmyactivitiesDTO>.GetModel(ModelApiUrl);
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
    /// <summary>
    /// 活动
    /// </summary>
    public class BActivities
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Cptoutactivities/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<CptoutactivitiesDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<CptoutactivitiesDTO>.SearchPage(ApiUrl, pi);
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
        public static List<CptoutactivitiesDTO> GetList(PageInfo pi,ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<CptoutactivitiesDTO>.SearchPage(ApiUrl, pi);
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
        public static CptoutactivitiesDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Cptoutactivities/GetById/" + Id;
            var result = APIOP<CptoutactivitiesDTO>.GetModel(ModelApiUrl);
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
        /// 取得后一条记录
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static CptoutactivitiesDTO GetNextModel(int Target, DateTime CreateDate, bool IsOpen)
        {
            if (CreateDate != null)
            {
                PageInfo pi = new PageInfo();
                pi.PageIndex = 1;
                pi.PageSize = 1;
                pi.AddCondition<CptoutactivitiesDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
                pi.AddCondition<CptoutactivitiesDTO>(o => o.is_valid, 1, QueryMethod.Equal);
                if (IsOpen)
                {
                    //有效活动
                    DateTime cDate = DateTime.Now;
                    pi.AddCondition<CptoutactivitiesDTO>(o => o.act_startdate, cDate, QueryMethod.LessThanOrEqual);
                    pi.AddCondition<CptoutactivitiesDTO>(o => o.act_enddate, cDate, QueryMethod.GreaterThan);
                }
                else
                {
                    //已结束活动
                    DateTime cDate = DateTime.Now;
                    pi.AddCondition<CptoutactivitiesDTO>(o => o.act_enddate, cDate, QueryMethod.LessThanOrEqual);
                }
                pi.AddCondition<CptoutactivitiesDTO>(o => o.create_date, CreateDate, QueryMethod.GreaterThan);
                pi.OrderBy.Add("create_date", OrderByType.Asc);
                var list = GetList(pi);
                if (list != null && list.Count() > 0)
                {
                    return list[0];
                }
                else { return null; }
            }
            else { return null; }
        }
        /// <summary>
        /// 取得前一条记录
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static CptoutactivitiesDTO GetPreModel(int Target, DateTime CreateDate, bool IsOpen)
        {
            if (CreateDate != null)
            {
                PageInfo pi = new PageInfo();
                pi.PageIndex = 1;
                pi.PageSize = 1;
                pi.AddCondition<CptoutactivitiesDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
                pi.AddCondition<CptoutactivitiesDTO>(o => o.is_valid, 1, QueryMethod.Equal);
                if (IsOpen)
                {
                    //有效活动
                    DateTime cDate = DateTime.Now;
                    pi.AddCondition<CptoutactivitiesDTO>(o => o.act_startdate, cDate, QueryMethod.LessThanOrEqual);
                    pi.AddCondition<CptoutactivitiesDTO>(o => o.act_enddate, cDate, QueryMethod.GreaterThan);
                }
                else
                {
                    //已结束活动
                    DateTime cDate = DateTime.Now;
                    pi.AddCondition<CptoutactivitiesDTO>(o => o.act_enddate, cDate, QueryMethod.LessThanOrEqual);
                }
                pi.AddCondition<CptoutactivitiesDTO>(o => o.create_date, CreateDate, QueryMethod.LessThan);
                pi.OrderBy.Add("create_date", OrderByType.Desc);
                var list = GetList(pi);
                if (list != null && list.Count() > 0)
                {
                    return list[0];
                }
                else { return null; }
            }
            else { return null; }
        }
    }
}
