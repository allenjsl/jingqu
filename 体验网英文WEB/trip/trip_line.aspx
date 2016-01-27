<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trip_line.aspx.cs" Inherits="Adpost.YCH.WEB.trip.trip_line1" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html><!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head runat="server">
       <meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>The mood.-路线推荐</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/trip.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<link type="text/css" rel="stylesheet" href="../css/simplePagination.css"/>
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
<!--header begin-->
    <uc2:WebHeader ID="WebHeader1" runat="server" /> 
     
  </header>
<!--header end-->  
            
            <section class="scroll">
                <span class="arrow"><span class="bar bar-2"></span><span class="bar bar-3"></span></span>
                <div class="text">Scroll down to discover more</div>
            </section>
            <section class="page">
            
                

<section class="member_body">
	<div class="member_main">
        <div class="trip-title">
            <p class="green"><a href="trip_line.aspx">路线推荐</a></p>
            <p class="blue"><a href="trip_custom.aspx">Personality customization</a></p>
        </div>
    	<div class="member_conent">
        	<h2><p>路线推荐</p></h2>
            <div class="member_order_search">
                <div class="member_order_search_rt right">
                	<div class="pane_search_choose left">
                        <div class="pane_search_choose_main">线路名称</div>
                        <div class="pane_search_choose_btn"><img src="../images/icons10.png"></div>
                        <div class="pane_search_choose_list">
                            <p>线路名称</p>
                        </div>
                    </div>
                    <div class="pane_search_into right">
                        <table>
                            <tr>
                                	<td><input id="keyWord" name="keyword" type="text" class="into_input"></td>
                                    <td style=" vertical-align:bottom"><a href="javascript:window.location='trip_line.aspx?KeyWord='+escape($('#keyWord').val());"><img src="../images/icons11.png"></a></td>
                                </tr>
                        </table>
                    </div>
                </div>
            	
            </div>
            <div style="clear:both;"></div>
            <div class="member_line">
            	<font>路线推荐</font>             
                <div id="firstpane" class="member_line_list">
                
                	<div id="Monver">
                        <h2>行程预约<span id="close"></span></h2>
                        <table>
                                <tr>
                                    <td width="20%" class="theme_td1">参团人数</td>
                                    <td width="80%">成人：<span class="down" onClick="update_pro_quantity('down','order_ip1')">-</span><input type="text" class="order_ip1" value="1" name="num"><span class="up" onClick="update_pro_quantity('up','order_ip1')">+</span>儿童：<span class="down1" onClick="update_pro_quantity('down1','order_ip2')">-</span><input type="text" class="order_ip2" value="0" name="num2"><span class="up1" onClick="update_pro_quantity('up1','order_ip2')">+</span></td>
                                </tr>
                                
                                <tr>
                                    <td class="theme_td1">预计时间</td>
                                    <td><input type="text" class="lodge_input1" name="time"></td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">特殊要求</td>
                                    <td><textarea class="lodge_area1" name="remark"></textarea></td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">预订人</td>
                                    <td><input type="text" class="lodge_input1" name="bookName"></td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">联系方式</td>
                                    <td><input type="text" class="lodge_input1" name="contact"></td>
                                </tr>
                            <tr>
                	<td colspan="2" class="hotel_order_td3">※请核对好你填写的预订信息，如无需立刻支付，可点击“保存订单”至“Member Center”里“我的订单”一栏
  查看并及时完成支付；如需立即预定，则点击“即刻支付”，在线支付金额，完成预定。</td>
                </tr>
                                <tr>
                                    <td colspan="2" class="theme_td1"><input type="hidden" id="hidId" name="hidId" runat="server" /><asp:LinkButton ID="linkBtnPay" runat="server" OnClick="linkBtnPay_Click">立即支付</asp:LinkButton>
            <asp:LinkButton ID="linkBtnSave" runat="server" CssClass="btn_a" OnClick="linkBtnSave_Click">提交订单</asp:LinkButton></td>
                                </tr>
                            </table>
                    
                    </div>
                    <div id="cxc"></div>
                <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                	<div class="menu_head">
                    	<table>
                        	<tr>
                            	<td width="8%" class="head_td1">推荐<%#Container.ItemIndex+1 %></td>
                                <td width="36%" class="head_td3"><%#Eval("title") %></td>
                                <td width="55%" class="head_td2"><%#Eval("tags") %></td>
                            </tr>
                        </table>
                    </div>
                    
                	<div class="menu_body">
                    	<div class="travel_shopping_btn1" EID="<%#Eval("id") %>">立即预约</div>
                    	<h1>行程详细</h1>
                        <ul>
                            <li>
                            	<div class="pane_content_list left"><a href="trip_line_show.aspx?Id=<%#Eval("id") %>"><img width="254" height="168" src="<%#Adpost.YCH.WEB.Common.NoPhotoDefault(Convert.ToString(Eval("coverphoto"))) %>"></a><p></p><div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div><div class="pane_con_share2"><a href="/mycollect.aspx?TypeId=<%=(int)Adpost.YCH.BLL.收藏类别.线路推荐 %>&Id=<%#Eval("id") %>&RUrl=<%=Server.UrlEncode(Request.Url.ToString()) %>"><img src="../images/flow_list1.png"></a></div>  </div>
                                <div class="line_rt right">
                                	<table>
                                    	<tr>
                                        	<td width="14%" align="right" class="line_rt_td1">简介：</td>
                                            <td width="86%"><%#Eval("introduction") %></td>
                                        </tr>
                                        <tr>
                                        	<td align="right" class="line_rt_td1">开团时间：</td>
                                            <td><%#Eval("groupdate") %></td>
                                        </tr>
                                        <tr>
                                        	<td align="right" class="line_rt_td1">价格：</td>
                                            <td>成人：<%#Eval("adultprice") %>元/人  儿童：<%#Eval("childprice") %>元/人</td>
                                        </tr>
                                        <tr>
                                        	<td align="right" class="line_rt_td1">人数限制：</td>
                                            <td><%#Eval("personnelceiling") %>人</td>
                                        </tr>
                                        <tr>
                                        	<td align="right" class="line_rt_td1">小贴士：</td>
                                            <td><%#Eval("tips") %></td>
                                        </tr>
                                    </table>
                                </div>
                            </li>
                        </ul>
                    </div>
                	</ItemTemplate>
                    </asp:Repeater>                
                
                </div>
                
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
        </div>
        <uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />       
