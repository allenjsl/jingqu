<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="share_video.aspx.cs" Inherits="Adpost.YCH.WEB.share.share_video" %>
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
<title>旅游印记-Video highlights</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/share.css">
<link rel="stylesheet" type="text/css" href="../css/component.css">
<link type="text/css" rel="stylesheet" href="../css/simplePagination.css"/>
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>

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
                

<section class="video_main">
	<div class="video">
    	<div class="video_title"><img src="../images/share_blogs_list5.png"></div>
        <div class="video_box">
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
    width="972" height="400">
    <param name="movie" value="Flvplayer.swf?vcastr_file=<%=FlvFilePath %>&IsAutoPlay=0" />
    <param name="quality" value="high" />
    <param name="allowFullScreen" value="true" />
    <param name="wmode" value="opaque" />
    <param name="allowScriptAccess" value="sameDomain">
    <param name="IsAutoPlay" value="1" />
    <embed wmode="opaque" allowscriptaccess="sameDomain" src="Flvplayer.swf?vcastr_file=<%=FlvFilePath %>&IsAutoPlay=0"
        width="972" height="400" allowfullscreen="true" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
        type="application/x-shockwave-flash"> </embed>
</object>
            <p><span><i><img src="../images/flow_list1.png"></i><asp:Literal ID="ltrDate" runat="server"></asp:Literal></span><asp:Literal ID="ltrVideName" runat="server"></asp:Literal></p>
        </div>
        
        <div class="video_list">
        	<h3>视频列表</h3>
            <ul>
                <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
            	<li><a href="share_video.aspx?Id=<%#Eval("id") %>">
                	<img src="<%#Adpost.YCH.WEB.Common.NoPhotoDefault(Convert.ToString(Eval("coverphoto"))) %>"></a>
                    <p><a href="share_video.aspx?Id=<%#Eval("id") %>"><%#Eval("title") %></a></p>
                    <span><%#Eval("create_date","{0:yyyy-MM-dd}") %></span>
                    <i></i>
                </li>
                </ItemTemplate>
                    </asp:Repeater>
            </ul>
            <div style="clear:both;"></div>
            
        </div>
        <div class="pane_content_page">
            <div id="paging1"></div>
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
            currentPage:<%=CurrencyPage%>,
            items: <%=TotalRows%>,
            itemsOnPage: <%=PageSize%>,
            cssStyle: 'light-theme'
        });
    });
</script>


<script>window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"] } }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
</body>
</html>

