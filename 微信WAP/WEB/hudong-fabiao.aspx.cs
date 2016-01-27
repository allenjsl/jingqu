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
    public partial class hudong_fabiao : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();
            }
        }
        /// <summary>
        /// 检测字符串是否是数组中的一项
        /// </summary>
        /// <param name="inputData"></param>
        /// <param name="arrData"></param>
        /// <returns></returns>
        private bool IsStringExists(string inputData, string[] arrData)
        {
            if (null == inputData || string.Empty == inputData)
            {
                return false;
            }
            foreach (string tmpStr in arrData)
            {
                if (inputData == tmpStr)
                {
                    return true;
                }
            }
            return false;
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            var LoginModel = LoginCheck();
            if (LoginModel != null)
            {
                string title = Utils.GetFormValue("title");
                string content = Utils.GetFormValue("content");
                #region 文件上传
                string CoverPhoto = "";
                string _UploadFileExt = ".gif,.bmp,.png,.jpg,.jpeg";
                int _UpFolderSize = 2024;//KB
                string tmpFileExt = _UploadFileExt;
                string[] strFileExt = tmpFileExt.Split(',');
                if (!imgFileUpload.HasFile)
                {
                    MessageBox.ShowAndReturnBack("请上传图片！");
                    return;
                }
                System.Web.HttpPostedFile file = imgFileUpload.PostedFile;
                //判断文件大小
                if (file.ContentLength > _UpFolderSize * 1024)
                {
                    MessageBox.ShowAndReturnBack("图片不能超过2MB！");
                    return;
                }
                //检验后缀名
                if (!String.IsNullOrWhiteSpace(file.FileName))
                {
                    if (IsStringExists(System.IO.Path.GetExtension(file.FileName).ToLower().Trim(), strFileExt) == false)
                    {
                        MessageBox.ShowAndReturnBack("图片格式不正确！");
                        return;
                    }
                }
                else
                {
                    MessageBox.ShowAndReturnBack("请上传图片文件！");
                    return;
                }
                //保存文件
                try
                {
                    CoverPhoto = Adpost.YCH.BLL.BUpload.FileRemoteUpload(file);
                }
                catch
                {
                    MessageBox.ShowAndReturnBack("文件上传失败！");
                    return;
                }
                #endregion
                var Result = Bphotoalbum.Add(new TywphotoalbumDTO
                {
                    id = System.Guid.NewGuid().ToString(),
                    photoname = title,
                    photodesc = content,
                    photoaddress = CoverPhoto,
                    ower_user_id = LoginModel.id,
                    create_user_id = LoginModel.nickname,
                    is_valid = 1,
                    source = Target.ToString(),
                    create_date = DateTime.Now
                });
                if (Result)
                {
                    MessageBox.ShowAndRedirect("添加成功！", "hudong-list.aspx");
                    return;
                }
                else
                {
                    MessageBox.ShowAndReturnBack("添加失败！");
                    return;
                }
            }
            else
            {
                MessageBox.ShowAndRedirect("用户未登陆！", "Login.aspx");
                return;
            }
        }
    }
}