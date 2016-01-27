<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member_order.aspx.cs" Inherits="Adpost.YCH.WEB.member.member_order" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<%@ Register Src="~/WebControls/UploadControl.ascx" TagPrefix="uc1" TagName="UploadControl" %>
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
<title>会員センター-我的订单</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/member.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">

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

<section class="member_body">
	
    

	<div class="member_main">
    
    	<div class="shopping_list_leftmenu">
            <ul>
                <li><a href="member_order_list.aspx"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==0?" class=\"on\"":"" %>>酒店订单</a></li>
                <li><a href="member_order_list.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.美食 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.美食?" class=\"on\"":"" %>>美食订单</a></li>
                <li><a href="member_order_list.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.购物订单 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.购物订单?" class=\"on\"":"" %>>购物订单</a></li>
                <li><a href="member_order_list.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.娱乐 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.娱乐?" class=\"on\"":"" %>>娱乐订单</a></li>
                <li><a href="member_order_list.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.线路 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.线路?" class=\"on\"":"" %>>线路订单</a></li>
                <li><a href="member_order_list.aspx?Type=<%=(int)Adpost.YCH.BLL.订单类型.景点 %>"<%=Adpost.YCH.Utility.Utils.GetInt(Adpost.YCH.Utility.Utils.GetQueryStringValue("Type"))==(int)Adpost.YCH.BLL.订单类型.景点?" class=\"on\"":"" %>>景点订单</a></li>
            </ul>
        </div>
    
    	<div class="member_title">
        	<a href="member_info.aspx">会员信息</a><a href="member_order_list.aspx" class="on">我的订单</a><a href="member_collect.aspx">我的收藏</a><a href="member_line.aspx">我的线路</a><a href="member_blogs.aspx">我的游记</a><a href="member_guangyin.aspx">我的光影</a>
        </div>
    	<div class="member_conent">
        	<h2><p>我的订单</p></h2>
            <div class="member_order_search">
            	<div class="member_order_search_lt left">
                	
                </div>
                <div class="member_order_search_rt right">
                	<div class="pane_search_choose left">
                        <div class="pane_search_choose_main">标题</div>
                        <div class="pane_search_choose_btn"><img src="../images/icons10.png"></div>
                        <div class="pane_search_choose_list">
                            <p>标题</p>
                        </div>
                    </div>
                    <div class="pane_search_into right">
                        <table>
                            <tr>
                                <td><input type="text" class="into_input"></td>
                                <td style=" vertical-align:bottom"><a href="#"><img src="../images/icons11.png"></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
            	
            </div>
            <div style="clear:both;"></div>
            <div class="member_order">
            	<table>
                	<tr>
                    	<td width="10%" align="right" class="member_order_td1">订单号</td>
                        <td width="90%"><asp:Literal ID="ltrCode" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                    	<td align="right" class="member_order_td1">订单名称</td>
                        <td><asp:Literal ID="ltrProductName" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                    	<td align="right" class="member_order_td1">日期	</td>
                        <td><asp:Literal ID="ltrDate" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                    	<td align="right" class="member_order_td1">支付方式</td>
                        <td><asp:Literal ID="ltrPay" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                    	<td align="right" class="member_order_td1">状态</td>
                        <td>
                            <asp:Literal ID="ltrStat" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                    	<td align="right" class="member_order_td1">联系方式</td>
                        <td>
                            <asp:Literal ID="ltrContact" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                    	<td align="right" class="member_order_td1">备注</td>
                        <td>
                            <asp:Literal ID="ltrRemark" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                    	<td style="border:none" align="right" class="member_order_td1"></td>
                        <td style="border:none"><asp:Literal ID="ltrPayBtn" runat="server"></asp:Literal><asp:Literal ID="ltrDel" runat="server"></asp:Literal><span class="member_order_btn2"><a href="member_order_list.aspx?Type=<%=Adpost.YCH.Utility.Utils.GetQueryStringValue("Type") %>">返回列表</a></span></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
	

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
<uc1:CommonLogin runat="server" id="CommonLogin" />
</form>        
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

<!--选项卡-->
<script type="text/javascript">
    $(function () {
        $('.tabPanel ul li').click(function () {
            $(this).addClass('hit').siblings().removeClass('hit');
            $('.panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
        })
    })
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


<!--アンケート-->
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

</body>
</html>

