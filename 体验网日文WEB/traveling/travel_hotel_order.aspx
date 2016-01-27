<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="travel_hotel_order.aspx.cs" Inherits="Adpost.YCH.WEB.traveling.travel_hotel_order" %>
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
<title>多彩な旅-泊まる</title>

<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/travel.css">
 <link rel="stylesheet" type="text/css" href="../css/public.css">

<link href="../css/datepicker.css" rel="stylesheet">
	<style>
	.container {
		background: #fff;
	}
	#alert {
		display: none;
	}
	</style>
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
            	<li><a href="travel_hotel_list.aspx">度假区酒店列表</a></li>
                <li><a href="#">填写预定订单</a></li>
                <li><a href="#" class="on">确认订单</a></li>
                <li><a href="#">在线支付</a></li>
            </ul>
        </div>
        
    	<div class="food_list_title"><h2>确认订单</h2></div>
        
		<div class="hotel_list_order">
        	<table>
            	<tr>
                	<td width="21%" align="right" class="hotel_order_td1">入住/离店时间</td>
                    <td width="79%">
                        <asp:Literal ID="ltrD1" runat="server"></asp:Literal>
&nbsp;至 
                        <asp:Literal ID="ltrD2" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                	<td align="right" class="hotel_order_td1">入住人数</td>
                    <td>
                        <asp:Literal ID="ltrNum" runat="server"></asp:Literal>
                        人 (<asp:Literal ID="ltrChild" runat="server"></asp:Literal>
                        儿童)</td>
                </tr>
                <tr>
                	<td align="right" class="hotel_order_td1">房型</td>
                    <td>
                        <asp:Literal ID="ltrRoomType" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                	<td align="right" class="hotel_order_td1">预订人</td>
                    <td>
                        <asp:Literal ID="ltrNickName" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                	<td align="right" class="hotel_order_td1">手机号</td>
                    <td><asp:Literal ID="ltrPhone" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                	<td align="right" class="hotel_order_td1">地址</td>
                    <td><asp:Literal ID="ltrAddress" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                	<td align="right" class="hotel_order_td1">备注</td>
                    <td><asp:Literal ID="ltrRemark" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                	<td align="right" class="hotel_order_td1">共计金额</td>
                    <td class="hotel_order_td2"><font>&yen;</font><asp:Literal ID="ltrAmount" runat="server"></asp:Literal><span>元</span></td>
                </tr>
                <tr>
                	<td colspan="2" class="hotel_order_td3">※请核对好你填写的预订信息，如无需立刻支付，可点击“保存订单”至“会員センター”里“我的订单”一栏
  查看并及时完成支付；如需立即预定，则点击“即刻支付”，在线支付金额，完成预定。</td>
                </tr>
            </table>
        </div>
        
        <div class="hotel_list_btn"><asp:LinkButton ID="linkBtnPay" runat="server" OnClick="linkBtnPay_Click">立即支付</asp:LinkButton>
            <asp:LinkButton ID="linkBtnSave" runat="server" CssClass="btn_a" OnClick="linkBtnSave_Click">提交订单</asp:LinkButton></div>
        
    </div>
    
</section>



            </section>
<!--主体内容 BEGIN-->
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
        
<script src="../js/prettify.js"></script>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>
<script>
    if (top.location != location) {
        top.location.href = document.location.href;
    }
    $(function () {
        window.prettyPrint && prettyPrint();

        // disabling dates
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var checkin = $('#dpd1').datepicker({
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            if (ev.date.valueOf() > checkout.date.valueOf()) {
                var newDate = new Date(ev.date)
                newDate.setDate(newDate.getDate() + 1);
                checkout.setValue(newDate);
            }
            checkin.hide();
            $('#dpd2')[0].focus();
        }).data('datepicker');
        var checkout = $('#dpd2').datepicker({
            onRender: function (date) {
                return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            checkout.hide();
        }).data('datepicker');

        var checkin1 = $("#dpd1").val().substring(3, 5)
        var checkout1 = $("#dpd2").val().substring(3, 5)
        var check_day = checkout1 - checkin1;
        $(".span3").val(check_day);
    });

	</script>



    </body>
</html>

