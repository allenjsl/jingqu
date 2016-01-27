using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using YCH.DataCenter.DTO;
using ZFramework.Pager;


namespace Adpost.YCH.BLL
{
    public enum 订单类型
    {
        酒店订单 = 1,
        购物订单 = 2,
        美食,
        娱乐,
        导游,
        景点,
        线路,
        活动,
        积分兑换,
        签到
    }
    public enum 预订方式
    {
        不显示预定, 
        预订支付,
        跳转淘宝店
    }
    public enum 订单状态
    {
        待确认 = 0,
        待支付 = 1,
        已支付=2
    }
    public enum 支付类型
    {
        支付宝 = 1,
        信用卡 = 2,
        储蓄卡 = 3,
        会员积分=4
    }
    #region 订单
    /// <summary>
    /// 订单
    /// </summary>
    public class BOrder
    {
        private static string RemoteDomain = System.Configuration.ConfigurationManager.AppSettings["RemoteDomain"];
        /// <summary>
        /// 列表
        /// </summary>
        private static string ListApiUrl = RemoteDomain + "/Dsorder/SearchPage";
        /// <summary>
        /// 列表
        /// </summary>
        private static string UnionListApiUrl = RemoteDomain + "/Dsorder/SearchPageOfUnion";
        /// <summary>
        /// 明细列表
        /// </summary>
        private static string ItemListApiUrl = RemoteDomain + "/Dsorderdetail/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<DsorderDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<DsorderDTO>.SearchPage(ListApiUrl, pi);
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
        public static List<DsorderDTO> GetList(PageInfo pi, ref int TotalRows)
        {
            TotalRows = 0;
            var Result = APIOP<DsorderDTO>.SearchPage(ListApiUrl, pi);
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
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<ViewOrderDTO> GetViewList(PageInfo pi, ref int TotalRows)
        {
            TotalRows = 0;
            var Result = APIOP<ViewOrderDTO>.SearchPage(UnionListApiUrl, pi);
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
        /// 新增
        /// </summary>
        public static bool AddOrder(DsorderDTO model)
        {
            var result = APIOP<DsorderDTO>.Add(RemoteDomain + "/Dsorder/AddOrder", model);
            return result.flag;
        }
        /// <summary>
        /// 修改
        /// </summary>
        public static bool UpdateOrder(DsorderDTO model)
        {
            var result = APIOP<DsorderDTO>.Update(RemoteDomain + "/Dsorder/UpdateOrder", model);
            return result.flag;
        }
        /// <summary>
        /// 修改主订单表
        /// </summary>
        public static bool Update(DsorderDTO model)
        {
            var result = APIOP<DsorderDTO>.Update(RemoteDomain + "/Dsorder/Update", model);
            return result.flag;
        }
        /// <summary>
        /// 删除订单
        /// </summary>
        public static bool Delete(string[] Ids)
        {
            var result = APIOP<DsorderDTO>.Delete(RemoteDomain + "/Dsorder/Delete", Ids);
            return result.flag;
        }
        /// <summary>
        /// 取得实体内容
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static DsorderDTO GetModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Dsorder/GetById/" + Id;
            var result = APIOP<DsorderDTO>.GetModel(ModelApiUrl);
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
        public static ViewOrderDTO GetViewModel(string Id)
        {
            string ModelApiUrl = RemoteDomain + "/Dsorder/GetUnionById/" + Id;
            var result = APIOP<ViewOrderDTO>.GetModel(ModelApiUrl);
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
        /// 返回订单信息数组
        /// </summary>
        /// <param name="OrderId"></param>
        /// <param name="orderType"></param>
        /// <returns></returns>
        public static string[] GetOrderInfo(string OrderId, 订单类型 orderType)
        {
            string[] info = null;
            DsorderDTO model = GetModel(OrderId);
            if (model != null)
            {
                info = new string[3];
                float totalMoney = 0.0f;
                //商品名称
                info[0] = "";
                string ProductName = "";
                List<DsorderdetailDTO> ItemList = GetList(OrderId);
                DsorderdetailDTO ItemModel = null;
                if (ItemList.Count() > 0)
                    ItemModel = ItemList[0];
                ProductName = ItemModel.productname;
                if (ProductName.Length > 50)
                    ProductName = ProductName.Substring(0, 50) + "...";
                string ItemName = "";
                switch (orderType)
                {
                    case 订单类型.酒店订单:
                        info[0] = "酒店订单";
                        var RoomModel = BHotspot.GetRoomModel(ItemModel.roomtype);
                        if (RoomModel != null)
                        {
                            ItemName = RoomModel.name;
                        }
                        info[1] += string.Format("房型:{0},房间数:{1}间({2}元/间),入住天数:{4}天,总金额:{3}元;", ItemName, ItemModel.num.ToString(), ItemModel.price.ToString("F2"), ItemModel.realamount, CheckInDays(ItemModel.ctime.Value, ItemModel.dtime.Value));
                        totalMoney += ItemModel.realamount;
                        break;
                    case 订单类型.购物订单:
                        info[0] = "购物订单";
                        var ShopModel = BHotspot.GetShopItemModel(ItemModel.roomtype);
                        if (ShopModel != null)
                        {
                            ItemName = ShopModel.good_name;
                        }
                        info[1] += string.Format("产品名称：{0}单价：{1},购买数量{2},总金额:{3}元;", ItemName, ItemModel.price.ToString(), ItemModel.num.ToString("F2"), ItemModel.realamount);
                        totalMoney += ItemModel.realamount;
                        break;
                    case 订单类型.线路:
                        info[0] = "线路订单";
                        var LineModel = BTravelline.GetModel(ItemModel.productid);
                        if (LineModel != null)
                        {
                            ItemName = LineModel.title;
                        }
                        info[1] += string.Format("线路名称：{0}成人价：{1},儿童价:{2},成人数量{3},儿童数量{4},总金额:{5}元;", ItemName, LineModel.adultprice.ToString(), LineModel.childprice.ToString(), ItemModel.num.ToString("F2"), ItemModel.childrennum.ToString("F2"), ItemModel.realamount);
                        totalMoney += ItemModel.realamount;
                        break;
                    case 订单类型.活动:
                        info[0] = "活动订单";
                        var ActModel = BActivities.GetModel(ItemModel.productid);
                        if (ActModel != null)
                        {
                            ItemName = ActModel.act_name;
                        }
                        info[1] += string.Format("活动名称:{0},人数:{1}({2}元),总金额:{3}元;", ItemName, ItemModel.num.ToString(), ItemModel.price.ToString("F2"), ItemModel.realamount);
                        totalMoney += ItemModel.realamount;
                        break;
                }
                info[2] = totalMoney.ToString();
                return info;
            }
            else
            {
                return info;
            }
        }
       /// <summary>
       /// 取得订单明细列表
       /// </summary>
       /// <param name="Orderid"></param>
       /// <returns></returns>
        public static List<DsorderdetailDTO> GetList(string Orderid)
        {
            PageInfo pi = new PageInfo();
            pi.PageIndex = 1;
            pi.PageSize = int.MaxValue ;
            pi.AddCondition<DsorderdetailDTO>(o => o.ds_order_id, Orderid, QueryMethod.Equal);
            var Result = APIOP<DsorderdetailDTO>.SearchPage(ItemListApiUrl, pi);
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
        /// 入住天数计算
        /// </summary>
        /// <param name="StartDate"></param>
        /// <param name="EndDate"></param>
        /// <returns></returns>
        private static double CheckInDays(DateTime StartDate, DateTime EndDate)
        {
            double v = Adpost.YCH.Utility.StringValidate.DateDiff(StartDate, EndDate, "day");
            if (v == 0)
                v = 1;
            return v;
        }
    }
    #endregion
    #region 预约
    /*
    public enum 预约类型
    {
        美食=1,
        娱乐,
        游客
    }
    /// <summary>
    /// 预定不需支付
    /// </summary>
    public class BBooking
    {
        /// <summary>
        /// 列表
        /// </summary>
        private const string ListApiUrl = RemoteDomain + "/Tywbooking/SearchPage";
        /// <summary>
        /// 取得列表
        /// </summary>
        /// <param name="pi">页面查询信息</param>
        /// <returns></returns>
        public static List<TywbookingDTO> GetList(PageInfo pi)
        {
            var Result = APIOP<TywbookingDTO>.SearchPage(ListApiUrl, pi);
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
        public static List<TywbookingDTO> GetList(PageInfo pi, ref int TotalRows)
        {
            TotalRows = 0;
            var Result = APIOP<TywbookingDTO>.SearchPage(ListApiUrl, pi);
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
        /// 新增
        /// </summary>
        public static bool Add(TywbookingDTO model)
        {
            var result = APIOP<TywbookingDTO>.Add(RemoteDomain + "/Tywbooking/Add", model);
            return result.flag;
        }
    }*/
    #endregion
}
