﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Xml;
using Eyousoft_yhq.AlipayLibrary;
using Adpost.YCH.BLL;
using Adpost.YCH.Utility;

namespace Adpost.YCH.WAP.Alipay
{
    public partial class notify_url : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> sPara = GetRequestPost();

            if (sPara.Count > 0)//判断是否有带返回参数
            {
                Notify aliNotify = new Notify();
                bool verifyResult = aliNotify.VerifyNotify(sPara, Request.Form["sign"]);

                if (verifyResult)//验证成功
                {
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //请在这里加上商户的业务逻辑程序代码


                    //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                    //获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表

                    //解密（如果是RSA签名需要解密，如果是MD5签名则下面一行清注释掉）
                    sPara = aliNotify.Decrypt(sPara);

                    //XML解析notify_data数据
                    try
                    {
                        XmlDocument xmlDoc = new XmlDocument();
                        xmlDoc.LoadXml(sPara["notify_data"]);
                        //商户订单号
                        string out_trade_no = xmlDoc.SelectSingleNode("/notify/out_trade_no").InnerText;
                        //支付宝交易号
                        string trade_no = xmlDoc.SelectSingleNode("/notify/trade_no").InnerText;
                        //交易状态
                        string trade_status = xmlDoc.SelectSingleNode("/notify/trade_status").InnerText;

                        if (trade_status == "TRADE_FINISHED")//交易成功
                        {
                            Response.Write("success");
                        }
                        else if (trade_status == "TRADE_SUCCESS")//支付成功
                        {
                            string tmpOrderId = Request.QueryString["out_trade_no"];
                            var OrderModel = BOrder.GetModel(tmpOrderId);
                            if (OrderModel != null)
                            {
                                OrderModel.id = tmpOrderId;
                                OrderModel.orderstatus = Convert.ToString((int)订单状态.已支付);
                                OrderModel.paytype = 1;
                               BOrder.Update(OrderModel);
                               if (BMemberIntegral.IsExist(Convert.ToInt32(OrderModel.ordertype), tmpOrderId) == false)
                               {
                                   //写会员积分
                                   BMemberIntegral.Add(new global::YCH.DataCenter.DTO.MbmemberintegralchangeDTO
                                   {
                                       id = System.Guid.NewGuid().ToString(),
                                       billtype = Convert.ToInt32(OrderModel.ordertype),
                                       objid = tmpOrderId,
                                       memberid = OrderModel.member_id,
                                       innum = OrderModel.totalamount,
                                       absract = "购买积分，订单编号：" + OrderModel.code,
                                       year_num = DateTime.Now.Year,
                                       currentdate = DateTime.Now,
                                       create_date = DateTime.Now
                                   });
                               }
                            }
                            Response.Redirect("/");
                        }
                        else
                        {
                            Response.Write(trade_status);
                        }

                    }
                    catch (Exception exc)
                    {
                        Response.Write(exc.ToString());
                    }



                    //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                }
                else//验证失败
                {
                    Response.Write("fail");
                }
            }
            else
            {
                Response.Write("无通知参数");
            }
        }

        /// <summary>
        /// 获取支付宝POST过来通知消息，并以“参数名=参数值”的形式组成数组
        /// </summary>
        /// <returns>request回来的信息组成的数组</returns>
        public Dictionary<string, string> GetRequestPost()
        {
            int i = 0;
            Dictionary<string, string> sArray = new Dictionary<string, string>();
            NameValueCollection coll;
            //Load Form variables into NameValueCollection variable.
            coll = Request.Form;

            // Get names of all forms into a string array.
            String[] requestItem = coll.AllKeys;

            for (i = 0; i < requestItem.Length; i++)
            {
                sArray.Add(requestItem[i], Request.Form[requestItem[i]]);
            }

            return sArray;
        }
    }
}