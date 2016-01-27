<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_eventshow.aspx.cs" Inherits="Adpost.YCH.WEB.news.news_eventshow" %>
<%@ Register src="/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="../WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="../WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head runat="server">
       <meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>Journey-Special activities</title>

<link type="text/css" rel="Stylesheet" href="../css/bootstrap.css" />
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
    	<div class="news_event_head">Special activities<span>EVENT</span></div>
        <div class="tabPanel">
        	<div class="tabPane2">
            	<ul>
                    <li class="hit"><a href="news_event.aspx">In the development of the</a></li>
                    <li><a href="news_endevent.aspx">Has ended</a></li>
                </ul>
            </div>            
            <div class="panes">
                <div class="pane" style="display:block;">
                	<div class="pane_title"><span><asp:Literal ID="ltrTitle" runat="server"></asp:Literal></span></div>
                    <div class="pane_search">
                    	<div class="pane_search_choose left">
                        	<div class="pane_search_choose_main">Title</div>
                        	<div class="pane_search_choose_btn"><img src="../images/icons10.png"></div>
                            <div class="pane_search_choose_list">
                            	<p>Title</p>
                                <p>Publisher</p>
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
                    
                    
                    
                   <div class="pane_content_list_show">
                   		<div class="pane_content_list_show1">
                            <asp:Literal ID="ltrImg" runat="server"></asp:Literal>
                            <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动地点：</strong>&nbsp;&nbsp;<asp:Literal ID="ltrAddress" runat="server"></asp:Literal>
                            </p>
                            <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报名形式：</strong>&nbsp;&nbsp;<asp:Literal ID="ltract_registration" runat="server"></asp:Literal></p>
                            <p><strong>报名及咨询电话：</strong>&nbsp;&nbsp;<asp:Literal ID="ltrprebookphone" runat="server"></asp:Literal></p>
                            <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动费用：</strong>&nbsp;&nbsp;<asp:Literal ID="ltrpriceinfo" runat="server"></asp:Literal></p>
                            <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食餐标准：</strong>&nbsp;&nbsp;<asp:Literal ID="ltrambitus_restaurant" runat="server"></asp:Literal></p>
                               <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动介绍：</strong>&nbsp;&nbsp;<asp:Literal ID="ltrIntro" runat="server"></asp:Literal></p> 
                            <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;行程安排：</strong>&nbsp;&nbsp;<asp:Literal ID="ltract_process" runat="server"></asp:Literal></p> 
                            <asp:Literal ID="ltrShowBtn" runat="server"></asp:Literal>
                            <div class="pane_content_list_show1_btn1"><a href="news_event.aspx">返回列表</a></div>
                        </div>
                        
                        
                        <div id="Monver">
                        	<h2>活动报名<span id="close"></span></h2>
                            <table>
                                <asp:Literal ID="ltrUserInfo" runat="server"></asp:Literal>
                                <tr>
                                    <td class="theme_td1">参加活动时间</td>
                                    <td><input type="text" name="txtPlanTime" class="theme_input1" id="txtPlanTime"></td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">手机号</td>
                                    <td><input type="text" name="txtMobilePhone" class="theme_input1"></td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">邮箱</td>
                                    <td><input type="text" name="txtEmail" id="txtEmail" class="theme_input1" runat="server"></td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">地址</td>
                                    <td><input type="text" name="txtAddress" class="theme_input1"></td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">参加人数</td>
                                    <td><input type="text" name="txtJoinNumber" class="theme_input2">&nbsp;&nbsp人</td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">活动道具</td>
                                    <td><input type="radio" value="1" name="dj">需要&nbsp;&nbsp;&nbsp;<input type="radio" name="dj" value="0">无需</td>
                                </tr>
                                <tr>
                                    <td class="theme_td1">备注</td>
                                    <td><textarea name="txtRemark" class="theme_area1"></textarea></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="theme_td1" ><asp:Button id="btnJoin" CssClass="theme_input3" Text="提 交" runat="server" OnClick="btnJoin_Click" /><input type="button" class="theme_input4" value="取 消"></td>
                                </tr>
                            </table>
                        
                        </div>
                        <div id="cxc"></div>
                        
                        <div class="pane_content_list_show2">
                            <asp:Literal ID="ltrNext" runat="server"></asp:Literal>
                            <asp:Literal ID="ltrPre" runat="server"></asp:Literal>
                        </div>

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
 <script type="text/javascript" src="../js/MyCxcPlug.js"></script> 
<script type="text/javascript" src="../js/default.randheli.min1.js"></script>
    <!--地区联动--> 
<script src="../js/Area.js" type="text/javascript"></script> 
<script src="../js/AreaData_min.js" type="text/javascript"></script> 
<script src="../js/bootstrap-datepicker.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
        $("#txtPlanTime").datepicker({ format: 'yyyy-mm-dd' });
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


</body>
</html>

