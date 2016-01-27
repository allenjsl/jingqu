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
<title>Impression Peninsula-导览图</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/about.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/modernizr.custom.transform-media-queries.js"></script>
<script type="text/javascript" src="../js/html5shiv.js"></script> 
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
        <style type="text/css">
            .map {
                width:98%;height:600px;
            }
            </style>
</head>
    <body class="anchor-destination section-experiences page-experiences-single lang-en" data-permanent-class="anchor-destination lang-en" onload="loadmap();">
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
    <h2>Traffic guide</h2>
    </div>
        
	</section>
	<section class="about-main">
     
</section>
        <div class="map" id="map">
            </div>
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
        <script type="text/javascript">

            var mp;
            var lat = 31.418724;
            var lng = 120.783616;
            var marklist = [];
            var markchar = [];
            function loadmap() {
                mp = new BMap.Map('map');
                var point = new BMap.Point(lng, lat);
                //mp.setCurrentCity("江苏");
                mp.centerAndZoom(point, 16);
                mp.enableScrollWheelZoom();
            }
            function showpoint(data) {
                delmark();
                var lat = "";
                var lng = "";
                for (var i = 0; i < data.length ; i++) {
                    if (data[i].lat != null && data[i].lat != "") {
                        if (lat == "") {
                            lat = data[i].lat;
                            lng = data[i].lng;
                        }

                        var point = new BMap.Point(data[i].lng, data[i].lat);
                        point.searchLWData = data[i];
                        var m = new BMap.Marker(point);
                        m._config.title = data[i].name;
                        var mchar = new BMap.Label(i + 1, { offset: new BMap.Size(-6, -42), position: point });
                        mp.addOverlay(m);
                        mp.addOverlay(mchar);
                        m.addEventListener("click", function () {
                            var tmpPoint = this.getPosition();
                            SearchResultByInfo(tmpPoint.lng, tmpPoint.lat)
                        });
                        marklist.push(m);
                        markchar.push(mchar);
                    }
                }
                //mp.centerAndZoom(new BMap.Point(lng, lat));
                mp.panTo(new BMap.Point(lng, lat));
            }
            function delmark() {
                if (marklist != null && marklist.length > 0) {
                    for (var i = 0; i < marklist.length; i++) {
                        mp.removeOverlay(marklist[i]);
                    }
                    for (var i = 0; i < markchar.length; i++) {
                        mp.removeOverlay(markchar[i]);
                    }
                    marklist.length = 0;
                    markchar.length = 0;
                }
            }
            function gotopoint(lat, lng) {
                mp.panTo(new BMap.Point(lng, lat));
            }
    </script>
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="../js/oneself.js"></script> 
<script type="text/javascript" src="../js/default.randheli.min1.js"></script>
<script>
    var app = null;

    $(function () {
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

