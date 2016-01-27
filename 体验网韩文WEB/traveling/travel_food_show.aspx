<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="travel_food_show.aspx.cs" Inherits="Adpost.YCH.WEB.traveling.travel_food_show" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<%@ Register Src="~/WebControls/Talk.ascx" TagPrefix="uc1" TagName="Talk" %>
<%@ Register Src="~/WebControls/TalkList.ascx" TagPrefix="uc1" TagName="TalkList" %>


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
<title>찬연하다 여정-음식 -</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/travel.css">
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
<uc2:WebHeader ID="WebHeader1" runat="server" /> 
           
<section class="scroll">
    <span class="arrow"><span class="bar bar-2"></span><span class="bar bar-3"></span></span>
    <div class="text">Scroll down to discover more</div>
</section>

<!--主体内容 BEGIN--> 
<section class="page">
                

<section class="travel_food_list_main">
	<div class="food_list_body">
    	<div class="food_list_title"><h2>음식 -</h2></div>
        
		<div class="focusBox1">
            <ul class="pic">
                <asp:Literal ID="ltrImgList" runat="server"></asp:Literal>
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
            jQuery(".focusBox1").slide({ mainCell: ".pic", effect: "fold", autoPlay: true, delayTime: 600, trigger: "click" });
        </script>
        <div class="food_list_content">
        	<div class="food_list_content_lt left">
                <h3><asp:Literal ID="ltrName" runat="server"></asp:Literal></h3>
                <p><asp:Literal ID="ltrDesc" runat="server"></asp:Literal></p>
            </div>
            <div class="food_list_content_rt right">
            	<div class="food_list_content_rt1"><a href="/mycollect.aspx?TypeId=<%=(int)Adpost.YCH.BLL.收藏类别.美食推荐%>&Id=<%=Adpost.YCH.Utility.Utils.GetQueryStringValue("Id") %>&RUrl=<%=Server.UrlEncode(Request.Url.ToString()) %>"><img src="../images/flow_list1.png"></a><a href="#"><img src="../images/flow_list2.png"></a><a href="#"><img src="../images/flow_list3.png">(<asp:Literal ID="ltrTalkCount" runat="server"></asp:Literal>条)</a></div>
            	<p>·&nbsp;电话：<asp:Literal ID="ltrTel" runat="server"></asp:Literal></p>
                <p>·&nbsp;地址：<asp:Literal ID="ltrAddress" runat="server"></asp:Literal></p>
                <p>·&nbsp;特色：<asp:Literal ID="ltrSpecial" runat="server"></asp:Literal></p>
                <!--<div class="food_list_content_btn">预&nbsp;&nbsp;订</div>-->
                <div class="pane_content_list_show1_btn1"><a href="travel_food_list.aspx">返回列表</a></div>
                <div id="Monver">
                    <h2>餐馆预定<span id="close"></span></h2>
                    <table>
                            <tr>
                                <td width="20%" class="theme_td1">就餐人数</td>
                                <td width="80%"><input type="text" class="lodge_input1" name="num"></td>
                            </tr>
                            
                            <tr>
                                <td class="theme_td1">预计就餐时间</td>
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
                                <td colspan="2" class="theme_td1"><input type="hidden" id="hidId" name="hidId" runat="server" /><asp:Button ID="btnSave" runat="server" CssClass="theme_input3" Text="提 交" OnClick="btnSave_Click" /><input type="button" class="theme_input4" value="取 消"></td>
                            </tr>
                        </table>
                
                </div>
                <div id="cxc"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="picScrolla">
            <ul>
                <asp:Repeater ID="rptFoodsList" runat="server">
                    <ItemTemplate>
                <li><img src="<%#Adpost.YCH.WEB.Common.NoPhotoDefault(Convert.ToString(Eval("webphoto"))) %>"><p><%#Eval("name") %></p></li>
                </ItemTemplate></asp:Repeater>
            </ul>
            <a class="prev"></a>
            <a class="next"></a>
        </div>
        <script type="text/javascript">jQuery(".picScrolla").slide({ mainCell: "ul", autoPlay: false, effect: "left", vis: 4, scroll: 1, autoPage: true, pnLoop: false });</script>
                <!-- 图片滚动 E -->
        <uc1:Talk runat="server" ID="Talk" />
        <uc1:TalkList runat="server" ID="TalkList" />
    </div>
    
</section>





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
                        fixedTop: 0,
                        is_tablet: false,
                        is_mobile: false
                    }
                );
            });
        </script>
        

<script type="text/javascript" src="../js/jquery.nicescroll.js"></script>
<script type="text/javascript">
    $("#sucai").niceScroll({
        cursorcolor: "#009B00",
        cursoropacitymax: 1,
        touchbehavior: false,
        cursorwidth: "5px",
        cursorborder: "0",
        cursorborderradius: "3px"
    });
</script>

<script type="text/javascript">
    $(document).ready(function (e) {        

        $(".picScroll li").mousemove(function () {
            $(this).find("p").addClass("pic_p2")
        }).mouseleave(function () {
            $(this).find("p").removeClass("pic_p2").addClass("pic_p1")

        });

    });
</script>

<!--弹出层-->
<script type="text/javascript" src="../js/MyCxcPlug.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".food_list_content_btn").click(function () {
            Popuplayer({
                LayerId: "Monver",//层ID
                Masklayer: "cxc",//遮罩层ID
                CloseID: "close",//退出id
                Fun: function () { } //关闭时是否回调函数
            });
        });
    });
</script>

<!--星级打分-->
<script type="text/javascript" src="../js/comment.js"></script>

    </body>
</html>