<uc1:CommonLogin runat="server" id="CommonLogin" />
</form>  
<!--弹出层-->
<script type="text/javascript" src="../js/MyCxcPlug.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#hidId").val($(this).attr("EID"));
        $(".travel_shopping_btn1").click(function () {
            Popuplayer({
                LayerId: "Monver",//层ID
                Masklayer: "cxc",//遮罩层ID
                CloseID: "close",//退出id
                Fun: function () { } //关闭时是否回调函数
            });
        });
    });
</script>
<script type="text/javascript" src="../js/oneself.js"></script>

<script type="text/javascript" src="../js/default.randheli.min1.js"></script>
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

<script type="text/javascript">
    var flag = false;
    function DrawImage(ImgD, imageWidth, imageHeight) {
        var image = new Image();
        image.src = ImgD.src;
        if (image.width > 0 && image.height > 0) {
            flag = true;
            if (image.width / image.height >= imageWidth / imageHeight) {
                if (image.width > imageWidth) {
                    ImgD.width = imageWidth;
                    ImgD.height = (image.height * imageWidth) / image.width;
                    var imgh = (imageHeight - ImgD.height) / 2;          //
                    ImgD.style.marginTop = imgh + "px";                   //这两句设置了垂直居中
                } else {
                    ImgD.width = image.width;
                    ImgD.height = image.height;
                    var imgh = (imageHeight - ImgD.height) / 2;
                    ImgD.style.marginTop = imgh + "px";
                }
            }
            else {
                if (image.height > imageHeight) {
                    ImgD.height = imageHeight;
                    ImgD.width = (image.width * imageHeight) / image.height;
                } else {
                    ImgD.width = image.width;
                    ImgD.height = image.height;
                }
            }
        }
    }
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



<!--Questionnaire investigation-->
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




<script>window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"] } }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
</body>
</html>

