using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using YCH.DataCenter.DTO.Base;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public enum 评论类型
    {
        景区 = 1,
        景点,
        美食,
        购物,
        娱乐,
        住宿,
        光影,
        游记
    }

    /// <summary>
    /// 评论
    /// </summary>
    public class BComment
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Tywcomment/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywcommentDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywcommentDTO>.SearchPage(ApiUrl, pi);
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
        public static List<TywcommentDTO> GetList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<TywcommentDTO>.SearchPage(ApiUrl, pi);
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
        public static bool Add(TywcommentDTO model)
        {
            var result = APIOP<TywcommentDTO>.Add(RemoteDomain + "/Tywcomment/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static TywcommentDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywcomment/GetById/" + Id;
            var result = APIOP<TywcommentDTO>.GetModel(ModelApiUrl);
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
        /// 根据编号统计收藏数
        /// </summary>
        /// <param name="CollectId"></param>
        /// <returns></returns>
        public static string Count(string Id,评论类型 CommentType)
        {
            string ModelApiUrl = RemoteDomain + "//StatisticalAnalysis/StatCommentNumByObjID?objID=" + Id + "&objType=" + Convert.ToInt32(CommentType);
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
    }
}
