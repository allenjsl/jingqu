<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="help_map.aspx.cs" Inherits="Adpost.YCH.WEB.help.help_map" %>
<%@ Register src="/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="../WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="../WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js" lang="en"> <!--<![endif]-->
<head runat="server">
<meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>站点地图</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/travel.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">

<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.SuperSlide.2.1.js"></script>

<script type="text/javascript" src="../js/modernizr.custom.transform-media-queries.js"></script>
<script type="text/javascript" src="../js/html5shiv.js"></script> 

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
                

<section class="travel_shopping_list_main">
	<div class="shopping_list_body">
    
    	<div class="shopping_list_leftmenu">
        	<ul>
                <li><a href="help_link.aspx">友情链接</a></li>
                <li><a href="help_map.aspx" class="on">站点地图</a></li>
                <li><a href="help_contact.aspx">联系我们</a></li>
            </ul>
        </div>
        
    	<div class="help_title"><h2>站点地图</h2></div>
        
        <div class="help_map">
        	<table>
            	<tr>
                	<td width="15%">印象半岛</td>
                    <td width="85%"><a href="../about/about_introduce.aspx" target="_blank">半岛纵览</a><a href="../about/about_multivariate.aspx" target="_blank">多元半岛</a><a href="../news/news_information.aspx" target="_blank">新闻资讯</a><a href="../news/news_notice.aspx" target="_blank">通知公告</a></td>
                </tr>
                <tr>
                	<td>缤纷旅程</td>
                    <td><a href="../news/news_event.aspx" target="_blank">特色活动</a><a href="../about/about_scenic.aspx" target="_blank">景点推荐</a><a href="../traveling/travel_food.aspx" target="_blank">美食推荐</a><a href="../traveling/travel_hotel.aspx" target="_blank">酒店推荐</a><a href="../traveling/travel_shopping.aspx" target="_blank">购物推荐</a><a href="../traveling/travel_entertainment.aspx" target="_blank">娱乐推荐</a><a href="../news/news_sale.aspx" target="_blank">特惠活动</a></td>
                </tr>
                <tr>
                	<td>悠程订制</td>
                    <td><a href="../about/about_location.aspx" target="_blank">半岛位置</a><a href="../about/about_map.aspx" target="_blank">交通指南</a><a href="../trip/trip_line.aspx" target="_blank">行程规划</a><a href="../about/VisualTravel.aspx" target="_blank">虚拟游</a></td>
                </tr>
                <tr>
                	<td>心情印记</td>
                    <td><a href="../share/share_video.aspx" target="_blank">视频集锦</a><a href="../share/share_shadow.aspx" target="_blank">光影记录</a><a href="../share/share_blogs.aspx" target="_blank">光影记录</a></td>
                </tr>
                <tr>
                	<td>旅游服务</td>
                    <td><a href="../share/share_youke.aspx" target="_blank">游客中心</a><a href="../share/share_surveys.aspx" target="_blank">问卷调查</a><a href="../share/share_lodge.aspx" target="_blank">意见建议</a><a href="../share/share_qa.aspx" target="_blank">问题解答</a><a href="../member/member_info.aspx" target="_blank">会员中心</a></td>
                </tr>
                <tr>
                	<td>其他</td>
                    <td><a href="help_about.html" target="_blank">公司简介</a><a href="help_policy.aspx" target="_blank">个人隐私保护方针</a><a href="help_link.aspx" target="_blank">友情链接</a><a href="help_map.aspx" target="_blank">站点地图</a><a href="help_contact.html" target="_blank">联系我们</a><a href="#" target="_blank">政务网</a><a href="#" target="_blank">移动端相关</a></td>
                </tr>
            </table>
        </div>
		
       
        
    </div>
    
</section>




            </section>
<!--主体内容 END--> 
</div>
  <uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />
</form>   
    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/oneself.js"></script>
    <script type="text/javascript" src="../js/MyCxcPlug.js"></script>       
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
			    fixedTop: 0,
			    is_tablet: false,
			    is_mobile: false
			}
		);
    });
</script>
        

<script type="text/javascript" src="../js/jquery.nicescroll.js"></script>
<script type="text/javascript">
    $("#sucai").niceScroll({
        cursorcolor: "#009B00",
        cursoropacitymax: 1,
        touchbehavior: false,
        cursorwidth: "5px",
        cursorborder: "0",
        cursorborderradius: "3px"
    });
</script>

<script type="text/javascript">
    $(document).ready(function (e) {
        $(".message_click").click(function () {

            var html = '<table><tr><td colspan="2">0/140</td></tr><tr><td><textarea class="messages_txra4"></textarea></td><td><a href="#">发表</a></td></tr></table>'
            var messageDiv = $(this).parents("li").find(".message_reply").html();
            var messageDiv1 = $(this).parents("li").find(".message_reply1").html();
            if (messageDiv == "") {
                $(this).parents("li").find(".message_reply").append(html).addClass("message_reply_border");
            }
            if (messageDiv1 == "") {
                $(this).parents("li").find(".message_reply1").append(html).addClass("message_reply_border");
            }

        });


        $(".picScroll li").mousemove(function () {
            $(this).find("p").addClass("pic_p2")
        }).mouseleave(function () {
            $(this).find("p").removeClass("pic_p2").addClass("pic_p1")

        });

    });
</script>

<!--弹出层-->
<script type="text/javascript" src="../js/MyCxcPlug.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".food_list_content_btn").click(function () {
            Popuplayer({
                LayerId: "Monver",//层ID
                Masklayer: "cxc",//遮罩层ID
                CloseID: "close",//退出id
                Fun: function () { } //关闭时是否回调函数
            });
        });
    });
</script>

<!--星级打分-->
<script type="text/javascript" src="../js/comment.js"></script>

    </body>
</html>

