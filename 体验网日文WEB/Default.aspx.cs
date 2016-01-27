using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Adpost.YCH.Model;
using Adpost.YCH.BLL;
using Adpost.YCH.Utility;
using Newtonsoft.Json;
using YCH.DataCenter.DTO;

namespace Adpost.YCH.WEB
{
    /// <summary>
    /// 首页
    /// </summary>
    public partial class Default : BasePage
    {
        #region API URL
        
        #endregion
        /// <summary>
        /// 页面加载
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               
                var Result = BIndexAndMenu.GetIndex(Target);
                if (Result != null)
                {
                    SetSeoInfo(new SeoInfo
                    {
                        WebTitle = Result.seotitle,
                        Keywords = Result.seokeyword,
                        Description = Result.seodesc
                    });
                    InitImg(Result.imagelist);
                }
            }
        }
        /// <summary>
        /// 加载背景图片
        /// </summary>
        private void InitImg(string strImage)
        {
            if (!String.IsNullOrEmpty(strImage))
            {
                List<MIndexImageList> ImageList = JsonConvert.DeserializeObject<List<MIndexImageList>>(strImage);
                if (ImageList.Count() > 0)
                {
                    this.phNoData.Visible = false;
                    this.rptImg.DataSource = ImageList;
                    this.rptImg.DataBind();
                }
                else {
                    this.phNoData.Visible = true;
                }
             
            }
        }
    }
}