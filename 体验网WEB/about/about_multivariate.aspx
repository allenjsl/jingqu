<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about_multivariate.aspx.cs" Inherits="Adpost.YCH.WEB.about.about_multivariate" %>
<%@ Register src="/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="../WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="../WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head runat="server">
<meta name="google" content="notranslate" >
<meta charset="UTF-8">
<meta name="author" content="UZIK" >
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >
<title>印象半岛-多元半岛</title>
<link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css" >
<link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="../css/about.css">
<link rel="stylesheet" type="text/css" href="../css/public.css">
<script type="text/javascript" src="../js/modernizr.custom.transform-media-queries.js"></script>
<script type="text/javascript" src="../js/html5shiv.js"></script>

</head>
<body class="anchor-destination section-experiences page-experiences-single lang-en" data-permanent-class="anchor-destination lang-en">
 <form id="form1" runat="server">
<div id="main">
  <div class="header-mask"></div>
  <uc2:WebHeader ID="WebHeader1" runat="server" />   
  <section class="scroll"> <span class="arrow"><span class="bar bar-2"></span><span class="bar bar-3"></span></span>
    <div class="text">Scroll down to discover more</div>
  </section>
  
  <!--主体内容 BEGIN-->
  <section class="page">
  
    <section class="head anchor-destination">
    <div class="description">
    <span class="separator"><img src="../images/title_list1.png"></span>
    <h2>多元半岛</h2>
    </div>
      
    </section>
    
    <section class="about-main">
      <asp:Literal ID="ltrInfo" runat="server"></asp:Literal>
    </section>
    
    
    <!--返回顶部 BEGIN-->
    <section class="go-top"> 
        <a href="#" class="anchor top-of-page">
        	<span class="animated-picto">
        		<img width="69" height="61" src="../images/home.png" alt="" />
        	</span>
        	<span class="separator"></span>
        	<span class="text">回到顶部</span>
        </a> 
    </section>
    <uc3:WebFooter ID="WebFooter1" runat="server" /> 
    
  </section>
</div>

<uc1:RightQuickMenu ID="RightQuickMenu1" runat="server" />
<uc1:CommonLogin runat="server" id="CommonLogin" />
<div id="cxc"></div>
</form>
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script> 
<script type="text/javascript" src="../js/oneself.js"></script> 
<script type="text/javascript" src="../js/zepto.min.js"></script> 
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
<script type="text/javascript" src="../js/jquery.nicescroll.js"></script> 
<script type="text/javascript">
    $("#sucai,#sucai2,#sucai4").niceScroll({
        cursorcolor: "#0095B5",
        cursoropacitymax: 1,
        touchbehavior: false,
        cursorwidth: "5px",
        cursorborder: "0",
        cursorborderradius: "3px"
    });
</script> 
<script type="text/javascript">
    $("#sucai1,#sucai3,#sucai5").niceScroll({
        cursorcolor: "#579F06",
        cursoropacitymax: 1,
        touchbehavior: false,
        cursorwidth: "5px",
        cursorborder: "0",
        cursorborderradius: "3px"
    });
</script> 


<!--弹出层--> 
<script type="text/javascript" src="../js/MyCxcPlug.js"></script> 
<script type="text/javascript" src="../js/oneself.js"></script> 

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
</body>
</html>
