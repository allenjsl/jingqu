<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="travel_shopping_order.aspx.cs" Inherits="Adpost.YCH.WEB.traveling.travel_shopping_order" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
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
<title>缤纷旅程-购物推荐</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/travel.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="../js/oneself.js"></script>
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
            	<li><a href="travel_shopping_list.aspx">购物推荐列表</a></li>
                <li><a href="travel_shopping_order.aspx" class="on">确认订单</a></li>
                <li><a href="#">在线支付</a></li>
            </ul>
        </div>
        
    	<div class="food_list_title"><h2>确认订单</h2></div>
        <div class="shopping_order">
        	<div class="shopping_order_img">
            	<asp:Literal ID="ltrImgList" runat="server"></asp:Literal>
            </div>
            <table>
            	<tr>
                	<td align="right" width="20%">商品名称：</td>
                    <td width="80%"><asp:Literal ID="ltrProductName" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                	<td align="right">商品价格：</td>
                    <td class="order_price"><asp:Literal ID="ltrPrice" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                	<td align="right">商品数量：</td>
                    <td><span class="down" onClick="update_pro_quantity('down')">-</span><input type="text" class="order_ip1" value="0" name="num"><span class="up" onClick="update_pro_quantity('up')">+</span></td>
                </tr>
                <tr>
                	<td align="right">订购人：</td>
                    <td><input type="text" class="order_ip3" name="linkman"></td>
                </tr>
                <tr>
                	<td align="right">电话：</td>
                    <td><input type="text" class="order_ip3" name="phone"></td>
                </tr>
                <tr>
                	<td align="right">备注：</td>
                    <td><textarea class="order_are1" name="remark"></textarea></td>
                </tr>
                <tr>
                	<td colspan="2"><p class="order_p2">0</p><p class="order_p1">合计</p></td>
                </tr>
                <tr>
                	<td></td>
                    <td><div class="order_btn"><asp:LinkButton ID="linkBtnPay" runat="server" OnClick="linkBtnPay_Click">立即支付</asp:LinkButton></div><div class="order_btn"><asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click">提交订单</asp:LinkButton></div></td>
                </tr>
            </table>
        </div>
        
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

