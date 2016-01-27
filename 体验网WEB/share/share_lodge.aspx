<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="share_lodge.aspx.cs" Inherits="Adpost.YCH.WEB.share.share_lodge" %>
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
<title>澄心服务-投诉建议</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/share.css">
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


<section class="share-main1">
	<div class="share_travel">
    	<div class="share_travel_head2">投诉建议<span>COMPLAINTS & PROPOSALS</span></div>
        <div class="tabPanel">
        	<div class="tabPane3">
            	<ul>
                    <li class="hit">投诉建议</li>
                </ul>
            </div>            
            <div class="panes">
                <div class="pane" style="display:block;">
                	<div class="pane_title"><span>投诉建议</span></div>
                    <div class="share_lodge">
                    	<div class="share_lodge_btn left">我要参与</div>
                        <div id="Monver">
                        	<h2>投诉建议<span id="close"></span></h2>
                            <table>
                                	<tr>
                                    	<td width="13%" class="theme_td1">类别</td>
                                        <td width="87%"><input type="radio" name="lb" value="1">投诉&nbsp;&nbsp;&nbsp;<input type="radio" name="lb" value="2" checked="checked">建议</td>
                                    </tr>
                                    
                                    <tr>
                                    	<td class="theme_td1">对象</td>
                                        <td>
                                        	<select class="lodge_select1" name="ddlType" id="ddlType" onchange="ChangHotspotList(document.getElementById('hotspotId'),this.options[this.selectedIndex].value,0)"><option value="0">请选择</option><option value="1">景点</option><option value="6">酒店</option><option value="3">餐馆</option></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	<select class="lodge_select1" name="hotspotId" id="hotspotId"><%=strScenicsList %></select>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td class="theme_td1">标题</td>
                                        <td><input type="text" name="title" class="lodge_input1">
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td class="theme_td1">内容</td>
                                        <td><textarea class="lodge_area1" name="remark"></textarea></td>
                                    </tr>
                                    <tr>
                                    	<td class="theme_td1" colspan="2">
                                            <asp:Button ID="btnSubmit" CssClass="theme_input3" runat="server" Text="提 交" OnClick="btnSubmit_Click" /><input type="button" class="theme_input4" value="取 消"></td>
                                    </tr>
                                </table>
                        
                        </div>
                        <div id="cxc"></div>

                        
                    	<div class="pane_search1 right">
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
                                        <td style=" vertical-align:bottom"><a href="javascript:window.location='share_lodge.aspx?KeyWord='+escape($('#keyWord').val());"><img src="../images/icons11.png"></a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="share_survey">
                    	<div id="firstpane" class="menu_list">
                        	<asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                            <div class="menu_head">
                            	<p><%#Eval("title") %></p>
                                <span><%#Eval("stime","{0:yyyy-MM-dd}") %></span>
                            </div>
                            <div class="menu_body">
                                <table>
                                	<tr>
                                    	<td><%#Eval("content") %></td>
                                    </tr>
                                    <tr>
                                    	<td class="lodge_td1">
                                        	<p><span>【管理员回复】</span><%#Eval("replycontent") %></p>
											<p><%#Eval("ptime","{0:yyyy-MM-dd}") %></p>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>
                            </ItemTemplate>
                    </asp:Repeater>
                        </div><!--firstpane end-->

                    </div>
                    
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
<uc1:CommonLogin runat="server" id="CommonLogin" />
</form>      
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/oneself.js"></script>
<script type="text/javascript" src="../js/default.randheli.min1.js"></script>
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

<!--弹出层-->
<script type="text/javascript" src="../js/MyCxcPlug.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".share_lodge_btn").click(function () {
            Popuplayer({
                LayerId: "Monver",//层ID
                Masklayer: "cxc",//遮罩层ID
                CloseID: "close",//退出id
                Fun: function () { } //关闭时是否回调函数
            });
        });
    });
</script>
</body>
</html>

