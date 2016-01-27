<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="share_blogshow.aspx.cs" Inherits="Adpost.YCH.WEB.share.share_blogshow" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<%@ Register Src="~/WebControls/BlogsTalk.ascx" TagPrefix="uc1" TagName="Talk" %>
<%@ Register Src="~/WebControls/BlogsTalkList.ascx" TagPrefix="uc1" TagName="TalkList" %>
<!DOCTYPE html><!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head runat="server">
       <meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>旅游印记-Peninsula blogs</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/share.css">
<link rel="stylesheet" type="text/css" href="../css/component.css">
<link type="text/css" rel="stylesheet" href="../css/simplePagination.css"/>
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="../js/oneself.js"></script>
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

<section class="share-main1">
	<div class="share_travel">
    	<div class="share_travel_head">Peninsula blogs<span>TRAVEL</span></div>
        <div class="tabPanel">
        	<div class="tabPane2">
            	<ul>
                    <li class="hit"><a href="share_blogs.aspx">最新游记</a></li>
                    <li><a href="share_Hotblogs.aspx">精品游记</a></li>
                </ul>
            </div>            
            <div class="panes">
                <div class="pane" style="display:block;">
                	<div class="pane_title"><span>最新游记</span></div>
                    <div class="pane_search">
                    	<div class="pane_search_choose left">
                        	<div class="pane_search_choose_main">标题</div>
                        	<div class="pane_search_choose_btn"><img src="../images/icons10.png"></div>
                            <div class="pane_search_choose_list">
                            	<p>标题</p>
                                <p>发布人</p>
                            </div>
                        </div>
                        <div class="pane_search_into left">
                        	<table>
                            	<tr>
                                	<td><input type="text" class="into_input"></td>
                                    <td style=" vertical-align:bottom"><a href="#"><img src="../images/icons11.png"></a></td>
                                </tr>
                            </table>
                        </div>
                    </div>                  
                    
                    <div class="travel_raiders_text_lt">
                        <div class="focusBox">
                            <ul class="pic">
                                <asp:Literal ID="ltrImg" runat="server"></asp:Literal>
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
                            jQuery(".focusBox").slide({ mainCell: ".pic", effect: "fold", autoPlay: true, delayTime: 600, trigger: "click" });
                        </script>
                        <div class="travel_raiders_text_top">
                            <h3><asp:Literal ID="ltrTitle" runat="server"></asp:Literal></h3>
                            <h2><div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
            </h2>
                            <h4>发表日期：<asp:Literal ID="ltrDate" runat="server"></asp:Literal>  作者：<asp:Literal ID="ltrCreateUser" runat="server"></asp:Literal>  评论：<span><asp:Literal ID="ltrTalkCount" runat="server"></asp:Literal></span>条</h4>
                            <p><asp:Literal ID="ltrContent" runat="server"></asp:Literal></p>
                        </div>
                        <div class="travel_raiders_text_bottom">
                            <div class="travel_raiders_text_bottom_lt left">
                                <asp:Literal ID="ltrNext" runat="server"></asp:Literal>
                                <asp:Literal ID="ltrPre" runat="server"></asp:Literal>
                            </div>
                            <div class="travel_raiders_text_bottom_rt right"><a href="share_blogs.aspx">返回列表</a></div>
                        </div>
                        <div style="clear:both;"></div>
                        <uc1:Talk runat="server" ID="Talk" />
                        <uc1:TalkList runat="server" ID="TalkList" />
                        
                    </div>
                    
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


<!--评论回复-->
<script type="text/javascript">
    $(document).ready(function (e) {

        $(".message_click").click(function () {

            var html = '<table><tr><td colspan="2">0/140</td></tr><tr><td><textarea class="messages_txra2"></textarea></td><td><a href="#">发表</a></td></tr></table>'
            var messageDiv = $(this).parents("li").find(".message_reply").html();
            if (messageDiv == "") {
                $(this).parents("li").find(".message_reply").append(html).addClass("message_reply_border");
            }

        });



    });
</script>




<script>window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"] } }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
</body>
</html>

