using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;
using System.Text;

namespace Adpost.YCH.BLL
{
    public class BTourCenter
    {
        #region API URL
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        private static string ApiUrl = RemoteDomain + "/Tywtourcenter/SearchSingleData";
        #endregion
        /// <summary>
        /// 取得游客中心信息
        /// </summary>
        /// <param name="Target"></param>
        /// <returns></returns>
        public static TywtourcenterDTO GetTourCenterInfo(int Target)
        {
            var strJson = new Dictionary<string, object>()
                {
                    {"publishtarget",Target},
                    {"is_valid",1}

                };
            var Result = APIOP<TywtourcenterDTO>.SearchSingleData(ApiUrl, strJson).data;
            if (Result != null)
            {
                return Result;
            }
            else
            {
                return null;
            }
        }
    }
}
