using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    #region 调查问卷
    /// <summary>
    /// 调查问卷
    /// </summary>
    public class BQuestionnaire
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ListApiUrl = RemoteDomain + "/Tywquestionnairemain/SearchPage";
        private static string ItemListAPiUrl = RemoteDomain + "/Tywquestionnairesubject/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywquestionnairemainDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywquestionnairemainDTO>.SearchPage(ListApiUrl, pi);
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
        public static List<TywquestionnairemainDTO> GetList(PageInfo pi, ref int TotalRows)
        {
            TotalRows = 0;
            var Result = APIOP<TywquestionnairemainDTO>.SearchPage(ListApiUrl, pi);
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
        /// 取得调查内容子项列表
        /// </summary>
        /// <param name="qid"></param>
        /// <returns></returns>
        public static List<TywquestionnairesubjectDTO> GetList(string qid)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 99;
            pi.AddCondition<TywquestionnairesubjectDTO>(o => o.qid, qid, QueryMethod.Equal);

            var Result = APIOP<TywquestionnairesubjectDTO>.SearchPage(ItemListAPiUrl, pi);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static TywquestionnairemainDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Tywquestionnairemain/GetById/" + Id;
            var result = APIOP<TywquestionnairemainDTO>.GetModel(ModelApiUrl);
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
        /// 新增问卷提交
        /// </summary>
        public static bool AddReply(TywquestionnairereplyDTO model)
        {
            var result = APIOP<TywquestionnairereplyDTO>.Add(RemoteDomain + "/Tywquestionnairereply/Add", model);
            return result.flag;
        }
    }
    #endregion
}
