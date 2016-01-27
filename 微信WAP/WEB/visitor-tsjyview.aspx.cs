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
using YCH.DataCenter.DTO.Base;
using ZFramework.Pager;
#endregion

namespace Adpost.YCH.WAP.WEB
{
    public partial class visitor_tsjyview : BasePage
    {
        protected string strScenicsList = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                System.Text.StringBuilder strHotspot = new System.Text.StringBuilder();
                strHotspot.Append("\nvar HotspotCount;\n");
                strHotspot.Append("\narrHotspot = new Array();\n");
                //景点
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                tmpStr.Append("<option value=\"0\">请选择</option>");
                var sList = BHotspot.GetScenicsList(Target);
                for (var i = 0; i < sList.Count(); i++)
                {
                    strHotspot.Append("\narrHotspot[" + i.ToString() + "] = new Array(\"" + sList[i].hotspot_name + "\"," + sList[i].type_id.ToString() + ",\"" + sList[i].id + "|" + sList[i].hotspot_name + "\");");
                    tmpStr.Append("<option value=\"" + sList[i].id + "|" + sList[i].hotspot_name + "\">" + sList[i].hotspot_name + "</option>");
                }
                strScenicsList = tmpStr.ToString();
                int rowCount = sList.Count();
                //酒店
                var hList = BHotspot.GetHotelsList(Target);
                for (var k = 0; k < hList.Count(); k++)
                {
                    strHotspot.Append("\narrHotspot[" + Convert.ToString(rowCount + k) + "] = new Array(\"" + hList[k].hotspot_name + "\"," + hList[k].type_id.ToString() + ",\"" + hList[k].id + "|" + hList[k].hotspot_name + "\");");
                }
                rowCount = rowCount + hList.Count();
                //餐馆
                var dList = BHotspot.GetRestaurantsList(Target);
                for (var k = 0; k < dList.Count(); k++)
                {
                    strHotspot.Append("\narrHotspot[" + Convert.ToString(rowCount + k) + "] = new Array(\"" + dList[k].hotspot_name + "\"," + dList[k].type_id.ToString() + ",\"" + dList[k].id + "|" + dList[k].hotspot_name + "\");");
                }
                rowCount = rowCount + dList.Count() + 1;
                strHotspot.Append("\nHotspotCount=" + rowCount.ToString() + ";");
                strHotspot.Append("\nfunction ChangHotspotList(HotspotField,ProvinceID,HotspotID){");
                strHotspot.Append("\nvar HotspotID = HotspotID;");
                strHotspot.Append("\nvar ProvinceID = ProvinceID;");
                strHotspot.Append("\nvar k = 0;\n");
                strHotspot.Append("\nvar HotspotField = HotspotField;");
                strHotspot.Append("\nHotspotField.length = 0;");
                strHotspot.Append("\nHotspotField.options[0]=new Option(\"请选择\",\"null\");");
                strHotspot.Append("\nfor (i=0;i<HotspotCount ;i++ ){");
                strHotspot.Append("\nif (arrHotspot[i][1] == ProvinceID){");
                strHotspot.Append("\nHotspotField.options[HotspotField.length]=new Option(arrHotspot[i][0],arrHotspot[i][2]);");
                strHotspot.Append("\nif (arrHotspot[i][2] == HotspotID){");
                strHotspot.Append("\nk = HotspotField.length-1;}}");
                strHotspot.Append("\n}\nHotspotField.options[k].selected = true;\n}");
                MessageBox.ResponseScript(strHotspot.ToString());
            }
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int Type = Utils.GetInt(Utils.GetFormValue("lb"));
            var hotspotId = Utils.GetFormValue("hotspotId").Split('|');
            string title = Utils.GetFormValue("title");
            string remark = Utils.GetFormValue("remark");
            if (hotspotId.Length != 2)
            {
                //MessageBox.ShowAndReturnBack("请选择对象!");
                //return;
            }
            var LoginModel = LoginCheck();
            BasehotspotopinionDTO model = new BasehotspotopinionDTO();
            model.id = System.Guid.NewGuid().ToString();
            model.title = title;
            if (hotspotId.Length != 2)
            {
                model.hotsopt_id = "0";
                model.business = "";
            }
            else
            {
                model.hotsopt_id = hotspotId[0];
                model.business = hotspotId[1];
            }
            model.content = remark;
            if (LoginModel != null)
                model.author = LoginModel.id;
            model.stime = DateTime.Now;
            model.state = 0;
            model.datasource = Target.ToString();
            model.source = ((YCHTarget)Target).ToString();
            model.type = Type;
            var Result = BHotspotOpinion.Add(model);
            if (Result)
            {
                MessageBox.ShowAndRedirect("添加成功！", "visitor-tsjy.aspx");
                return;
            }
            else
            {
                MessageBox.ShowAndReturnBack("添加失败！");
                return;
            }
        }
    }
}