using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YCH.DataCenter.DTO;

namespace Adpost.YCH.BLL
{
    /// <summary>
    /// 菜单和首页
    /// </summary>
    public class BIndexAndMenu
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 菜单API地址
        /// </summary>
        private static string MenuApiUrl = RemoteDomain + "/Tywnavmenu/GetById/{0}";
        /// <summary>
        /// 首页API地址
        /// </summary>
        private static string IndexApiUrl = RemoteDomain + "/Tywindex/SearchSingleData";
        /// <summary>
        /// 菜单SEO信息
        /// </summary>
        /// <param name="MenuId"></param>
        public static TywnavmenuDTO MenuSeoInfo(string MenuId)
        {
            string ApiUrl = String.Format(MenuApiUrl, MenuId);
            var Resutl = APIOP<TywnavmenuDTO>.GetModel(ApiUrl);
            if (Resutl.flag)
            {
                return Resutl.data;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 取得首页信息
        /// </summary>
        /// <param name="Target"></param>
        /// <returns></returns>
        public static TywindexDTO GetIndex(int Target)
        {
            var strJson = new Dictionary<string, object>()
                {
                    {"publishtarget",Target}
                };
            var Result = APIOP<TywindexDTO>.SearchSingleData(IndexApiUrl, strJson).data;
            return Result;
        }
    }
}
