using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Specialized;
using System.IO;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Net;
using Adpost.YCH.BLL;

namespace Adpost.YCH.WEB.AliPay
{
    /// <summary>
    /// 支付反馈
    /// </summary>
    public partial class Alipay_Notify : System.Web.UI.Page
    {
        public static string GetMD5(string s)
        {

            /// <summary>
            /// 与ASP兼容的MD5加密算法
            /// </summary>

            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] t = md5.ComputeHash(Encoding.GetEncoding("utf-8").GetBytes(s));
            StringBuilder sb = new StringBuilder(32);
            for (int i = 0; i < t.Length; i++)
            {
                sb.Append(t[i].ToString("x").PadLeft(2, '0'));
            }
            return sb.ToString();
        }

        public static string[] BubbleSort(string[] r)
        {
            /// <summary>
            /// 冒泡排序法
            /// </summary>

            int i, j; //交换标志 
            string temp;

            bool exchange;

            for (i = 0; i < r.Length; i++) //最多做R.Length-1趟排序 
            {
                exchange = false; //本趟排序开始前，交换标志应为假

                for (j = r.Length - 2; j >= i; j--)
                {
                    if (System.String.CompareOrdinal(r[j + 1], r[j]) < 0)　//交换条件
                    {
                        temp = r[j + 1];
                        r[j + 1] = r[j];
                        r[j] = temp;

                        exchange = true; //发生了交换，故将交换标志置为真 
                    }
                }

                if (!exchange) //本趟排序未发生交换，提前终止算法 
                {
                    break;
                }

            }
            return r;
        }
        //获取远程服务器ATN结果
        public String Get_Http(String a_strUrl, int timeout)
        {
            string strResult;
            try
            {

                HttpWebRequest myReq = (HttpWebRequest)HttpWebRequest.Create(a_strUrl);
                myReq.Timeout = timeout;
                HttpWebResponse HttpWResp = (HttpWebResponse)myReq.GetResponse();
                Stream myStream = HttpWResp.GetResponseStream();
                StreamReader sr = new StreamReader(myStream, Encoding.Default);
                StringBuilder strBuilder = new StringBuilder();
                while (-1 != sr.Peek())
                {
                    strBuilder.Append(sr.ReadLine());
                }

                strResult = strBuilder.ToString();
            }
            catch (Exception exp)
            {

                strResult = "错误：" + exp.Message;
            }

            return strResult;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            #region 获取值初始化
            //*****************************************************************************************
            ///当不知道https的时候，请使用http
            //string alipayNotifyURL = "https://www.alipay.com/cooperate/gateway.do?";
            string alipayNotifyURL = "http://notify.alipay.com/trade/notify_query.do?";

            string partner = System.Configuration.ConfigurationManager.AppSettings["partner"]; 		//*********partner合作伙伴id（必须填写）
            string key = System.Configuration.ConfigurationManager.AppSettings["key"]; //************partner 的对应交易安全校验码（必须填写）

            //alipayNotifyURL = alipayNotifyURL + "service=notify_verify" + "&partner=" + partner + "&notify_id=" + Request.Form["notify_id"];
            alipayNotifyURL = alipayNotifyURL + "partner=" + partner + "&notify_id=" + Request.Form["notify_id"];

            //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
            string responseTxt = Get_Http(alipayNotifyURL, 120000);


            //****************************************************************************************
            int i;
            NameValueCollection coll;
            coll = Request.Form;

            String[] requestarr = coll.AllKeys;



            //进行排序；
            string[] Sortedstr = BubbleSort(requestarr);

            //构造待md5摘要字符串 ；
            string prestr = "";
            for (i = 0; i < Sortedstr.Length; i++)
            {
                if (Request.Form[Sortedstr[i]] != "" && Sortedstr[i] != "sign" && Sortedstr[i] != "sign_type")
                {
                    if (Sortedstr[i].Length > 7 && Sortedstr[i].Substring(0, 7) == "UrlPar_")
                    {
                        continue;
                    }
                    if (i == Sortedstr.Length - 1)
                    {
                        prestr = prestr + Sortedstr[i] + "=" + Request.Form[Sortedstr[i]];
                    }
                    else
                    {
                        prestr = prestr + Sortedstr[i] + "=" + Request.Form[Sortedstr[i]] + "&";
                    }
                }

            }
            prestr = prestr + key;

            string mysign = GetMD5(prestr);


            string sign = Request.Form["sign"];
            #endregion 获取值初始化

            #region 结果处理
            if (mysign == sign && responseTxt == "true")   //验证支付发过来的消息，签名是否正确
            {
                //更新订单状态
                if (ResponseResult())
                Response.Write("success");     //返回给支付宝消息，成功
                else
                    Response.Write("fail");
            }
            else
                Response.Write("fail");

            #endregion 结果处理
        }
         /// <summary>
        /// 输出展示结果
        /// </summary>
        private bool ResponseResult()
        {
            #region 获得支付宝的值
            string strOrderIdList = Request.Form["UrlPar_OrderId"]; //订单ID
            string buyer_email = Request.Form["buyer_email"]; //付款方支付宝帐号
            string seller_email = Request.Form["seller_email"]; //收款方的支付宝帐号
            string notify_time = Request.Form["notify_time"];  //交易时间
            string total_fee = Request.Form["total_fee"]; //交易总金额
            string out_trade_no = Request.Form["out_trade_no"]; //传给支付宝的支付交易订单号   
            string trade_no = Request.Form["trade_no"];//支付宝交易成功后返给我们的交易单号
            //string strPayCompanyId = Request.Form["UrlPar_PayCompanyId"];
            //string strPayOperatorId = Request.Form["UrlPar_PayOperatorId"];
            string strPayIp = Request.Form["UrlPar_PayIp"];

            #endregion

            #region 定义付款方变量
            int PayCompanyId = 0;  //付款方公司ID
            int PayOperatorId = 0;  //付款方操作员ID
            decimal PayDealPercent = 0;   //付款方的手续费比例(目前为0)
            int PayProvinceId = 0;
            int PayCityId = 0;
            string PayCompanyName = "";
            int PayTypeId = 0;
            string PayOperatorName = "";
            #endregion


            #region 处理获得的值
            string[] tmpArrOrderId = strOrderIdList.Split(',');

            if (tmpArrOrderId != null)
            {             

                #region 循环获得订单信息
                //获得订单编号
                foreach (string strId in tmpArrOrderId)
                {
                     var model = BOrder.GetModel(strId);
                     if (model != null)
                     {
                         model.id = strId;
                         model.orderstatus = Convert.ToString((int)订单状态.已支付);
                         model.paytype = 1;
                         var result = BOrder.Update(model);
                         //写会员积分
                         BMemberIntegral.Add(new global::YCH.DataCenter.DTO.MbmemberintegralchangeDTO {
                         id = System.Guid.NewGuid().ToString(),
                         billtype = Convert.ToInt32(model.ordertype),
                         objid = strId,
                         memberid = model.member_id,
                         innum = model.totalamount,
                         absract = "购买积分，订单编号：" + model.code,
                         year_num = DateTime.Now.Year,
                         create_date = DateTime.Now,
                         currentdate = DateTime.Now
                         });
                         if (result == false) { return false; }
                     }
                }
                return true;
                #endregion 循环获得订单信息
            }
            #endregion

            return true;
        }
    }
}