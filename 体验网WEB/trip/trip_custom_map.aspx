<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trip_custom_map.aspx.cs" Inherits="Adpost.YCH.WEB.trip.trip_custom_map" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html>
  <!--[if lt IE 7]>
  <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en">
  <![endif]-->
  <!--[if IE 7]>
  <html class="no-js lt-ie9 lt-ie8" lang="en">
  <![endif]-->
  <!--[if IE 8]>
  <html class="no-js lt-ie9" lang="en">
  <![endif]-->
  <!--[if gt IE 8]><!-->
  <html class="no-js" lang="en">
  <!--<![endif]-->
  <head runat="server">
  <meta charset="UTF-8">
  <title>旅行印记-个性定制</title>
  <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
  <link href="../css/reset.css" rel="stylesheet" type="text/css" >
  <link href="../css/style1.css" rel="stylesheet" type="text/css" >
  <link href="../css/datepicker.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../css/trip.css">
  <link rel="stylesheet" type="text/css" href="../css/public.css">
  <link type="text/css" rel="stylesheet" href="../css/simplePagination.css"/>
  <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="../js/jquery.SuperSlide.2.1.js"></script>
  <script type="text/javascript" src="../js/modernizr.custom.transform-media-queries.js"></script>
  <script type="text/javascript" src="../js/html5shiv.js"></script>
  <script src="http://api.map.baidu.com/api?v=2.0&ak=DdC4MHxgaxt4XAjXAlnLAWIO"></script>
  
  <style type="text/css">
body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
#map_canvas{width:100%;height:500px;}
 </style>
</head>
<body class="anchor-destination section-experiences page-experiences-single lang-en" data-permanent-class="anchor-destination lang-en">
<form id="form1" runat="server">
<div id="main">
  <div class="header-mask"></div>
    <!--header begin-->
    <uc2:WebHeader ID="WebHeader1" runat="server" />
    <!--header end-->  
    
    <section class="scroll">
      <span class="arrow"><span class="bar bar-2"></span><span class="bar bar-3"></span></span>
      <div class="text">Scroll down to discover more</div>
    </section>
    
    <!--主体内容 BEGIN--> 
    <section class="page">
      <section class="trip_body clearfix">        
        <div class="trip-title">
            <p class="blue"><a href="trip_line.aspx">路线推荐</a></p>
            <p class="green"><a href="trip_custom.aspx">个性定制</a></p>
        </div><div style="clear:both;"></div>
         <div style=" margin-top:10px;">
         <asp:Literal ID="ltrDayLink" runat="server"></asp:Literal>
        </div>
        <div class="trip_main">
		<div class="trip_main_lt left">
                                 <!--内置放 百度地图 -->    
                <div style="min-height:500px;">
              
                
                 <div id="map_canvas"></div>   <div id="allmap" style="display:none"></div>  
                </div>
                </div>
		
<!-- -->
<div class="trip_main_rt right">
                  <div class="day-box">
                    <div class="day-num left">D<%=Days%></div>
                    <div class="day-text left">
                      <h5><asp:Literal ID="ltrDate" runat="server"></asp:Literal></h5>
                      <h3><asp:Literal ID="ltrTitle" runat="server"></asp:Literal></h3>
                    </div>                    
                  </div>
                  <div class="daycon-box">
                  <asp:Literal ID="ltrInfo" runat="server"></asp:Literal>
                  </div>
                </div>

<!-- -->


              </div>

              <div style="clear:both;"></div>
            </section>
            <div style="clear:both;"></div>
            <section class="go-top">
              <a href="#" class="anchor top-of-page"><span class="animated-picto"><img width="69" height="61" src="../images/home.png" alt="" /></span><span class="separator"></span><span class="text">回到顶部</span></a>
            </section>
             <uc3:WebFooter ID="WebFooter1" runat="server" />
          </section>
    <!--主体内容 END--> 
    </div>
        <uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />   
</form>  
<script type="text/javascript">
    var lat = 31.418724;
    var lng = 120.783616;
    var map = new BMap.Map("map_canvas");
    map.centerAndZoom(new BMap.Point(lng, lat), 15);
    //标注
    var marker;
    <%=MapMarkInfo %>

    var myP1 = <%=StartPoint %>;    //起点
    var myP2 = <%=EndPoint %>;    //终点
    var myIcon = new BMap.Icon("http://developer.baidu.com/map/jsdemo/img/car.png", new BMap.Size(52, 26), {    //小车图片
        //offset: new BMap.Size(0, -5),    //相当于CSS精灵
        imageOffset: new BMap.Size(0, 0)    //图片的偏移量。为了是图片底部中心对准坐标点。
    });
    <%=MapPointInfo %>  
    //计算车程和时间
    function GetDrivingInfo(id, longitude1, latitude1, longitude2, latitude2) {
        var map = new BMap.Map("allmap");
        map.centerAndZoom(new BMap.Point(lng, lat), 15);
        // 百度地图API功能
        var sP1 = new BMap.Point(longitude1, latitude1);    //起点
        var sP2 = new BMap.Point(longitude2, latitude2);    //终点
        var v1, v2;
        var searchComplete = function (results) {
            if (transit.getStatus() != BMAP_STATUS_SUCCESS) {
                return;
            }
            var plan = results.getPlan(0);
            v1 = plan.getDuration(true);                //获取时间
            v2 = plan.getDistance(true) + "\n";             //获取距离
        }
        var transit = new BMap.DrivingRoute(map, { renderOptions: { map: map },
            onSearchComplete: searchComplete,
            onPolylinesSet: function () {
                setTimeout(function () {
                    //alert("相距" + v2 + "，步行需" + v1);
                    $("#" + id).text("相距" + v2 + "，驾车需" + v1);
                }, "1000");
            }
        });
        transit.search(sP1, sP2);
    }     
    <%=mapTimeMileInfo %>
</script>
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
        <!--分页-->
        <script type="text/javascript" src="../js/jquery.simplePagination.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#paging1,#paging2").pagination({
                    items: 18,
                    itemsOnPage: 3,
                    cssStyle: 'light-theme'
                });
            });
        </script>
        <!--选项卡-->
        <script type="text/javascript">
            $(function () {
                $('.tabPane ul li').click(function () {
                    $(this).addClass('hit').siblings().removeClass('hit');
                    $('.panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
                })
            })
        </script>
<script src="../js/prettify.js"></script>
    <script src="../js/jquery.js"></script>

</body>
</html>