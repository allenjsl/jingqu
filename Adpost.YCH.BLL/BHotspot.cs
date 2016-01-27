using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using YCH.DataCenter.DTO.Base;
using ZFramework.Pager;
using System.Dynamic;

namespace Adpost.YCH.BLL
{
    public enum 热点类型
    {
        //1景区2景点3美食4购物5娱乐6住宿
        景区 = 1,
        景点,
        美食, 
        购物, 
        娱乐, 
        住宿,
        积分商品
    }    
    /// <summary>
    /// 主业务 热点数据
    /// </summary>
    public class BHotspot
    {        
        #region 通用获取
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static dynamic GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Hotspot/GetByID?hotspotId=" + Id;
            var result = APIOP<dynamic>.GetModel(ModelApiUrl);
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
        #region 景点
        /// <summary>
        /// 景点列表
        /// </summary>
        private static string ScenicsApiUrl = RemoteDomain + "/Hotspot/SearchPageScenics";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<HotspotScenicsDTO> GetScenicsList(int target)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<HotspotScenicsDTO>(o => o.publishtarget, target, QueryMethod.Equal);
            pi.AddCondition<HotspotScenicsDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            var Result = APIOP<HotspotScenicsDTO>.SearchPage(ScenicsApiUrl, pi);
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
        public static List<HotspotScenicsDTO> GetScenicsList(PageInfo pi)
        {
            var Result = APIOP<HotspotScenicsDTO>.SearchPage(ScenicsApiUrl, pi);
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
        public static List<HotspotScenicsDTO> GetScenicsList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<HotspotScenicsDTO>.SearchPage(ScenicsApiUrl, pi);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static HotspotScenicsDTO GetScenicsModel(string Id)
        {
            string ScenicsModelApiUrl = RemoteDomain + "/Hotspot/GetScenicsDetail/" +Id;
            var result = APIOP<HotspotScenicsDTO>.GetModel(ScenicsModelApiUrl);
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
        /// 取得收费景点信息
        /// </summary>
        /// <param name="Target"></param>
        /// <returns></returns>
        public static List<HotspotScenicsDTO> GetTollScenics(int target)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 1;
            pi.AddCondition<HotspotScenicsDTO>(o => o.publishtarget, target, QueryMethod.Equal);
            pi.AddCondition<HotspotScenicsDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.AddCondition<HotspotScenicsDTO>(o => o.hotspot_name, "重元寺", QueryMethod.Equal);
            var Result = APIOP<HotspotScenicsDTO>.SearchPage(ScenicsApiUrl, pi);
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
        #endregion
        #region 美食
        /// <summary>
        /// 餐厅列表
        /// </summary>
        private static string RestaurantsApiUrl = RemoteDomain + "/Hotspot/SearchPageRestaurants";
        /// <summary>
        /// 美食列表
        /// </summary>
        private static string FoodsApiUrl = RemoteDomain + "/Cphotspotfoods/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<HotspotRestaurantDTO> GetRestaurantsList(int target)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<HotspotRestaurantDTO>(o => o.publishtarget, target, QueryMethod.Equal);
            pi.AddCondition<HotspotRestaurantDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            var Result = APIOP<HotspotRestaurantDTO>.SearchPage(RestaurantsApiUrl, pi);
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
        public static List<HotspotRestaurantDTO> GetRestaurantsList(PageInfo pi)
        {
            var Result = APIOP<HotspotRestaurantDTO>.SearchPage(RestaurantsApiUrl, pi);
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
        public static List<HotspotRestaurantDTO> GetRestaurantsList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<HotspotRestaurantDTO>.SearchPage(RestaurantsApiUrl, pi);
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
        /// 取得子列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<CphotspotfoodsDTO> GetFoodsList(string HotspotId)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 999;
            pi.AddCondition<CphotspotfoodsDTO>(o => o.hotspot_id, HotspotId, QueryMethod.Equal);
            var Result = APIOP<CphotspotfoodsDTO>.SearchPage(FoodsApiUrl, pi);
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
        public static HotspotRestaurantDTO GetRestaurantsModel(string Id)
        {
            string ScenicsModelApiUrl = RemoteDomain + "/Hotspot/GetRestaurantDetail/" + Id;
            var result = APIOP<HotspotRestaurantDTO>.GetModel(ScenicsModelApiUrl);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static CphotspotfoodsDTO GetFoodModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Cphotspotfoods/GetById/" + Id;
            var result = APIOP<CphotspotfoodsDTO>.GetModel(ModelApiUrl);
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
        #region 酒店
        /// <summary>
        /// 酒店列表
        /// </summary>
        private static string HotelApiUrl = RemoteDomain + "/Hotspot/SearchPageHotels";
        /// <summary>
        /// 房型列表
        /// </summary>
        private static string HotelRoomApiUrl = RemoteDomain + "/Cphotspotroom/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<HotspotHotelDTO> GetHotelsList(int target)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue;
            pi.AddCondition<HotspotHotelDTO>(o => o.publishtarget, target, QueryMethod.Equal);
            pi.AddCondition<HotspotHotelDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            var Result = APIOP<HotspotHotelDTO>.SearchPage(HotelApiUrl, pi);
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
        public static List<HotspotHotelDTO> GetHotelsList(PageInfo pi)
        {
            var Result = APIOP<HotspotHotelDTO>.SearchPage(HotelApiUrl, pi);
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
        public static List<HotspotHotelDTO> GetHotelsList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<HotspotHotelDTO>.SearchPage(HotelApiUrl, pi);
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
        /// 取得子列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<CphotspotroomDTO> GetHotelRoomList(string HotspotId)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 999;
            pi.AddCondition<CphotspotroomDTO>(o => o.hotspot_id, HotspotId, QueryMethod.Equal);
            var Result = APIOP<CphotspotroomDTO>.SearchPage(HotelRoomApiUrl, pi);
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
        public static HotspotHotelDTO GetHotelModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Hotspot/GetHotelDetail/" + Id;
            var result = APIOP<HotspotHotelDTO>.GetModel(ModelApiUrl);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static CphotspotroomDTO GetRoomModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Cphotspotroom/GetById/" + Id;
            var result = APIOP<CphotspotroomDTO>.GetModel(ModelApiUrl);
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
        #region 购物
        /// <summary>
        /// 列表
        /// </summary>
        private static string ShopApiUrl = RemoteDomain + "/Hotspot/SearchPageShopping";
        /// <summary>
        /// 子项列表
        /// </summary>
        private static string ShopItemApiUrl = RemoteDomain + "/Cphotspotgoods/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<HotspotMallDTO> GetShopsList(PageInfo pi)
        {
            var Result = APIOP<HotspotMallDTO>.SearchPage(ShopApiUrl, pi);
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
        public static List<HotspotMallDTO> GetShopsList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<HotspotMallDTO>.SearchPage(ShopApiUrl, pi);
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
        /// 取得子列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<CphotspotgoodsDTO> GetShopItemList(string HotspotId)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 999;
            pi.AddCondition<CphotspotgoodsDTO>(o => o.hotspot_id, HotspotId, QueryMethod.Equal);
            var Result = APIOP<CphotspotgoodsDTO>.SearchPage(ShopItemApiUrl, pi);
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
        public static HotspotMallDTO GetShopModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Hotspot/GetShoppingDetail/" + Id;
            var result = APIOP<HotspotMallDTO>.GetModel(ModelApiUrl);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static CphotspotgoodsDTO GetShopItemModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Cphotspotgoods/GetById/" + Id;
            var result = APIOP<CphotspotgoodsDTO>.GetModel(ModelApiUrl);
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
        #region 娱乐
        /// <summary>
        /// 列表
        /// </summary>
        private static string EntertainmentApiUrl = RemoteDomain + "/Hotspot/SearchPageAmusements";
        /// <summary>
        /// 子项列表
        /// </summary>
        private static string EntertainmentItemApiUrl = RemoteDomain + "/Cphotspotdisport/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<HotspotAmusementDTO> GetEntertainmentsList(PageInfo pi)
        {
            var Result = APIOP<HotspotAmusementDTO>.SearchPage(EntertainmentApiUrl, pi);
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
        public static List<HotspotAmusementDTO> GetEntertainmentsList(PageInfo pi, ref int TotalRowsCount)
        {
            TotalRowsCount = 0;
            var Result = APIOP<HotspotAmusementDTO>.SearchPage(EntertainmentApiUrl, pi);
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
        /// 取得子列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<CphotspotdisportDTO> GetEntertainmentItemList(string HotspotId)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 999;
            pi.AddCondition<CphotspotdisportDTO>(o => o.hotspot_id, HotspotId, QueryMethod.Equal);
            var Result = APIOP<CphotspotdisportDTO>.SearchPage(EntertainmentItemApiUrl, pi);
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
        public static HotspotAmusementDTO GetEntertainmentModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Hotspot/GetAmusementDetail/" + Id;
            var result = APIOP<HotspotAmusementDTO>.GetModel(ModelApiUrl);
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
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static CphotspotdisportDTO GetEntertainmentItemModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Cphotspotdisport/GetById/" + Id;
            var result = APIOP<CphotspotdisportDTO>.GetModel(ModelApiUrl);
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
        #region 积分商品
        /// <summary>
        /// 积分商品列表
        /// </summary>
        private static string PointItemApiUrl = RemoteDomain + "/Cphotspotgoods/SearchPage";
        /// <summary>
        /// 取得积分商品列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<CphotspotgoodsDTO> GetIntegralList(int PublishTarget,string HotspotId)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = 999;
            pi.AddCondition<HotspotRestaurantDTO>(o => o.publishtarget, PublishTarget, QueryMethod.Equal);
            pi.AddCondition<CphotspotgoodsDTO>(o => o.hotspot_id, HotspotId, QueryMethod.Equal);
            var Result = APIOP<CphotspotgoodsDTO>.SearchPage(PointItemApiUrl, pi);
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
        /// 取得积分商品实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static CphotspotgoodsDTO GetIntegralModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Cphotspotgoods/GetById/" + Id;
            var result = APIOP<CphotspotgoodsDTO>.GetModel(ModelApiUrl);
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
    }
}
