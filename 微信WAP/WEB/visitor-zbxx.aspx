<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visitor-zbxx.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.visitor_zbxx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>阳澄湖半岛旅游度假区</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<script src="../js/zepto.min.js" type="text/javascript"></script>    
</head>
<body>
    <form id="form1" runat="server">
    <!--header begin-->
<header class="header center">
	<div class="hd-back font16">
		<a href="javascript:void(0);">
			
		</a>
	</div
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="login.aspx"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--nav begin-->
	<!--load begin--><!--
		<div class="in-nav yk-nav posR">
			<div id="fmnavObj">
            	<ul class="in-nav-box posA">
                    <li class="borderBox"><a href="visitor.aspx">功能介绍</a></li>
                    <li class="borderBox"><a href="visitor-wjdc.aspx">问卷调查</a></li>
                    <li class="borderBox"><a href="visitor-cjwt.aspx">常见问答</a></li>
                    <li class="borderBox"><a href="visitor-tsjy.aspx">投诉建议</a></li>
                    <li class="borderBox active"><a href="visitor-zbxx.aspx">周边信息</a></li>
                </ul>
            </div>
			
		</div>
			-->
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
    <div class="topclumbLayout topclumbRecommend">
		<span></span>
		<p class="Fleft">周边推荐</p>
		<div class="recommendConTopDistance_Prel">
			<em></em>
			<div class="recommendConTopDistanceCaption">500米以内</div>
			<div class="recommendConTopDistanceList" style="display:none;">
				<a href="#">500米以内</a>
				<a href="#">1000米以内</a>
				<a href="#">1500米以内</a>
				<a href="#">2000米以内</a>
			</div>
		</div>
	</div>
	<div class="navigationLayout">
		<div class="navigationConMap">
          <div id="showMap"></div>
		</div>
		<!--
		<div class="recommendConTopDistance" style="display:none;">
			<div class="recommendConTopDistance_Prel">
				<div class="recommendConTopDistanceCaption">1000米以内</div>
				<div class="recommendConTopDistanceList" style="display:none;">
					<a href="#">500米以内</a>
					<a href="#">400米以内</a>
					<a href="#">300米以内</a>
					<a href="#">200米以内</a>
				</div>
			</div>
		</div>
		-->
		<div class="recommendContainerList">
			<ul>
				<li>
					<div class="recommendConListNote recommendConListNote_1" style="display:none;">美食</div>
					<div class="recommendConListIcon recommendConListIcon_1"></div>
				</li>
				<li>
					<div class="recommendConListNote recommendConListNote_2" style="display:none;">住宿</div>
					<div class="recommendConListIcon recommendConListIcon_2"></div>
				</li><!--
				<li >
					<div class="recommendConListNote recommendConListNote_3" style="display:none;">出行</div>
					<div class="recommendConListIcon recommendConListIcon_3"></div>
				</li>
				--><li class="on">
					<div class="recommendConListNote recommendConListNote_4" >景点</div>
					<div class="recommendConListIcon recommendConListIcon_4" ></div>
				</li>
				<li>
					<div class="recommendConListNote recommendConListNote_5" style="display:none;">购物</div>
					<div class="recommendConListIcon recommendConListIcon_5"></div>
				</li>
				<li>
					<div class="recommendConListNote recommendConListNote_6" style="display:none;">娱乐</div>
					<div class="recommendConListIcon recommendConListIcon_6"></div>
				</li>
				<li  >
					<div class="recommendConListNote recommendConListNote_7" style="display:none;">公厕</div>
					<div class="recommendConListIcon recommendConListIcon_7"></div>
				</li>				
			</ul>
		</div>
		<div class="recommendContainer" style="display:none">
			<img src="images/recommendContainerIcon_1_11.png" />
			<img src="images/recommendContainerIcon_2_11.png" />
		</div>
		<div class="navigationFooterBg"></div>
		<div class="navigationFooter">
			<div class="indexFooterCopyRight"></div>
			<div class="indexFooterCon"></div>
			<div class="clear"></div>
		</div>
	</div>	
	
	<!--弹出层-->
	<div  id="layout" style="display:none;">
		<div class="recommendPopBg"></div>
		<div class="recommendPopLayout">
			<div class="recommendPopClose"><a href="#"></a></div>
			<div class="clear"></div>
			<div class="recommendPopMain">
				<div class="recommendPopMainPic"  style="display:none;"><img src="" /></div>
				<div class="recommendPopMainCon">
					<div class="recommendPopMainCon recommendPopMainCon_1">
						<span>名称:</span> 
					</div>
					<div class="recommendPopMainCon recommendPopMainCon_4" id="recommendPopMainCon_2">
						<span>距离:</span>25
					</div>
					<div class="recommendPopMainCon recommendPopMainCon_3" id="recommendPopMainCon_3" style="display:none">
						<span>开放时间:</span>
						<p>1. 旺季（4月1日~10月31日），07:00~18:00</p>
						<p>2. 淡季（11月1日~3月31日），07:30~17:30</p>
					</div>
					<div class="recommendPopMainCon recommendPopMainCon_4" id="recommendPopMainCon_4">
						<span>地址:</span>
					</div>
					<div class="recommendPopMainCon recommendPopMainCon_5">

					</div>
				</div>
			</div>
		</div>	
	</div> 
        

	<!--inner-wrap end-->

	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->

