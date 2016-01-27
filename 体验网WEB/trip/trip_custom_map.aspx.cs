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

namespace Adpost.YCH.WEB.trip
{
    public partial class trip_custom_map : BasePage
    {
        protected string MapPointInfo = "",MapMarkInfo="",MapDriverInfo="",mapTimeMileInfo = "";
        protected string StartPoint = "", EndPoint = "";
        protected int Days = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = Utils.GetQueryStringValue("Id");
                Days = Utils.GetInt(Utils.GetQueryStringValue("Day"),1);
                if (!String.IsNullOrWhiteSpace(Id))
                {
                    InitMapPoint(Id, Days);
                }
                else
                {
                    MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                    return;
                }
            }
        }
        private void InitMapPoint(string Id, int Days)
        {
            var tmodel = BMyTravelline.GetLastModel(Id);
            if (tmodel != null)
            {
                string DayLink = "";
                for (int i = 1; i <= tmodel.days; i++)
                {
                    if (i == Days)
                    {
                        DayLink += "<p class=\"trip-btnon\"><a href=\"trip_custom_map.aspx?Id=" + Id + "&Day=" + i + "\">第" + i + "天</a></p>";
                    }
                    else { DayLink += "<p class=\"trip-btn\"><a href=\"trip_custom_map.aspx?Id=" + Id + "&Day=" + i + "\">第" + i + "天</a></p>"; }
                }
                string[] Day = new string[] { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
                string week = Day[Convert.ToInt32(tmodel.begindate.Value.DayOfWeek.ToString("d"))].ToString();
                this.ltrDate.Text = tmodel.begindate.Value.ToString("yyyy-MM-dd") + " " + week;
                this.ltrTitle.Text = tmodel.title;
                this.ltrDayLink.Text = DayLink;
                List<TywmytravellineDTO> ItemList = null;
                int rowsCount = 0;
                System.Text.StringBuilder tmpStr = new System.Text.StringBuilder();
                ItemList = BMyTravelline.GetList(Target, Id, Days);
                if (ItemList != null)
                {
                    string pa = "", pb = "", p1 = "", p2 = "", p3 = "", p4 = "";
                    System.Text.StringBuilder strItem = new System.Text.StringBuilder();
                    rowsCount = ItemList.Count();
                    int intWaypoints = rowsCount - 2;//所有结点减去开始和结束两个点
                    //开始结点
                    var HostpostModel = BHotspot.GetModel(ItemList[0].hotspot_id);
                    if (HostpostModel != null)
                    {
                        StartPoint = "new BMap.Point(" + HostpostModel.longitude + ", " + HostpostModel.latitude + ")";   
                    MapMarkInfo += "marker = new BMap.Marker(new BMap.Point(" + HostpostModel.longitude + ", " + HostpostModel.latitude + ")); \nmap.addOverlay(marker);\nvar label = new BMap.Label(\"" + HostpostModel.hotspot_name + "\",{offset:new BMap.Size(20,-10)});marker.setLabel(label);";
                    strItem.Append("<h3 class=\"h3-jd\"><i class=\"icon-day\">1</i>" + HostpostModel.hotspot_name + "</h3>\n<div class=\"daytext-box clearfix\">\n<img src=\"" + Common.PhotoSplit(Common.NoPhotoDefault(HostpostModel.coverphoto.ToString()), 0) + "\">\n<p>游玩时间：" + HostpostModel.tourtime + "</p>\n<p>描述：" + Utils.GetText(StringValidate.LoseHtml(HostpostModel.intro.ToString()), 30) + "</p>\n</div>\n<h3 class=\"h3-bx\"><i class=\"icon-bx\"></i></h3>");
                       pa= p1=HostpostModel.longitude;
                        pb=p2 = HostpostModel.latitude;
                    }
                    if (rowsCount > 2)
                    {
                        for (int i = 1; i < rowsCount - 1; i++)
                        {
                            HostpostModel = BHotspot.GetModel(ItemList[i].hotspot_id);
                            if (HostpostModel != null)
                            {
                                MapMarkInfo += "marker = new BMap.Marker(new BMap.Point(" + HostpostModel.longitude + ", " + HostpostModel.latitude + ")); \nmap.addOverlay(marker);\nvar label = new BMap.Label(\"" + HostpostModel.hotspot_name + "\",{offset:new BMap.Size(20,-10)});marker.setLabel(label);";
                                //记录途经结点
                                tmpStr.Append("m" + i + " = new BMap.Marker(new BMap.Point(" + HostpostModel.longitude + ", " + HostpostModel.latitude + "));\n ");
                                if (i > 1)
                                {
                                    pa = p1;
                                    pb = p2;
                                }
                                p1 = HostpostModel.longitude;
                                p2 = HostpostModel.latitude;
                                p3 = HostpostModel.longitude;
                                p4 = HostpostModel.latitude;
                                strItem.Append("<h3 class=\"h3-jd\"><i class=\"icon-day\">" + Convert.ToString(i + 1) + "</i>" + HostpostModel.hotspot_name + "</h3>\n<div class=\"daytext-box clearfix\">\n<img src=\"" + Common.PhotoSplit(Common.NoPhotoDefault(HostpostModel.coverphoto.ToString()), 0) + "\">\n<p>游玩时间：" + HostpostModel.tourtime + "</p>\n<p>描述：" + Utils.GetText(StringValidate.LoseHtml(HostpostModel.intro.ToString()), 30) + "</p>\n</div>\n<h3 class=\"h3-bx\"><i class=\"icon-bx\"></i><div id=\"spanI" + i + "\"></div></h3>");
                                mapTimeMileInfo += "GetDrivingInfo(\"spanI" + i + "\"," + pa + "," + pb + "," + p3 + "," + p4 + ");";
                            }
                        }
                    }
                    //终点结点
                    HostpostModel = BHotspot.GetModel(ItemList[rowsCount - 1].hotspot_id);
                    if (HostpostModel != null)
                    {
                        EndPoint = "new BMap.Point(" + HostpostModel.longitude + ", " + HostpostModel.latitude + ")";
                    
                    MapMarkInfo += "marker = new BMap.Marker(new BMap.Point(" + HostpostModel.longitude + ", " + HostpostModel.latitude + ")); \nmap.addOverlay(marker);\nvar label = new BMap.Label(\"" + HostpostModel.hotspot_name + "\",{offset:new BMap.Size(20,-10)});marker.setLabel(label);";
                    strItem.Append("<h3 class=\"h3-jd\"><i class=\"icon-day\">" + Convert.ToString(rowsCount + 1) + "</i>" + HostpostModel.hotspot_name + "</h3>\n<div class=\"daytext-box clearfix\">\n<img src=\"" + Common.PhotoSplit(Common.NoPhotoDefault(HostpostModel.coverphoto.ToString()), 0) + "\">\n<p>游玩时间：" + HostpostModel.tourtime + "</p>\n<p>描述：" + Utils.GetText(StringValidate.LoseHtml(HostpostModel.intro.ToString()), 30) + "</p>\n</div>\n<h3 class=\"h3-bx\"><i class=\"icon-bx\"></i><div id=\"spanI" + rowsCount + "\"></div></h3>");
                    mapTimeMileInfo += "GetDrivingInfo(\"spanI" + rowsCount + "\"," + p3 + "," + p4 + "," + HostpostModel.longitude + ", " + HostpostModel.latitude + ");";
                    }
                    tmpStr.Append("var driving2 = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});\n");
                    this.ltrInfo.Text = strItem.ToString();
                    string PointVar = "";
                    for (int j = 1; j <= intWaypoints; j++)
                    {
                        PointVar += "m" + j + ",";                        
                    }
                    if (intWaypoints > 0)
                    {
                        tmpStr.Append("driving2.search(myP1, myP2,{waypoints:[" + PointVar.TrimEnd(',') + "]});\n");
                    }
                    else {
                        tmpStr.Append("driving2.search(myP1, myP2);\n");
                    }
                    MapPointInfo = tmpStr.ToString();
                }
                else
                {
                    MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                    return;
                }                
            }
            else
            {
                MessageBox.ShowAndReturnBack("未找到您要查看的信息");
                return;
            }
        }
    }
}