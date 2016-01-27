<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="help_contact.aspx.cs" Inherits="Adpost.YCH.WEB.help.help_contact" %>
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
<title>联系我们</title>
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
                    <li><a href="help_map.aspx">站点地图</a></li>
                    <li><a href="help_contact.aspx" class="on">联系我们</a></li>
                </ul>
            </div>
            
            <div class="help_title"><h2>联系我们</h2></div>
            
            <div class="help_honor">
                <img src="../images/map.jpg">
                <p>地址：苏州工业园区阳澄湖半岛慈云路9号/ 邮编：215121</p>
                <p>电话：0512-67069999 / 传真：0512-67068899</p>
                <p>E-Mail：webmaster@sip-ych.com</p>
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