<script src="../js/utils.js" type="text/javascript"></script>
<script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DdC4MHxgaxt4XAjXAlnLAWIO"></script>
<script type="text/javascript"  src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script>

    $(function () {
        var templongitude
        var templatitude
        var local;
        var infoBox;
        var isShow = false;
        var point;
        var longitude;
        var latitude;
        var type = 2
        var distance = 500
        var map = new BMap.Map("showMap");
        var my_keyword = new Array("美食", "酒店", "景点", "购物", "娱乐", "公共厕所")
        var show_img = new Array("images/chi.jpg", "images/zhu.jpg", "images/xing.jpg", "images/gou.jpg", "images/yu.jpg", "images/cesuo.jpg")
        var my_img = new Array("images/meishi.png", "images/zhusu.png", "images/jingdian.png", "images/gouwu.png", "images/yule.png", "images/cesuo.png")
        var initMap = function (longitude, latitude, index) {
            point = new BMap.Point(longitude, latitude);
            map.centerAndZoom(point, 16);
            /*
            var marker = new BMap.Marker(point);  // 创建标注
            map.addOverlay(marker);               // 将标注添加到地图中
            marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            */

            var myIcon = new BMap.Icon("images/dangqian.png", new BMap.Size(30, 40));
            var marker = new BMap.Marker(point, { icon: myIcon });
            map.addOverlay(marker);
            setTimeout("moveToCenter()", 500);
            searchData(longitude, latitude, my_keyword[index], 20, distance, my_img[index]);
        };
        moveToCenter = function () {
            map.centerAndZoom(point, 16);
            $(".anchorBL").remove();
        }
        //车联网搜索
        var searchData = function (longitude, latitude, keyword, number, radius, img) {
            var url = "http://api.map.baidu.com/telematics/v3/local?location=" + longitude + "," + latitude + "&keyWord=" + keyword + "&number=" + number + "&radius=" + radius + "&output=json&ak=DdC4MHxgaxt4XAjXAlnLAWIO&coord_type=bd09ll&out_coord_type=bd09ll&sort_rule=0"
            $.ajax({
                type: "GET",
                url: url,
                dataType: "jsonp",
                beforeSend: function (request) {
                    //如要指定HOST可以设置HOST  request.setRequestHeader("host", "域名");
                },
                success: function (data) {
                    console.log(data);
                    if (data.status == "Success") {
                        for (var index in data.pointList) {
                            var item = data.pointList[index];
                            var point = new BMap.Point(item.location.lng, item.location.lat);
                            addMarker(point, item, img);
                        }
                    }
                }
            });

        }
        function load_script(xyUrl, callback) {
            var head = document.getElementsByTagName('head')[0];
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.src = xyUrl;
            //借鉴了jQuery的script跨域方法
            script.onload = script.onreadystatechange = function () {
                if ((!this.readyState || this.readyState === "loaded" || this.readyState === "complete")) {
                    callback && callback();
                    // Handle memory leak in IE
                    script.onload = script.onreadystatechange = null;
                    if (head && script.parentNode) {
                        head.removeChild(script);
                    }
                }
            };
            // Use insertBefore instead of appendChild  to circumvent an IE6 bug.
            head.insertBefore(script, head.firstChild);
        }
        // 编写自定义函数,创建标注
        function addMarker(point, item, img) {
            var myIcon = new BMap.Icon(img, new BMap.Size(30, 30));
            var marker = new BMap.Marker(point, { icon: myIcon });
            marker.addEventListener("click", function () {
                //item.name
                //item.address
                //item.distance 
                //price
                // alert(item.additionalInformation.telephone)
                var direction = "http://api.map.baidu.com/marker?location=" + item.location.lat + "," + item.location.lng + "&title=" + item.name + "&output=html";

                $(".recommendPopMainCon_1").html("<span>名称:</span>" + item.name)
                $("#recommendPopMainCon_2").html("<span>距离:</span>" + item.distance + "米" + "<a href='" + direction + "' >【去这里】</a>")
                $("#recommendPopMainCon_4").html("<span>地址:</span>" + item.address)
                //$(".recommendPopMainPic img").attr("src",show_img[type])
                if (item.additionalInformation != undefined) {
                    if (item.additionalInformation.telephone != "") {
                        var telphone = item.additionalInformation.telephone.replace("(", "");
                        telphone = telphone.replace(")", "");
                        $(".recommendPopMainCon_5").html("<span>电话:</span>" + item.additionalInformation.telephone + "<a href='tel:" + telphone + "'>拨号</a>")
                    }
                }
                $("#layout").show();
            });
            map.addOverlay(marker);
        }
        //关闭按钮
        $(".recommendPopClose a").click(function () {
            $("#layout").hide()
        })
        //搜索
        var searchDataEx = function (keyword, center, radius) {
            local.searchNearby(keyword, center, radius);
        }

        var system = {
            win: false,
            mac: false,
            xll: false
        };
        //检测平台
        var p = navigator.platform;
        system.win = p.indexOf("Win") == 0;
        system.mac = p.indexOf("Mac") == 0;
        system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
        //跳转语句，如果是手机访问就自动跳转到wap.seostudying.com页面
        if (system.win || system.mac || system.xll) {
            longitude = 120.783616;
            latitude = 31.418724;
            initMap(longitude, latitude, type);
        } else {
            var geo = navigator.geolocation;
            geo.getCurrentPosition(function (pos) {
                var coord = pos.coords;
                var gpsPoint = new BMap.Point(coord.longitude, coord.latitude);
                var callbackName = 'cbk_' + Math.round(Math.random() * 10000);    //随机函数名
                var xyUrl = "http://api.map.baidu.com/ag/coord/convert?from=0&to=4&x=" + gpsPoint.lng + "&y=" + gpsPoint.lat + "&callback=BMap.Convertor." + callbackName;
                //动态创建script标签
                load_script(xyUrl);
                BMap.Convertor[callbackName] = function (xyResult) {
                    longitude = window.atob(xyResult.x);
                    latitude = window.atob(xyResult.y);
                    initMap(longitude, latitude, type);
                }

            },
		function (error) {
		    longitude = 120.783616;
		    latitude = 31.418724;
		    initMap(longitude, latitude, 2);
		});
        }

        var setMapHeight = function () {
            $(".navigationLayout").css({ height: $(this).height() - $(".topclumbLayout").height() });
            $("#showMap").css({ height: $(this).height() - $(".topclumbLayout").height() });
        };
        $(window).load(function () {
            setMapHeight();
        });
        $(window).resize(function () {
            setMapHeight();
        });
        $(".recommendContainerList li").click(function () {
            //$(".recommendContainerList li").removeClass("on")
            $(".recommendContainerList li").each(function () {
                $(this).find("div").eq(0).fadeOut(100);
            });
            $(this).find("div").eq(0).fadeIn(100);

            $(this).addClass("on");
            $(this).siblings().removeClass("on");

            map.clearOverlays()
            type = $(this).index()
            initMap(longitude, latitude, type);
        })
        $(".recommendConTopDistanceCaption").click(function () {
            $(".recommendConTopDistanceList").fadeToggle()
        })
        $(".recommendConTopDistanceList a").click(function () {
            switch ($(this).index()) {
                case 0: distance = 500; break;
                case 1: distance = 1000; break;
                case 2: distance = 1500; break;
                case 3: distance = 2000; break;

            }
            $(".recommendConTopDistanceCaption").text($(this).text())
            $(".recommendConTopDistanceList").fadeToggle()
            map.clearOverlays()
            initMap(longitude, latitude, type);
        });
        document.addEventListener("WeixinJSBridgeReady", function () { WeixinJSBridge.call("hideOptionMenu"); });
    });
</script>
    </form>
</body>
</html>
