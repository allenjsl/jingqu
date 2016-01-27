#region 命名空间
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
using ZFramework.Pager;
#endregion

namespace Adpost.YCH.WAP.WEB
{
    public partial class gyview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    InitModel(Id);
                }
                else { MessageBox.ShowAndReturnBack("未找到您要查看的信息!"); }
            }
        }
        /// <summary>
        /// 加载产品信息
        /// </summary>
        /// <param name="Id"></param>
        private void InitModel(string Id)
        {
            var model = Bphotoalbum.GetModel(Id);
            if (model != null)
            {
                this.ltrImg.Text = "<img src=\"" + Common.NoPhotoDefault(model.photoaddress) + "\" alt=\"\">";
                this.ltrName.Text = model.photoname;
                this.ltrInfo.Text = model.photodesc;
            }
            else { MessageBox.ShowAndReturnBack("未找到您要查看的信息!"); }

        }
    }
}