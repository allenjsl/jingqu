<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about_scenic.aspx.cs" Inherits="Adpost.YCH.WEB.about.about_scenic" %>
<%@ Register src="/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="../WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="../WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
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
<title>半島概要-景点介绍</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/about.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="../js/jfade.js"></script>

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
    
         <section class="head anchor-destination">
        <div class="description">
        	<span class="separator"><img src="../images/title_list2.png"></span>
            <h2>観光スッポト</h2>
        </div>
            
    	</section>
        
   	 <section class="about-main">
        <div class="picScroll">
            <ul>
                <asp:Repeater ID="rptList" runat="server">
                    <ItemTemplate>
                        <li>
                    <h1><a href="about_scenic.aspx?Id=<%#Eval("hotspot_id") %>#ScenicInfo"><%#Eval("hotspot_name") %></a></h1>
                    <a href="about_scenic.aspx?Id=<%#Eval("hotspot_id") %>#ScenicInfo"><img border="0" src="<%#Adpost.YCH.WEB.Common.NoPhotoDefault(Convert.ToString(Eval("coverphoto"))) %>" class="jfade_image"></a>
                    <div class="about-scenic-wz">
                        <a href="#">
                        <h2><a href="about_scenic.aspx?Id=<%#Eval("hotspot_id") %>#ScenicInfo"><%#Eval("hotspot_name") %></a></h2>
                        <p><a href="about_scenic.aspx?Id=<%#Eval("hotspot_id") %>#ScenicInfo"><%#Eval("intro") %></a></p>
                        </a>
                    </div>
                </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>   
            <a class="prev"></a>
            <a class="next"></a>
            <script type="text/javascript">jQuery(".picScroll").slide({ mainCell: "ul", autoPlay: true, effect: "left", vis: 5, scroll: 1, autoPage: true, pnLoop: false });</script>
     
        </div>
        
        <div class="about-content">
            <div class="about-content_left right">
                <div class="focusBox">
                    <ul class="pic">
                        <asp:Literal ID="ltrScenicPhotoList" runat="server"></asp:Literal>
                    </ul>
                    
                    <ul class="hd">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <a class="prev" href="javascript:void(0)"></a>
                        <a class="next" href="javascript:void(0)"></a>
                    </ul>
                </div>
                <script type="text/javascript">
                    /*鼠标移过，左右按钮显示*/
                    jQuery(".focusBox").hover(function () { jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.9) }, function () { jQuery(this).find(".prev,.next").fadeOut() });
                    /*SuperSlide图片切换*/
                    jQuery(".focusBox").slide({ mainCell: ".pic", effect: "left", autoPlay: true, delayTime: 600, trigger: "click" });
                </script>
    
            </div>
            <div class="about-content_right left blue">
                <div class="about-nr">
                    <div id="sucai">
                        <div class="about-nr1">
                            <a name="ScenicInfo"></a><h2><asp:Literal id="ltrScenicName" runat="server"></asp:Literal></h2>
                            <p><asp:Literal id="ltrDesc" runat="server"></asp:Literal></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
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
    <!--主体内容 EDN-->
</div>
<uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />
<uc1:CommonLogin runat="server" id="CommonLogin" />   
 </form>
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
<script type="text/javascript" src="../js/oneself.js"></script> 
<script type="text/javascript" src="../js/zepto.min.js"></script>
<script type="text/javascript" src="../js/jquery.nicescroll.js"></script>
<script type="text/javascript">
    $("#sucai").niceScroll({
        cursorcolor: "#0095B5",
        cursoropacitymax: 1,
        touchbehavior: false,
        cursorwidth: "5px",
        cursorborder: "0",
        cursorborderradius: "3px"
    });
</script>
<script type="text/javascript">
    $("#sucai1").niceScroll({
        cursorcolor: "#579F06",
        cursoropacitymax: 1,
        touchbehavior: false,
        cursorwidth: "5px",
        cursorborder: "0",
        cursorborderradius: "3px"
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {

        $('.jfade_image').jfade();

    });
</script> 
</body>
</html>

