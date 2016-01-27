using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 会员积分
    /// </summary>
    public class BMemberIntegral
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        #region 会员积分信息
        /// <summary>
        /// 取得会员积分统计信息 //memberid = memberid, yearNum = yearNum, remainIntegral = memberIntegral.integral, outIntegral = outVal
        /// </summary>
        /// <param name="MemberId"></param>
        /// <param name="Year">年份</param>
        /// <returns></returns>
        public static dynamic GetMemberInteral(string MemberId, int Year)
        {
            string ApiUrl = RemoteDomain + "/Mbmemberintegral/GetMemberIntegralStat?memberid=" + MemberId + "&yearNum=" + Year;
            var Result = APIOP<dynamic>.GetModel(ApiUrl);
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
        /// 取得会员积分
        /// </summary>
        /// <param name="MemberId"></param>
        /// <returns></returns>
        public static decimal GetMemberInteral(string MemberId)
        {
            string ApiUrl = RemoteDomain + "/Mbmemberintegral/GetMemberAvailableIntegral?menberid=" + MemberId;
            var Result = APIOP<decimal>.GetModel(ApiUrl);
            if (Result.flag)
            {
                return Result.data;
            }
            else { return 0; }
        }
        #endregion
        #region 积分流水
        /// <summary>
        /// 列表
        /// </summary>
        private static string ApiUrl = RemoteDomain + "/Mbmemberintegralchange/SearchPage";
        /// <summary>
        /// 判断订单积分是否存在
        /// </summary>
        /// <param name="ordertype">订单类型</param>
        /// <param name="OrderId">订单编号</param>
        /// <returns></returns>
        public static bool IsExist(int ordertype,string OrderId)
        {
            string ApiUrl = RemoteDomain + "/Mbmemberintegral/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"billtype",ordertype},
                    {"objid",OrderId}
                };
            var Result = APIOP<MbmemberintegralchangeDTO>.SearchSingleData(ApiUrl, strJson);
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
        /// 积分添加
        /// </summary>
        public static bool Add(MbmemberintegralchangeDTO model)
        {
            List<MbmemberintegralchangeDTO> list = new List<MbmemberintegralchangeDTO>();
            list.Add(model);
            var result = APIOP<List<MbmemberintegralchangeDTO>>.Add(RemoteDomain + "/Mbmemberintegral/ChangeMemberIntegral", list);
            return result.flag;
        }
        /// <summary>
        /// 取得积分信息列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<MbmemberintegralchangeDTO> GetList(PageInfo pi, ref int TotalRows)
        {
            var Result = APIOP<MbmemberintegralchangeDTO>.SearchPage(ApiUrl, pi);
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
        #endregion
    }
}
