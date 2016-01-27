<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_sale.aspx.cs" Inherits="Adpost.YCH.WEB.news.news_sale" %>
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
<title>찬연하다 여정-특혜 정보</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/news.css">
    <link rel="stylesheet" type="text/css" href="../css/public.css">
<link rel="stylesheet" type="text/css" href="../css/component.css">
<link type="text/css" rel="stylesheet" href="../css/simplePagination.css"/>

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
            
                

<section class="news_main1">
	<div class="news_event">
    	<div class="news_event_head">特惠活动<span>SALE</span></div>
        <div class="tabPanel">
        	           
            <div class="panes">
                <div class="pane" style="display:block;">
                	<div class="pane_title"><span>特惠活动</span></div>
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
                                	<td><input id="keyWord" name="keyword" type="text" class="into_input"></td>
                                    <td style=" vertical-align:bottom"><a href="javascript:window.location='news_sale.aspx?KeyWord='+escape($('#keyWord').val());"><img src="../images/icons11.png"></a></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                    <div class="pane_content_list2">                    	
                    	<img src="<%#Adpost.YCH.WEB.Common.NoPhotoDefault(Convert.ToString(Eval("photo"))) %>">
                        <h2><%#Eval("title") %></h2>
                        <h3><%#Eval("startdate") %> 至 <%#Eval("enddate") %></h3>
                        <p><%#Eval("webdesc") %></p> 
                    </div>
                    </ItemTemplate></asp:Repeater>
                    
                    <div class="pane_content_page">
                    	<div id="paging1"></div>
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
</form>    
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/oneself.js"></script>
        <script type="text/javascript" src="../js/MyCxcPlug.js"></script> 
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
            currentPage:<%=CurrencyPage%>,
            items: <%=TotalRows%>,
            itemsOnPage: <%=PageSize%>,
            cssStyle: 'light-theme'
        });
    });
</script>


</body>
</html>

