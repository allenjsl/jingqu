using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;

namespace Adpost.YCH.BLL
{
    public enum 第三方登陆类型
    {
        QQ,
        微博,
        百度,
        微信
    }
    public class BMember
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        #region 第三方登陆
        /// <summary>
        /// 判断用户名是否被注册
        /// </summary>
        /// <param name="UserName"></param>
        /// <returns>true:被占用 false:未被占用</returns>
        public static bool IsExist(第三方登陆类型 type,string OpenId)
        {
            string ApiUrl = RemoteDomain + "/Mbmember/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"hzwzlx",type.ToString()},
                    {"wzid",OpenId}
                };
            var Result = APIOP<MbmemberDTO>.SearchSingleData(ApiUrl, strJson);
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
        /// true:登陆成功 false:登陆失败
        /// </summary>
        /// <param name="type"></param>
        /// <param name="OpenId"></param>
        /// <returns>true:登陆成功 false:登陆失败</returns>
        public static MbmemberDTO Login(第三方登陆类型 type, string OpenId)
        {
            string ApiUrl = RemoteDomain + "/Mbmember/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"hzwzlx",type.ToString()},
                    {"wzid",OpenId}
                };
            var Result = APIOP<MbmemberDTO>.SearchSingleData(ApiUrl, strJson);
            if (Result.flag)
            {
                if (Result.data != null)
                    return Result.data;
                else
                    return null;
            }
            else { return null; }
        }
        #endregion
        #region 注册 登陆
        /// <summary>
        /// 判断用户名是否被注册
        /// </summary>
        /// <param name="UserName"></param>
        /// <returns>true:被占用 false:未被占用</returns>
        public static bool IsExist(string UserName) {
            string ApiUrl = RemoteDomain + "/Mbmember/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"user_name",UserName}
                };
            var Result = APIOP<MbmemberDTO>.SearchSingleData(ApiUrl, strJson);
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
        /// 判断用户名是否被注册
        /// </summary>
        /// <param name="UserName"></param>
        /// <returns>true:被占用 false:未被占用</returns>
        public static bool IsEmailExist(string Email)
        {
            string ApiUrl = RemoteDomain + "/Mbmember/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"mail",Email}
                };
            var Result = APIOP<MbmemberDTO>.SearchSingleData(ApiUrl, strJson);
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
        /// 判断用户手机是否被注册
        /// </summary>
        /// <param name="MobilePhone"></param>
        /// <returns>true:被占用 false:未被占用</returns>
        public static bool IsMobilePhoneExist(string MobilePhone)
        {
            string ApiUrl = RemoteDomain + "/Mbmember/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"phone",MobilePhone}
                };
            var Result = APIOP<MbmemberDTO>.SearchSingleData(ApiUrl, strJson);
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
        /// 会员注册
        /// </summary>
        public static bool Add(MbmemberDTO model)
        {
            var result = APIOP<MbmemberDTO>.Add(RemoteDomain + "/Mbmember/Add", model);
            return result.flag;
        }
        /// <summary>
        /// 会员注册
        /// </summary>
        public static bool Update(MbmemberDTO model)
        {
            var result = APIOP<MbmemberDTO>.Update(RemoteDomain + "/Mbmember/Update", model);
            return result.flag;
        }
        /// <summary>
        /// 用户登陆
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="Password"></param>
        /// <returns>true:登陆成功 false:登陆失败</returns>
        public static MbmemberDTO Login(string UserName, string Password)
        {
            string ApiUrl = RemoteDomain + "/Mbmember/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"user_name",UserName},
                    {"password",Password}
                };
            var Result = APIOP<MbmemberDTO>.SearchSingleData(ApiUrl, strJson);
            if (Result.flag)
            {
                if (Result.data != null)
                    return Result.data;
                else
                    return null;
            }
            else { return null; }
        }
        /// <summary>
        /// 用户邮箱验证
        /// </summary>
        /// <param name="Email"></param>
        /// <returns></returns>
        public static MbmemberDTO CheckEmail(string Email)
        {
            string ApiUrl = RemoteDomain + "/Mbmember/SearchSingleData";
            var strJson = new Dictionary<string, object>()
                {
                    {"mail",Email}
                };
            var Result = APIOP<MbmemberDTO>.SearchSingleData(ApiUrl, strJson);
            if (Result.flag)
            {
                if (Result.data != null)
                    return Result.data;
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
        public static MbmemberDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Mbmember/GetById/" + Id;
            var result = APIOP<MbmemberDTO>.GetModel(ModelApiUrl);
            if (result.flag)
            {
                if (result.data != null)
                    return result.data;
                else
                    return null;
            }
            else { return null; }
        }
        #endregion
        #region 会员卡信息
        /// <summary>
        /// 取得会员卡序数
        /// </summary>
        /// <returns></returns>
        public static int GetMaxSerialNumber()
        {
            string ModelApiUrl = RemoteDomain + "/Mbmember/GetMaxSerialNumber";
            return APIOP<int>.GetMaxSerialNumber(ModelApiUrl);
        }
        #endregion
    }
}
