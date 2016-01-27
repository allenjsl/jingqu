<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="map.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.map" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DdC4MHxgaxt4XAjXAlnLAWIO"></script>
    <style type="text/css">
    .map_box{width:100%; min-height:200px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!--header begin-->
<header class="header center">
	<div class="hd-back font16">
		<a href="javascript:history.go(-1);">
			
		</a>
	</div>
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="login.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--nav begin-->
	<!--load begin-->
	
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->

		<div class="index-class">
        	<div class="about_search_box">
        	<div class="tabPanel">
            
                <div class="panes">
                    <div class="pane" style="display:block;">
                        <span><input type="text" class="search_text" id="gjStart"></span>
                        <span class="return_img"></span>
                        <span><input type="text" class="search_text" id="gjEnd" value="阳澄湖半岛" onBlur="if(this.value==''){this.value='阳澄湖半岛'};" onFocus="if(this.value=='阳澄湖半岛'){this.value=''};"></span>                        
                        <span><input type="button" id="gjsearch" class="return_button" value="搜索"></span>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="pane">
                        <span><input type="text" id="qcStart" class="search_text" value="请输入起点" onBlur="if(this.value==''){this.value='请输入起点'};" onFocus="if(this.value=='请输入起点'){this.value=''};"></span>
                        <span class="return_img"></span>
                        <span><input type="text" id="qcEnd" class="search_text" value="阳澄湖半岛" onBlur="if(this.value==''){this.value='阳澄湖半岛'};" onFocus="if(this.value=='阳澄湖半岛'){this.value=''};" ></span>                        
                        <span><input type="button" id="qcsearch" class="return_button" value="搜索"></span>
                        <div style="clear:both;"></div>
                        
                    </div>
                </div>
                
                <div class="tabPane2">
                    <ul>
                        <li class="hit">公交</li>
                        <li>驾车</li>
                    </ul>
                </div>            
            

        	</div>
            </div>            
        </div>		

	<!--inner-wrap end-->
    <div class="map_box" id="map">
</div>
<div class="map-box2 borderBox" id="r-result">
</div>
<div style="clear:both;"></div>
</div>
<!--outer-wrap end-->
<script src="../js/utils.js" type="text/javascript"></script>
<script src="../js/jquery-1.6.1.min.js"></script>
<!--选项卡-->
<script type="text/javascript">
    $(function () {
        $('.tabPanel ul li').click(function () {
            $(this).addClass('hit').siblings().removeClass('hit');
            $('.panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
        })
    })
</script>
<script type="text/javascript">
    var map;
    var lat = 31.418724;
    var lng = 120.783616;
    var marklist = [];
    var markchar = [];
    map = new BMap.Map('map');
    var point = new BMap.Point(lng, lat);
    //map.setCurrentCity("江苏");
    map.centerAndZoom(point, 16);
    map.enableScrollWheelZoom();

    $("#gjsearch").click(function () {
        map.clearOverlays(); 
        var start = $("#gjStart").val();
        var end = $("#gjEnd").val();
        /*
        var routePolicy = [BMAP_TRANSIT_POLICY_LEAST_TIME, BMAP_TRANSIT_POLICY_LEAST_TRANSFER, BMAP_TRANSIT_POLICY_LEAST_WALKING, BMAP_TRANSIT_POLICY_AVOID_SUBWAYS];
        map.clearOverlays();
        //var i = $("#driving_way select").val();
        search(start, end, routePolicy[0]);
        function search(start, end, route) {
        var transit = new BMap.TransitRoute(map, {
        renderOptions: { map: map },
        policy: route
        });
        transit.search(start, end);
        }
        */
        var transit = new BMap.TransitRoute(map, { renderOptions: { map: map }, onSearchComplete: function (result) {
            if (transit.getStatus() == BMAP_STATUS_SUCCESS) {
                var firstPlan = result.getPlan(0);
                // 绘制公交线路
                for (i = 0; i < firstPlan.getNumLines(); i++) {
                    var line = firstPlan.getLine(i);
                    map.addOverlay(new BMap.Polyline(line.getPath()));
                }
                // 输出方案信息
                var s = [];
                for (i = 0; i < result.getNumPlans(); i++) {
                    s.push((i + 1) + ". " + result.getPlan(i).getDescription());
                }
                document.getElementById("r-result").innerHTML = s.join("<br/>");
            }
        }
        });
        transit.search(start, end);
    });
    $("#qcsearch").click(function () {
        map.clearOverlays(); 
        var start = $("#qcStart").val();
        var end = $("#qcEnd").val();
        /*
        ////三种驾车策略：最少时间，最短距离，避开高速
        var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME, BMAP_DRIVING_POLICY_LEAST_DISTANCE, BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];
        map.clearOverlays();
        //var i = $("#driving_way select").val();
        search(start, end, routePolicy[0]);
        function search(start, end, route) {
        var transit = new BMap.TransitRoute(map, {
        renderOptions: { map: map },
        policy: route
        });
        transit.search(start, end);
        }
        */
        var driving = new BMap.DrivingRoute(map, { renderOptions: { map: map, panel: "r-result", autoViewport: true} });
        driving.search(start, end);
    });
    $("#map").css({ height: $(this).height() - $(".tabPanel").height() });
    </script>
    </form>
</body>
</html>
