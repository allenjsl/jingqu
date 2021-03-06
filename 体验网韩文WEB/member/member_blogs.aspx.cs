﻿#region 命名空间
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

namespace Adpost.YCH.WEB.member
{
    public partial class member_blogs :BasePage
    {
        protected int CurrencyPage = 1;
        protected int PageSize = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        protected int TotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IsLogin();                
                InitList();
            }
        }
        private void InitList()
        {
            var model = LoginCheck();
            CurrencyPage = Utils.GetInt(Utils.GetQueryStringValue("Page"));
            if (CurrencyPage == 0)
                CurrencyPage = 1;
            string Keyword = Utils.GetQueryStringValue("KeyWord");
            PageInfo pi = new PageInfo();
            pi.PageIndex = CurrencyPage;
            pi.PageSize = PageSize;
            pi.AddCondition<TywtravelguideDTO>(o => o.publishtarget, Target, QueryMethod.Equal);
            pi.AddCondition<TywtravelguideDTO>(o => o.is_valid, 1, QueryMethod.Equal);
            pi.AddCondition<TywtravelguideDTO>(o => o.member_id, model.id, QueryMethod.Equal);
            //Response.Write(pi.ToSqlCondition());
            pi.OrderBy.Add("create_date", OrderByType.Desc);
            var list = BBlog.GetList(pi, ref TotalRows);
            if (list != null)
            {
                this.rptList.DataSource = list;
                this.rptList.DataBind();
            }
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
                #region 封面
                string CoverPhoto = GetAttachFile();
                #endregion
                //多图
                string listPohto = GetAttachFileList();
                if (String.IsNullOrWhiteSpace(listPohto))
                    listPohto = CoverPhoto;
                var Result = BBlog.Add(new TywtravelguideDTO { 
                    id=System.Guid.NewGuid().ToString(),
                    title = title,
                    content = content,
                    coverphoto = CoverPhoto,
                    type=Convert.ToString((int)游记类型.普通),
                    ptype="2",
                    status = 0,
                    top=0,
                    member_id = LoginModel.id,
                    publishtarget = Target,
                    is_valid=1,
                    create_date = DateTime.Now,
                    is_delete = 0,
                    create_userid = LoginModel.nickname
                });
                if (Result)
                {
                    MessageBox.ShowAndRedirect("添加成功！", "member_blogs.aspx");
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
                MessageBox.ShowAndRedirect("用户未登陆！", "/Default.aspx");
                return;
            }
        }
        /// <summary>
        /// 上传的封面
        /// </summary>
        /// <returns></returns>
        protected string GetAttachFile()
        {
            var files1 = UploadControl1.Files;
            var files2 = UploadControl1.YuanFiles;
            if (files1 != null && files1.Count > 0)
            {
                return files1[0].FilePath;
            }
            if (files2 != null && files2.Count > 0)
            {
                return files2[0].FilePath;
            }
            return string.Empty;
        }
        /// <summary>
        /// 上传的内图
        /// </summary>
        /// <returns></returns>
        protected string GetAttachFileList()
        {
            var files1 = UploadControl2.Files;
            var files2 = UploadControl2.YuanFiles;
            if (files1 != null && files1.Count > 0)
            {
                string filePath = "";
                for (int k = 0; k < files1.Count; k++) { filePath = filePath + files1[k].FilePath + ","; }
                return filePath.TrimEnd(',');
            }
            if (files2 != null && files2.Count > 0)
            {
                string filePath = "";
                for (int k = 0; k < files2.Count; k++) { filePath = filePath + files2[k].FilePath + ","; }
                return filePath.TrimEnd(',');
            }
            return string.Empty;
        }
    }
}