<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="travel_hotel_show.aspx.cs" Inherits="Adpost.YCH.WEB.traveling.travel_hotel_show" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<%@ Register Src="~/WebControls/Talk.ascx" TagPrefix="uc1" TagName="Talk" %>
<%@ Register Src="~/WebControls/TalkList.ascx" TagPrefix="uc1" TagName="TalkList" %>


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
<title>缤纷旅程-酒店推荐</title>
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
            	<li><a href="travel_hotel_list.aspx" class="on">度假区酒店列表</a></li>
                <li><a href="#">预定</a></li>
                <li><a href="#">确认订单</a></li>
                <li><a href="#">在线支付</a></li>
            </ul>
        </div>
        
    	<div class="food_list_title"><h2>酒店推荐</h2></div>
        
		<div class="focusBox1">
            <ul class="pic">
                <asp:Literal ID="ltrImgList" runat="server"></asp:Literal>
            </ul>
            <ul class="hd">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <script type="text/javascript">
            /*SuperSlide图片切换*/
            jQuery(".focusBox1").slide({ mainCell: ".pic", effect: "fold", autoPlay: true, delayTime: 600, trigger: "click" });
        </script>
        <div class="food_list_content">
        	<div class="food_list_content_lt left">
                <h3><asp:Literal ID="ltrName" runat="server"></asp:Literal></h3>
                <p><asp:Literal ID="ltrDesc" runat="server"></asp:Literal></p>
            </div>
            <div class="food_list_content_rt right">
            	<div class="food_list_content_rt1"><a href="/mycollect.aspx?TypeId=<%=(int)Adpost.YCH.BLL.收藏类别.酒店推荐 %>&Id=<%=Adpost.YCH.Utility.Utils.GetQueryStringValue("Id") %>&RUrl=<%=Server.UrlEncode(Request.Url.ToString()) %>"><img src="../images/flow_list1.png"></a><a href="#"><img src="../images/flow_list2.png"></a><a href="#"><img src="../images/flow_list3.png">(<asp:Literal ID="ltrTalkCount" runat="server"></asp:Literal>条)</a></div>
            	<p>·&nbsp;电话：<asp:Literal ID="ltrTel" runat="server"></asp:Literal></p>
                <p>·&nbsp;地址：<asp:Literal ID="ltrAddress" runat="server"></asp:Literal></p>
                <p>·&nbsp;酒店设施：<asp:Literal ID="ltrSpecial" runat="server"></asp:Literal></p>
                <div class="pane_content_list_show1_btn1"><a href="travel_hotel_list.aspx">返回列表</a></div>
            </div>
            <div style="clear:both;"></div>
        </div>
        
        <div class="hotel_list">
        	<h2>酒店房型一览</h2>
            <div class="hotel_list1" id="firstpane">
            	<asp:Repeater ID="rptItemsList" runat="server">
                    <ItemTemplate>
            	<div class="menu_head current">
                	<p><span>&yen;<%#Eval("price") %></span><%#Eval("name") %></p>
                </div>
                <div class="menu_body">
                	<p><%#Eval("remark") %></p>
                    <div class="picScrolla">
                    	<ul>
                        	<%#PhotoList(Convert.ToString(Eval("photos"))) %>
                        </ul>
                        <a class="prev"></a>
            			<a class="next"></a>
                    </div>
                    <div class="hotel_list_btn"><a  href="travel_hotel_inorder.aspx?Hid=<%#Eval("hotspot_id") %>&Id=<%#Eval("id") %>">预&nbsp;&nbsp;订</a></div>
                </div>
                </ItemTemplate></asp:Repeater>                
            </div>
        </div>        
        <uc1:Talk runat="server" id="Talk" />      
        
        <uc1:TalkList runat="server" id="TalkList" />
    </div>
    
</section>



            </section>
<!--主体内容 END-->
</div>
 <uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />       
<uc1:CommonLogin runat="server" id="CommonLogin" />
</form>       
<script type="text/javascript" src="../js/default.randheli.min1.js"></script>
<script type="text/javascript" src="../js/oneself.js"></script>
    <script type="text/javascript" src="../js/MyCxcPlug.js"></script> 
        <!--地区联动--> 
<script src="../js/Area.js" type="text/javascript"></script> 
<script src="../js/AreaData_min.js" type="text/javascript"></script> 
<script type="text/javascript">
    $(function () {
        initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
    });

    //得到地区码
    function getAreaID() {
        var area = 0;
        if ($("#seachdistrict").val() != "0") {
            area = $("#seachdistrict").val();
        } else if ($("#seachcity").val() != "0") {
            area = $("#seachcity").val();
        } else {
            area = $("#seachprov").val();
        }
        return area;
    }

    //根据地区码查询地区名
    function getAreaNamebyID(areaID) {
        var areaName = "";
        if (areaID.length == 2) {
            areaName = area_array[areaID];
        } else if (areaID.length == 4) {
            var index1 = areaID.substring(0, 2);
            areaName = area_array[index1] + " " + sub_array[index1][areaID];
        } else if (areaID.length == 6) {
            var index1 = areaID.substring(0, 2);
            var index2 = areaID.substring(0, 4);
            areaName = area_array[index1] + " " + sub_array[index1][index2] + " " + sub_arr[index2][areaID];
        }
        return areaName;
    }
</script>
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

<!--星级打分-->
<script type="text/javascript" src="../js/comment.js"></script>

<!--上下滑动门-->
<script type="text/javascript">
    $(document).ready(function () {

        //幻灯片元素与类“menu_body”段与类“menu_head”时点击
        $("#firstpane .menu_body:eq(0)").show();
        $("#firstpane div.menu_head").click(function () {
            $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().removeClass("current");
        });

        //滑动与类“menu_body”的元素，当鼠标悬停段
        $("#secondpane .menu_body:eq(0)").show();
        $("#secondpane div.menu_head").mouseover(function () {
            $(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().removeClass("current");
        });

    });
</script>


    </body>
</html>

