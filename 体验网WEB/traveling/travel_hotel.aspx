﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="travel_hotel.aspx.cs" Inherits="Adpost.YCH.WEB.traveling.travel_hotel" %>
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
    <section class="head anchor-destination">
    <div class="description">
    <span class="separator"><img src="../images/title_list9.png"></span>
    <h2>酒店推荐</h2>
    </div>
	
</section>

<section class="about-main">
	<div class="travel_traffic">
    	<ul><asp:Repeater ID="rptList" runat="server">
                    <ItemTemplate>
        	<li><a href="travel_hotel.aspx?Id=<%#Eval("hotspot_id") %>"><%#Eval("hotspot_name") %></a></li>
            </ItemTemplate>
         </asp:Repeater>
            <li><a href="travel_hotel_list.aspx">更多</a></li>
        </ul>
        <a class="prev"></a>
        <a class="next"></a>
    </div>
    <script type="text/javascript">        jQuery(".travel_traffic").slide({ mainCell: "ul", autoPlay: false, effect: "left", vis: 5, scroll: 1, autoPage: true, pnLoop: false });</script>
    <div class="travel_traffic1">
    	<div class="travel_traffic1_lt right"><asp:Literal ID="ltrCoverPhoto" runat="server"></asp:Literal></div>
        <div class="travel_traffic1_rt green left">
        	<div class="travel_traffic1_main">
            	<div id="sucai">
                    <div class="travel_traffic1_ny">
                        <h2><asp:Literal ID="ltrName" runat="server"></asp:Literal></h2>
                        <p><asp:Literal ID="ltrDesc" runat="server"></asp:Literal></p>
                        <div class="show_btn"><a href="travel_hotel_show.aspx?Id=<%=Id %>">查看详情</a></div>
                    </div>
                </div>
            </div>
        	
        </div>
    </div>
    <div class="travel_traffic1">
    	<div class="travel_traffic1_lt left"><asp:Literal ID="ltrHotelImg2" runat="server"></asp:Literal></div>
        <div class="travel_traffic1_rt blue right">
        	<div class="travel_traffic1_main">
            	<div class="travel_traffic1_ny">
                	<h2>酒店客房与客房价位</h2>
                	<div id="sucai1">
                   		<table class="travel_hotel">
                        	<tr>
                            	<td class="hotel_td1" width="20%">房型</td>
                                <td class="hotel_td1" width="20%">挂牌价格</td>
                                <td class="hotel_td1" width="15%">面积</td>
                                <td class="hotel_td1" width="15%">配置</td><!--
                                <td class="hotel_td1" width="10%">数量</td>
                                <td class="hotel_td1" width="20%">备注</td>-->
                            </tr>
                              <asp:Repeater ID="rptItemsList" runat="server">
                    <ItemTemplate>
                            <tr>
                            	<td class="hotel_td2 hotel_td3"><%#Eval("name") %></td>
                                <td class="hotel_td2"><%#Eval("price") %>元</td>
                                <td class="hotel_td2"><%#Eval("area") %></td>
                                <td class="hotel_td2"><%#Eval("facilities") %></td><!--
                                <td class="hotel_td2"><%#Eval("num") %></td>
                                <td class="hotel_td2"><%#Eval("remark") %></td>-->
                            </tr></ItemTemplate></asp:Repeater>
                        </table>
                	</div>
                    <p><asp:Literal ID="ltrHotelTips" runat="server"></asp:Literal></p>
                    <p>&nbsp;</p>
                    <span class="hotel_span1"><asp:Literal ID="ltrInfoLink" runat="server"></asp:Literal></span>
                    <span class="hotel_span2"><asp:Literal ID="ltrTel" runat="server"></asp:Literal></span>
                    <span class="hotel_span3"><asp:Literal ID="ltrAddress" runat="server"></asp:Literal></span>
                </div>
            	
            </div>
        	
        </div>
    </div>
</section>

<section class="go-top">
	<a href="#" class="anchor top-of-page"><span class="animated-picto"><img width="69" height="61" src="../images/home.png" alt="" /></span><span class="separator"></span><span class="text">回到顶部</span></a>
</section>

<uc3:WebFooter ID="WebFooter1" runat="server" />

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
    $("#sucai #sucai1").niceScroll({
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

            var html = '<div class="message_reply"><table><tr><td colspan="2">0/140</td></tr><tr><td><textarea class="messages_txra2"></textarea></td><td><a href="#">发表</a></td></tr></table></div>'

            $(this).parents("li").append(html)

        });



    });
</script>


    </body>
</html>

