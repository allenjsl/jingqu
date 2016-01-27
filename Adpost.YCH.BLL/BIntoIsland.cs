using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;

namespace Adpost.YCH.BLL
{
    public enum 走进半岛
    {
        半岛纵览 = 1,
        多元半岛,
        半岛位置,
        交通指南
    }
    /// <summary>
    /// 印象半岛
    /// </summary>
    public class BIntoIsland
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 印象半岛
        /// </summary>
        private static string IntoIslandApiUrl = RemoteDomain + "/Tywintoisland/SearchSingleData";
        /// <summary>
        /// 走进半岛取值
        /// </summary>
        /// <param name="Target"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string ContentInfo(int Target,走进半岛 type)
        {
            var strJson = new Dictionary<string, object>()
                {
                    {"publishtarget","" + Target.ToString() + ""},
                    {"is_valid",1},
                    {"pagetype",(int)type}
                };
            var Result = APIOP<TywintoislandDTO>.SearchSingleData(IntoIslandApiUrl, strJson);
            if (Result.flag)
            {
                if (Result.data != null)
                    return Result.data.content;
                else
                    return "";
            }
            else { return ""; }
        }
    }
}
