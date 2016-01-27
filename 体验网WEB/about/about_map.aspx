<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about_map.aspx.cs" Inherits="Adpost.YCH.WEB.about.about_map" %>
<%@ Register src="/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="../WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="../WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html><!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head runat="server">
       <meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>印象半岛-导览图</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/about.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/modernizr.custom.transform-media-queries.js"></script>
<script type="text/javascript" src="../js/html5shiv.js"></script> 
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DdC4MHxgaxt4XAjXAlnLAWIO"></script>
 <style type="text/css">
body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
.map {height:600px;}
#TrafficInfo{width:350px;float:left;}
#r-result,#r-result table{width:100%;}
 </style>
</head>
    <body class="anchor-destination section-experiences page-experiences-single lang-en" data-permanent-class="anchor-destination lang-en">
<form id="form1" runat="server">
<div id="main">
    
	<div class="header-mask"></div>
	<uc2:WebHeader ID="WebHeader1" runat="server" />  
            
    <section class="scroll">
        <span class="arrow"><span class="bar bar-2"></span><span class="bar bar-3"></span></span>
        <div class="text">Scroll down to discover more</div>
    </section>
    <!--主体内容 BEGIN-->        
    <section class="page">
    <section class="head anchor-destination">
    <div class="description">
    <span class="separator"><img src="../images/title_list4.png"></span>
    <h2>交通指南</h2>
    </div>
        
	</section>
	<section class="about-main">
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
</section> 
<div id="TrafficInfo">
<div id="r-result"></div>
 </div>      
<div class="map" id="map"></div>
<div style="clear:both;"></div>

	<!--返回顶部 BEGIN-->
    <section class="go-top"> 
        <a href="#" class="anchor top-of-page">
        	<span class="animated-picto">
        		<img width="69" height="61" src="../images/home.png" alt="" />
        	</span>
        	<span class="separator"></span>
        	<span class="text">回到顶部</span>
        </a> 
    </section>
    <!--底部内容 BEGIN-->
    <uc3:WebFooter ID="WebFooter1" runat="server" /> 


    </section>
</div>
 <uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />
  </form>  
        
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="../js/oneself.js"></script> 
<script type="text/javascript" src="../js/default.randheli.min1.js"></script>
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
                var transit = new BMap.TransitRoute(map, {
                    renderOptions: { map: map, panel: "r-result" }
                });
                transit.search(start, end);
            });
            $("#qcsearch").click(function () {
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
                var driving = new BMap.DrivingRoute(map, {renderOptions: {map: map, panel: "r-result", autoViewport: true}});
                driving.search(start, end);
            });
    </script>
<script>
    var app = null;

    $(function () {
        $(function () {
            $('.tabPanel ul li').click(function () {
                $(this).addClass('hit').siblings().removeClass('hit');
                $('.panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
            })
        })
        app = new App(
			null,
			{
			    section: 'experiences',
			    page: 'experiences-single',
			    env: 'production',
			    base_url: 'index.htm',
			    header_open: 'default',
			    is_tablet: false,
			    fixedTop: 0,
			    is_mobile: false
			}
		);
    });
</script>
<script type="text/javascript" src="../js/jquery.nicescroll.js"></script>
<script type="text/javascript">
    $("#sucai6,#sucai7,#sucai8").niceScroll({
        cursorcolor: "#00BFDB",
        cursoropacitymax: 1,
        touchbehavior: false,
        cursorwidth: "5px",
        cursorborder: "0",
        cursorborderradius: "3px"
    });
</script>
</body>
</html>

