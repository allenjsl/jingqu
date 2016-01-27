<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="member_collect.aspx.cs" Inherits="Adpost.YCH.WEB.member.member_collect" %>
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
<title>会員センター-我的收藏</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/member.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<link type="text/css" rel="stylesheet" href="../css/simplePagination.css"/>


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

<section class="member_body">
	<div class="member_main">
    	<div class="member_title">
        	<a href="member_info.aspx">会员信息</a><a href="member_order_list.aspx">我的订单</a><a href="member_collect.aspx" class="on">我的收藏</a><a href="member_line.aspx">我的线路</a><a href="member_blogs.aspx">我的游记</a><a href="member_guangyin.aspx">我的光影</a>
        </div>
    	<div class="member_conent">
        	<h2><p>我的收藏</p></h2>
            <div class="member_order_search">
                <div class="member_order_search_rt right">
                	<div class="pane_search_choose left">
                    </div>
                    <div class="pane_search_into right">
                        <table>
                            <tr>
                                	<td><input id="keyWord" name="keyword" type="text" class="into_input"></td>
                                    <td style=" vertical-align:bottom"><a href="javascript:window.location='member_collect.aspx?Type=<%=Adpost.YCH.Utility.Utils.GetQueryStringValue("Type") %>&KeyWord='+escape($('#keyWord').val());"><img src="../images/icons11.png"></a></td>
                                </tr>
                        </table>
                    </div>
                </div>
            	
            </div>
            <div style="clear:both;"></div>
            <div class="member_order">
            	<font>收藏列表</font>
                <asp:Repeater ID="rptList" runat="server" OnItemDataBound="InitCollectInfo">
                        <ItemTemplate>
                <div class="member_collect">
                    <ul>
                    	<li>
                        	<div class="collect_lt left">
                            	<asp:Literal ID="ltrImg" runat="server"></asp:Literal>
                                <span class="collect_span1"></span>
                                <p><a href="member_collect_del.aspx?Id=<%#Eval("id") %>">从我的收藏夹中移除</a></p>
                            </div>
                            <div class="collect_rt left">
                               <asp:Literal ID="ltrCollectInfo" runat="server"></asp:Literal>
								<div class="collect_rt_share">
                                	<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                </ItemTemplate>
                    </asp:Repeater>
                
                <div class="pane_content_page">
                    <div id="paging2"></div>
                </div>
                
                <div class="member_collect">
                	<h1>收藏的图片</h1>
                    <div class="picScroll">
                        <ul><asp:Repeater ID="rptImgList" runat="server">
                        <ItemTemplate>
                            <li><div class="pic_img"><img src="<%#Eval("photoaddress") %>" onload="javascript:DrawImage(this,120,120)"></div><p><%#Eval("photoname") %></p></a></li>
                            </ItemTemplate>
                    </asp:Repeater>
                        </ul>
                        <a class="prev"></a>
                        <a class="next"></a>
                    </div>
                    <script type="text/javascript">jQuery(".picScroll").slide({ mainCell: "ul", autoPlay: false, effect: "left", vis: 6, scroll: 1, autoPage: true, pnLoop: false });</script>
                            <!-- 图片滚动 E -->
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
<!--主体内容 END--> 
</div>
<uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />
<uc1:CommonLogin runat="server" id="CommonLogin" />
</form>
        

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

<!--分页-->
<script type="text/javascript" src="../js/jquery.simplePagination.js"></script>
<script type="text/javascript">
    $(function () {
        $("#paging1,#paging2").pagination({
            currentPage:<%=CurrencyPage%>,
            items: <%=TotalRows%>,
            itemsOnPage: <%=PageSize%>,
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


<script>window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"] } }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
</body>
</html>

