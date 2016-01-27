using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public enum 游记类型
    {
        普通 = 1,
        精品
    }
    public class BBlog
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Tywtravelguide/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywtravelguideDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywtravelguideDTO>.SearchPage(ApiUrl, pi);
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
        public static List<TywtravelguideDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<TywtravelguideDTO>.SearchPage(ApiUrl, pi);
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
        public static bool Add(TywtravelguideDTO model)
        {
            var result = APIOP<TywtravelguideDTO>.Add(RemoteDomain + "/Tywtravelguide/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static TywtravelguideDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywtravelguide/GetById/" + Id;
            var result = APIOP<TywtravelguideDTO>.GetModel(ModelApiUrl);
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
        public static TywtravelguideDTO GetNextModel(int Target, DateTime CreateDate)
        {
            if (CreateDate != null)
            {
                PageInfo pi = new PageInfo();
                pi.PageIndex = 1;
                pi.PageSize = 1;
                pi.AddCondition<TywtravelguideDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
                pi.AddCondition<TywtravelguideDTO>(o => o.is_valid, 1, QueryMethod.Equal);
                pi.AddCondition<TywtravelguideDTO>(o => o.create_date, CreateDate, QueryMethod.GreaterThan);
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
        public static TywtravelguideDTO GetPreModel(int Target, DateTime CreateDate)
        {
            if (CreateDate != null)
            {
                PageInfo pi = new PageInfo();
                pi.PageIndex = 1;
                pi.PageSize = 1;
                pi.AddCondition<TywtravelguideDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
                pi.AddCondition<TywtravelguideDTO>(o => o.is_valid, 1, QueryMethod.Equal);
                pi.AddCondition<TywtravelguideDTO>(o => o.create_date, CreateDate, QueryMethod.LessThan);
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
