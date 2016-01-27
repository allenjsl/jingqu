using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using YCH.DataCenter.DTO.Base;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public enum 留言类型
    {
        投诉=1,
        建议=2
    }
    /// <summary>
    /// 留言
    /// </summary>
    public class BBasehotspotopinion
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ListApiUrl = RemoteDomain + "/Basehotspotopinion/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<BasehotspotopinionDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<BasehotspotopinionDTO>.SearchPage(ListApiUrl, pi);
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
        public static List<BasehotspotopinionDTO> GetList(PageInfo pi, ref int TotalRows)
        {
            TotalRows = 0;
            var Result = APIOP<BasehotspotopinionDTO>.SearchPage(ListApiUrl, pi);
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
        /// 新增
        /// </summary>
        public static bool Add(BasehotspotopinionDTO model)
        {
            var result = APIOP<BasehotspotopinionDTO>.Add(RemoteDomain + "/Basehotspotopinion/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static BasehotspotopinionDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Basehotspotopinion/GetById/" + Id;
            var result = APIOP<BasehotspotopinionDTO>.GetModel(ModelApiUrl);
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
