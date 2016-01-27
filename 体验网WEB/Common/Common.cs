using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YCH.DataCenter.DTO;
using Adpost.YCH.BLL;
using Adpost.YCH.Utility;

namespace Adpost.YCH.WEB
{    
    #region SEO 信息
    public class SeoInfo
    {
        /// <summary>
        /// 网页标题
        /// </summary>
        public string WebTitle { get; set; }
        /// <summary>
        /// 网页关键字
        /// </summary>
        public string Keywords { get; set; }
        /// <summary>
        /// 网页描述
        /// </summary>
        public string Description { get; set; }
    }
    #endregion
    #region 通用类    
    /// <summary>
    /// 通用类
    /// </summary>
    public class Common
    {
        /// <summary>
        /// 入住天数计算
        /// </summary>
        /// <param name="StartDate"></param>
        /// <param name="EndDate"></param>
        /// <returns></returns>
        public static double CheckInDays(DateTime StartDate, DateTime EndDate)
        {
            double v = Adpost.YCH.Utility.StringValidate.DateDiff(StartDate, EndDate, "day");
            if (v == 0)
                v = 1;
            return v;
        }
        /// <summary>
        /// 默认图片
        /// </summary>
        /// <param name="ImgPath"></param>
        /// <returns></returns>
        public static string NoPhotoDefault(string ImgPath)
        {
            if (String.IsNullOrWhiteSpace(ImgPath))
                return "/Images/img_comingsoon.png";
            else return ImgPath;
        }
        /// <summary>
        /// 菜单SEO信息
        /// </summary>
        /// <param name="MenuId"></param>
        public static SeoInfo MenuSeoInfo(string MenuId)
        {
            var model = BIndexAndMenu.MenuSeoInfo(MenuId);
            if (model != null)
            {
                var si = new SeoInfo
                {
                    WebTitle = model.seotitle,
                    Keywords = model.seokeyword,
                    Description = model.seodesc
                };
                return si;
            }
            else
            {
                return null;
            }
        }
        public static string PhotoSplit(string PhotoPath, int ArrayNumber)
        {
            if (!String.IsNullOrWhiteSpace(PhotoPath))
            {
                string[] pl = PhotoPath.Split('|');
                if (pl.Length < ArrayNumber+1)
                    return Common.NoPhotoDefault("");
                else
                    return pl[ArrayNumber];
            }
            else { return Common.NoPhotoDefault(""); }
        }
        
    }
     #endregion
}