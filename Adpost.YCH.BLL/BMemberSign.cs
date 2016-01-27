using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 会员签到
    /// </summary>
    public class BMemberSign
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Mbmembersign/SearchPage";
        /// <summary>
        /// 判断会员当天是否签到
        /// </summary>
        /// <param name="MemberId"></param>
        /// <returns></returns>
        public static bool IsSign(string MemberId)
        {
            string ApiUrl = RemoteDomain + "/Mbmembersign/SearchSingleData";
            
            var strJson = new Dictionary<string, object>()
                {
                    {"memberid",MemberId}
                };
            var Result = APIOP<MbmembersignDTO>.SearchSingleData(ApiUrl, strJson);
            if (Result.flag)
            {
                if (Result.data != null)
                    return true;
                else
                    return false;
            }
            else { return false; }
        }
        /// <summary>
        /// 添加签到
        /// </summary>
        public static bool Add(MbmembersignDTO model)
        {
            var result = APIOP<MbmembersignDTO>.Add(RemoteDomain + "/Mbmembersign/Add", model);
            if (result.flag)
            {
                //写会员积分
                BMemberIntegral.Add(new MbmemberintegralchangeDTO
                {
                    id = System.Guid.NewGuid().ToString(),
                    billtype = (int)订单类型.签到,
                    objid = System.Guid.NewGuid().ToString(),
                    memberid = model.memberid,
                    innum = 1,
                    absract = "签到获得1积分",
                    year_num = DateTime.Now.Year,
                    currentdate = DateTime.Now,
                    create_date = DateTime.Now
                });
            }
            return result.flag;
        }
        /// <summary>
        /// 取得签到信息列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<MbmembersignDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<MbmembersignDTO>.SearchPage(ApiUrl, pi);
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
        /// 取得签到信息列表
        /// </summary>
        /// <param name="MemberId"></param>
        /// <param name="CurrencyPage"></param>
        /// <param name="PageSize"></param>
        /// <returns></returns>
        public static List<MbmembersignDTO> GetList(string MemberId, int CurrencyPage, int PageSize)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            pi.AddCondition<MbmembersignDTO>(o => o.memberid, MemberId, QueryMethod.Equal);
            pi.OrderBy.Add("signdate", OrderByType.Desc);
            return GetList(pi);
        }
    }
}
