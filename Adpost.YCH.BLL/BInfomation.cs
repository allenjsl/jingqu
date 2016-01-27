using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public enum 资讯类别
    {
        新闻资讯=1,
        最新资讯,
        通知公告
    }
    public class BInfomation
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 新闻资讯列表
        /// </summary>
        private static string InfomationApiUrl = RemoteDomain + "/Tywinformation/SearchPage";
        /// <summary>
        /// 取得新闻列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywinformationDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywinformationDTO>.SearchPage(InfomationApiUrl, pi);
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
        /// 取得新闻列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywinformationDTO> GetList(PageInfo pi,ref int TotalRows)
        {
            TotalRows = 0;
            var Result = APIOP<TywinformationDTO>.SearchPage(InfomationApiUrl, pi);
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
        public static TywinformationDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywinformation/GetById/" + Id;
            var result = APIOP<TywinformationDTO>.GetModel(ModelApiUrl);
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
