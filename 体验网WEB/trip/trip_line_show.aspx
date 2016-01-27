<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trip_line_show.aspx.cs" Inherits="Adpost.YCH.WEB.trip.trip_line_show" %>
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
<title>心情印记-路线推荐</title>
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
            <p class="blue"><a href="trip_custom.aspx">个性定制</a></p>
        </div>
    	<div class="member_conent">
        	<h2><p>路线推荐</p></h2>
            <div class="member_order_search">
                <div class="member_order_search_rt right">
                	<div class="pane_search_choose left">
                        <div class="pane_search_choose_main">收藏类别</div>
                        <div class="pane_search_choose_btn"><img src="../images/icons10.png"></div>
                        <div class="pane_search_choose_list">
                            <p>收藏的景点</p>
                            <p>收藏的新闻</p>
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
            <div class="member_line">
            	<font>路线推荐</font>             
                <div class="trip_show">
                	<p>一、<asp:Literal ID="ltrTitle" runat="server"></asp:Literal></p>
                    <p>二、线路简介</p>
                    <p><asp:Literal ID="ltrIntro" runat="server"></asp:Literal></p>
                    <p>成人价：<asp:Literal ID="ltradultprice" runat="server"></asp:Literal>198元/人</p>
                    <p>儿童价：<asp:Literal ID="ltrchildprice" runat="server"></asp:Literal>268元</p>
                    <p>折扣：<asp:Literal ID="ltrdiscount" runat="server"></asp:Literal>0.73折</p>
                    <p>三、线路详情</p>
                    <p><asp:Literal ID="ltrcontent" runat="server"></asp:Literal></p>
                    <p><strong>集合时间地点：</strong></p>
                    <p><asp:Literal ID="ltraggregateinfo" runat="server"></asp:Literal></p>
                    <p>发团日期：<asp:Literal ID="ltrgroupdate" runat="server"></asp:Literal></p>
                    <p>&nbsp;</p>
                    <p><strong>出行须知：</strong></p>
                    <p><asp:Literal ID="ltrtravelnotes" runat="server"></asp:Literal></p>
                    <p>&nbsp;</p>
                    <p>四、购买须知</p>
                    <p><asp:Literal ID="ltrbuynotes" runat="server"></asp:Literal></p>
                    <p>&nbsp;</p>
                    <p>五、使用流程</p>
                    <p><asp:Literal ID="ltrflownotes" runat="server"></asp:Literal></p>
                    <p>&nbsp;</p>
                    <p>六、产品展示（图、文为主）</p>
                    <asp:Literal ID="ltrImgList" runat="server"></asp:Literal>
                    
                </div>
                <div class="trip_show_list">
                	<p><a href="#">下一则：半岛定向</a></p>
                    <p><a href="#">上一则：暂无</a></p>
                    
                    <div class="pane_content_list_show1_btn">行程预约</div>
                    <div class="pane_content_list_show1_btn1"><a href="trip_line.aspx">返回列表</a></div>
                </div>
                
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
                	<td colspan="2" class="hotel_order_td3">※请核对好你填写的预订信息，如无需立刻支付，可点击“保存订单”至“会员中心”里“我的订单”一栏
  查看并及时完成支付；如需立即预定，则点击“即刻支付”，在线支付金额，完成预定。</td>
                </tr>
                                <tr>
                                    <td colspan="2" class="theme_td1"><input type="hidden" id="hidId" name="hidId" runat="server" /><asp:LinkButton ID="linkBtnPay" runat="server" OnClick="linkBtnPay_Click">立即支付</asp:LinkButton>
            <asp:LinkButton ID="linkBtnSave" runat="server" CssClass="btn_a" OnClick="linkBtnSave_Click">提交订单</asp:LinkButton></td>
                                </tr>
                            </table>
                    
                    </div>
                        <div id="cxc"></div>
                
                
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
        $(".pane_content_list_show1_btn").click(function () {
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



<!--问卷调查-->
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




<script>window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"] } }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
</body>
</html>

