<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="share_shadow.aspx.cs" Inherits="Adpost.YCH.WEB.share.share_shadow" %>
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
<title>The mood.-Light records</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/share.css">
    <link rel="stylesheet" type="text/css" href="../css/public.css">
<link rel="stylesheet" type="text/css" href="../css/component.css">
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

<section class="share-main">
	<div id="grid-gallery" class="grid-gallery">
        <section class="grid-wrap">
            <ul class="grid">
                <li class="grid-sizer"></li><!-- for Masonry column width -->
                <asp:Repeater ID="rptList" runat="server" OnItemDataBound="InitTalkCount">
                    <ItemTemplate>
                        <li>
                    <figure>
                        <img src="<%#Eval("photoaddress") %>" alt="img01"/>
                        <figcaption>
                        	<h3><%#Eval("photoname") %></h3>
                            <p><%#Eval("photodesc") %></p>
                            <p><span class="share_span1 left"><asp:Literal ID="ltrCollectCount" runat="server"></asp:Literal></span><span class="share_span3 right"><asp:Literal ID="ltrTalkCount" runat="server"></asp:Literal></span></p>
                            <div style="clear:both;"></div>
                        </figcaption><!--
                        <div id="share_peo"><img src="../images/share_img1.jpg"><p>发布人：<span><%#Eval("create_user_id") %></span></p><p><%#Eval("create_date","{0:yyyy-MM-dd}") %></p></div>-->
                        <div id="share_peo1">
                        	<div id="share_peo1_1"><img src="../images/share_img1.jpg"></div>
                            <div id="share_peo1_2"><p>发表评论内容</p></div>
                        	<div style="clear:both;"></div>
                        </div>
                    </figure>
                </li>
                    </ItemTemplate>
                </asp:Repeater>                
            </ul>
        </section><!-- // grid-wrap -->
        <section class="slideshow">
            <ul>
                <asp:Repeater ID="rptList2" runat="server" OnItemDataBound="rptList2_ItemDataBound">
                    <ItemTemplate>
                        <li>
                    <figure>
                        <figcaption>
                            <h3><%#Eval("photoname") %></h3>
                            <p><span class="share_span4 left"><a href="/mycollect.aspx?TypeId=<%=(int)Adpost.YCH.BLL.收藏类别.光影记录 %>&Id=<%#Eval("id") %>&RUrl=<%=Server.UrlEncode(Request.Url.ToString()) %>"><img src="../images/flow_list1.png" width="20" height="15"><i><asp:Literal ID="ltrCollectCount" runat="server"></asp:Literal></i></a></span><span class="share_span3 right"><asp:Literal ID="ltrTalkCount" runat="server"></asp:Literal></span></p>
                            <img src="<%#Eval("photoaddress") %>" alt="img01"/>
                            <p><%#Eval("photodesc") %></p>
                            <h4>发表评论</h4>
                            <textarea class="fig_ares" name="TalkInfo" id="tk<%#Eval("id") %>"></textarea>
                            <input id="btnTalk" type="button" value="提交" EID="<%#Eval("id") %>" class="fig_btn" onclick="GYTalk(this)">
                        </figcaption>
                        
                    </figure>
                </li>
                    </ItemTemplate>
                    </asp:Repeater>
            </ul>
            <nav>
                <span class="icon nav-prev"><img src="../images/icons_1.png"></span>
                <span class="icon nav-next"><img src="../images/icons_2.png"></span>
                <span class="icon nav-close">X</span>
            </nav>
            <div class="info-keys icon">Navigate with arrow keys</div>
        </section><!-- // slideshow -->
    </div><!-- // grid-gallery -->

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
    <script type="text/javascript" src="../js/MyCxcPlug.js"></script> 

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
    function GYTalk(obj) {
        var id = $(obj).attr("EID");
        var remark = escape($(obj).closest("li").find("textarea[name='TalkInfo']").val());
        if (remark == "") {
            alert("请填写评论内容!");
            return false;
        } else {
            $.ajax({
                type: "post",
                cache: false,
                url: "/CommonPage/CommentSubmit.ashx?CommentType=<%=(int)Adpost.YCH.BLL.评论类型.光影%>&HotspotId=" + id + "&trk=" + remark,
                dataType: "json",
                success: function (ret) {
                    //ajax回发提示
                    if (ret.result != "0") {
                        alert(ret.msg);
                        window.location.reload();
                    } else {
                        alert(ret.msg);
                    }
                },
                error: function () {
                    tableToolbar._showMsg(tableToolbar.errorMsg);
                    $("#btnSave").text("保 存");
                    PageJsDataObj.BindBtn();
                }
            });
        }
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


<script type="text/javascript" src="../js/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="../js/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="../js/classie.js"></script>
<script type="text/javascript" src="../js/cbpGridGallery.js"></script>
<script type="text/javascript">
    new CBPGridGallery(document.getElementById('grid-gallery'));
</script>

</body>
</html>

