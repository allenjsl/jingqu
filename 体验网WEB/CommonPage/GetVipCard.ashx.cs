using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using Adpost.YCH.Utility;

namespace Adpost.YCH.WEB.CommonPage
{
    /// <summary>
    /// 显示会员卡
    /// </summary>
    public class GetVipCard : IHttpHandler
    {
        private string VipCardTemplate = "/CommonPage/membercard.jpg";

        public void ProcessRequest(HttpContext context)
        {
            string TrueName = Utils.GetQueryStringValue("TrueName");
            string CardNo = Utils.GetQueryStringValue("CardNo");
            System.Drawing.Image img = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath(VipCardTemplate));
            Graphics g = Graphics.FromImage(img);
            g.DrawImage(img, 0, 0, img.Width, img.Height);
            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            Font f = new Font("宋体", 17.5f,FontStyle.Bold);
            Brush br = new SolidBrush(Color.FromArgb(100, 80, 80, 80));
            g.DrawString(TrueName, f, br, 52, 200);
            Font f1 = new Font("Arial", 10, FontStyle.Regular);
            Brush br1 = new SolidBrush(Color.FromArgb(100, 102, 102, 102));
            g.DrawString("No:"+CardNo, f1, br1, 25, 232);
            g.Dispose();
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            byte[] imgbyte = ms.ToArray();
            if (imgbyte != null)
            {
                HttpContext.Current.Response.ClearContent();
                HttpContext.Current.Response.ContentType = "image/Jpeg";
                HttpContext.Current.Response.AddHeader("Content-Length", imgbyte.Length.ToString());
                HttpContext.Current.Response.BinaryWrite(imgbyte);
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();
            }
        }
        

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}