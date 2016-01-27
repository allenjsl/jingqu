<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member_info.aspx.cs" Inherits="Adpost.YCH.WEB.member.member_info" %>
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
<title>会員センター-会员信息</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/member.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/modernizr.custom.transform-media-queries.js"></script>
<script type="text/javascript" src="../js/html5shiv.js"></script> 
    <link href="/Css/swfupload/default.css" rel="stylesheet" type="text/css" />
    <script src="/Js/swfupload/swfupload.js" type="text/javascript"></script>

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
    	<div class="member_title">
        	<a href="member_info.aspx" class="on">会员信息</a><a href="member_order_list.aspx">我的订单</a><a href="member_collect.aspx">我的收藏</a><a href="member_line.aspx">我的线路</a><a href="member_blogs.aspx">我的游记</a><a href="member_guangyin.aspx">我的光影</a>
        </div>
    	<div class="member_conent">
        	<h2><p>会员信息</p></h2>
            <div class="member_conent1">
            	<table>
            	<tr>
                	<td width="10%" align="right" class="hyxx_td1">会员名</td>
                    <td width="45%">
                        <asp:TextBox ID="username" CssClass="hyxx_input1" runat="server"></asp:TextBox></td>
                    <td width="45%"><div class="register_error" id="usernameTip_error"></div><div class="register_true" id="usernameTip_true"></div></td>
                </tr>
                <tr>
                	<td align="right" class="hyxx_td1">密码</td>
                    <td>
                        <asp:TextBox ID="userpwd" CssClass="hyxx_input1" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td><div class="register_error" id="userpwdTip_error"></div><div class="register_true" id="userpwdTip_true"></div></td>
                </tr>
                <tr>
                	<td align="right" class="hyxx_td1">邮箱</td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="hyxx_input1" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                	<td align="right" class="hyxx_td1">来自</td>
                    <td colspan="2"><select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>&nbsp;&nbsp;
<select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>&nbsp;&nbsp;
<span id="seachdistrict_div"><select id="seachdistrict" name="seachdistrict"></select></span></td>
                </tr>
                <tr>
                	<td align="right" class="hyxx_td1">头像</td>
                    <td colspan="2">
                    	<div class="member_conent_tx1 left"><asp:Literal ID="ltrImg" runat="server"></asp:Literal><p>185*185</p></div>
                        <div class="member_conent_tx2 left">
                        	<div class="member_conent_tx2_1"><asp:Literal ID="ltrImg2" runat="server"></asp:Literal><p>70*70</p></div>
                        	<div>
                                <uc1:UploadControl runat="server" id="UploadControl" IsUploadMore="false" IsUploadSelf="true" />
                            </div>
                            <div class="member_conent_tx2_2"><p>您可以选择 JPG, JPEG, GIF, PNG文件尺寸不得小于600px×600px，2MB以下</p></div>
                        </div>
                    </td>
                </tr>
                <tr>
                	<td align="right" class="hyxx_td1">性别</td>
                    <td><asp:Literal ID="ltrSex" runat="server"></asp:Literal></td>
                    <td></td>
                </tr>
                <tr>
                	<td></td>
                    <td><p class="member_conent_btn">
                        <asp:LinkButton ID="linkBtnSave" runat="server" OnClick="linkBtnSave_Click">保 存</asp:LinkButton></p></td>
                    <td></td>
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

<!--搜索下拉框-->
<script type="text/javascript">
    $(document).ready(function () {
        $(".pane_search_choose_list").hide();
        $(".pane_search_choose").click(function () {
            $(".pane_search_choose_list").show();
        });
        $(".pane_search_choose").mouseleave(function () {
            $(".pane_search_choose_list").hide();
        });
        $("#p1").click(function () {
            var html = $(this).html();
            $(".pane_search_choose_main").html(html)
            $(".pane_search_choose_list").hide();
        });
        $("#p2").click(function () {
            var html = $(this).html();
            $(".pane_search_choose_main").html(html)
            $(".pane_search_choose_list").hide();
        });
        $("#p3").click(function () {
            var html = $(this).html();
            $(".pane_search_choose_main").html(html)
            $(".pane_search_choose_list").hide();
        });
        $("#p4").click(function () {
            var html = $(this).html();
            $(".pane_search_choose_main").html(html)
            $(".pane_search_choose_list").hide();
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
        initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '<%=ProvinceId%>', '<%=CityId%>', '<%=HomeTown%>');
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

