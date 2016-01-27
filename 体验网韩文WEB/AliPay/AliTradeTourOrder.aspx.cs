using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Text;
using Adpost.YCH.BLL;

namespace Adpost.YCH.WEB.AliPay
{
    /// <summary>
    /// 支付宝支付的页面
    /// </summary>
    public partial class AliTradeTourOrder : System.Web.UI.Page
    {
        /// <summary>
        /// 获得支付宝第3方收款的信息下标0:支付宝帐号  1:收费比例 2:收费说明
        /// </summary>
        public static string[] GetAliPayRoyalty()
        {
            string[] tmp = new string[3];
            tmp[0] = System.Configuration.ConfigurationManager.AppSettings["ThirdAlipay"];
            tmp[1] = System.Configuration.ConfigurationManager.AppSettings["MoenyScale"];
            tmp[2] = System.Configuration.ConfigurationManager.AppSettings["FeeRemark"];

            return tmp;
        }
        /// <summary>
        /// 支付宝的链接"/AliPay/AliTradeTourOrder.aspx?OrderId=10&OrderType=1" 
        /// OrderType=1线路团队订单OrderType=2景点订单  OrderType=3酒店订单 
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            //注意:url参数OrderID和ReturnUrl的值的字符长度之后必须小于等于99
            string tmpOrderId = Request.QueryString["OrderId"];  //若为多个订单ID,则以逗号分隔            
            string OrderType = Request.QueryString["OrderType"];   //订单类型
            string ReturnUrl = Request.QueryString["ReturnUrl"];  //要跳转的url地址

            if (string.IsNullOrEmpty(tmpOrderId) || string.IsNullOrEmpty(OrderType) || !Adpost.YCH.Utility.StringValidate.IsInteger(OrderType) || Int32.Parse(OrderType) == 0)
                return;

            string[] arrstrOrderId = tmpOrderId.Split(',');


            if (!IsPostBack)
            {
                EnowInfo.AliTradeRoyalty aliModel = new EnowInfo.AliTradeRoyalty();
                List<string> bodylist = new List<string>();
                List<string> subjectlist = new List<string>();
                decimal Totalfee = 0.0m;  //总金额

                foreach (string strId in arrstrOrderId)
                {
                    string OrderID = strId;
                    //订单信息
                    string[] orderInfoArr = BOrder.GetOrderInfo(OrderID, (订单类型)Int32.Parse(OrderType));
                    if (orderInfoArr == null)
                        continue;

                    subjectlist.Add(orderInfoArr[0]);
                    bodylist.Add(orderInfoArr[1]);

                    Totalfee += Convert.ToDecimal(orderInfoArr[2]);
                }

                if (Totalfee <= 0)
                {
                    Response.Write("<script>alert('支付金额必须大于0才能支付!');opener=null;window.close();</script>");
                    Response.End();
                }                

                if (subjectlist.Count == 0 || bodylist.Count == 0)
                {
                    Response.Write("<script>alert('对不起,商品订单信息不正确!');opener=null;window.close();</script>");
                    Response.End();
                }

                aliModel.BodyList = bodylist;
                aliModel.OrderUrl = "";
                aliModel.SellerEmail = System.Configuration.ConfigurationManager.AppSettings["AlipayAccount"];
                aliModel.SubjectList = subjectlist;
                aliModel.Totalfee = Totalfee;
                //aliModel.Totalfee = 0.01m;

                aliModel.UrlParameters = string.Format("UrlPar_OrderId={0}", tmpOrderId);

                bool isOpenNew = false;
                StringBuilder strVal = null;

                if (!string.IsNullOrEmpty(ReturnUrl))
                {
                    isOpenNew = true;
                    strVal = new StringBuilder();
                    strVal.Append(string.Format("<form name='Redirect' method='post' action='{0}'>", ReturnUrl));
                    strVal.Append("</form>");
                    strVal.Append("<script>");
                    strVal.Append("document.Redirect.submit()");
                    strVal.Append("</script>");
                }

                #region 进行手续费收费信息的计算
                /*
                string[] _tmpInfo = GetAliPayRoyalty();
                //aliModel.IsOpenRoyalty = true;  //开通收取手续费
                aliModel.RoyaltyAlipay.Add(_tmpInfo[0]);
                if (_tmpInfo[1] != null && _tmpInfo[1] != "")
                {
                    decimal MoneyScale = decimal.Parse(_tmpInfo[1]);
                    if (MoneyScale > 0)
                    {
                        aliModel.IsOpenRoyalty = true;  //开通收取手续费
                        aliModel.RoyaltyMoeny.Add(MoneyScale * Totalfee);
                    }
                    else
                    {
                        aliModel.IsOpenRoyalty = false;  //开通收取手续费  
                        aliModel.RoyaltyMoeny.Add(0);
                    }
                }
                else
                {
                    aliModel.IsOpenRoyalty = true;  //开通收取手续费
                    aliModel.RoyaltyMoeny.Add(0);
                }
                //aliModel.RoyaltyMoeny.Add(decimal.Parse(_tmpInfo[1]) * Totalfee);
                 aliModel.RoyaltyRemark.Add(_tmpInfo[2]);
                 * */


                aliModel.IsOpenRoyalty = false;  //开通收取手续费  
                aliModel.RoyaltyMoeny.Add(0);
                aliModel.RoyaltyRemark.Add("");
                #endregion

                EnowInfo.AliTradePay.TradePayRoyalty(aliModel, System.Configuration.ConfigurationManager.AppSettings["Alipay_Return"], System.Configuration.ConfigurationManager.AppSettings["Alipay_Notify"], isOpenNew, System.Configuration.ConfigurationManager.AppSettings["partner"], System.Configuration.ConfigurationManager.AppSettings["key"]);

                aliModel = null;
                bodylist.Clear();
                bodylist = null;
                subjectlist.Clear();
                subjectlist = null;

                if (strVal != null)
                {
                    HttpContext.Current.Response.Write(strVal.ToString());
                }
            }
        }
    }
}