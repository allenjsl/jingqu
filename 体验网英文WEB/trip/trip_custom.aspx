<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trip_custom.aspx.cs" Inherits="Adpost.YCH.WEB.trip.trip_custom" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html>
  <!--[if lt IE 7]>
  <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en">
  <![endif]-->
  <!--[if IE 7]>
  <html class="no-js lt-ie9 lt-ie8" lang="en">
  <![endif]-->
  <!--[if IE 8]>
  <html class="no-js lt-ie9" lang="en">
  <![endif]-->
  <!--[if gt IE 8]><!-->
  <html class="no-js" lang="en">
  <!--<![endif]-->
  <head runat="server">
  <meta charset="UTF-8">
  <title>旅行印记-Personality customization</title>
  <link href="../css/reset.css" rel="stylesheet" type="text/css" >
  <link href="../css/style1.css" rel="stylesheet" type="text/css" >
  <link rel="stylesheet" type="text/css" href="../css/trip.css">
  <link rel="stylesheet" type="text/css" href="../css/public.css">
  <link type="text/css" rel="stylesheet" href="../css/simplePagination.css"/>
  <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="../js/jquery.SuperSlide.2.1.js"></script>
  <script type="text/javascript" src="../js/modernizr.custom.transform-media-queries.js"></script>
  <script type="text/javascript" src="../js/html5shiv.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/public.css">
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
    
    <!--主体内容 BEGIN--> 
    <section class="page">
      <section class="trip_body">
        <div class="trip_title">
                <div style="clear:both;"></div>
        </div>
        <div class="trip-title">
            <p class="blue"><a href="trip_line.aspx">路线推荐</a></p>
            <p class="green"><a href="trip_custom.aspx">Personality customization</a></p>
        </div>
        <div class="trip_main">
                <div class="trip_main_lt left">
                  <div class="tabPane">
                    <ul>
                      <li class="hit">景点</li>
                      <li>美食</li>
                      <li>酒店</li>
                    </ul>
                  </div>
                  <div class="panes" id="paneObj">
                    
                    <div class="pane" style="display:block;">                     
                      
                      <div class="pane_list">
                        <ul>
                          <asp:Literal ID="ltrJD" runat="server"></asp:Literal>
                        </ul>
                        <div style="clear:both;"></div>
                      </div>
                    </div>
                    
                    <div class="pane">                      
                      
                      <div class="pane_list">
                        <ul>
                            <asp:Literal ID="ltrFood" runat="server"></asp:Literal>
                        </ul>
                        <div style="clear:both;"></div>
                      </div>
                    </div>
                    
                    <div class="pane">                     
                      
                      <div class="pane_list">
                        <ul>
                            <asp:Literal ID="ltrHotel" runat="server"></asp:Literal>  
                        </ul>
                        <div style="clear:both;"></div>
                      </div>
                    </div>

                  </div>
                </div>
                <div class="trip_main_rt right">
                  <div class="trip_xcdz right">
                    <div class="trip_xcdz_top">                        
                      <span>行程定制</span>
                        <p>行程名称：<input type="text" class="xcdz_input2" name="tourname"></p>
                      <p>行程日期：<input type="text" class="xcdz_input1" name="tourdate"></p>
                    </div>
                    
                    <div class="trip_xcdz_main">
                      <div class="trip_xcdz_main_lt left" id="dayObj">
                        <div class="dayBox" data-id="1">
                          <h1 class="on"  data-id="1">D<i class="nums">1</i><i class="dayDel"></i></h1>
                          <ul></ul>
                          <h2 class="addDay">+</h2>
                        </div>
                      </div>
                      
                      <div class="trip_xcdz_main_rt right">
                          <div id="dayMain">
                          <div class="trip_xcdz_main_rt2" data-id="1">
                            <div class="trip_xcdz_main_rt1">DAY <i class="days">1</i></div>
                            <div  id="panAddBox"></div>
                            <div class="trip_xcdz_main_pane1">
                              <p>请继续添加<span>景点</span>、 <span>餐馆</span>、 <span>酒店</span>到“我的计划”列表中。</p>
                              <textarea name="lineremark" value="负责任地介绍这一天的行程亮点和小提醒" onBlur="if(this.value==''){this.value='负责任地介绍这一天的行程亮点和小提醒'};" onFocus="if(this.value=='负责任地介绍这一天的行程亮点和小提醒'){this.value=''};" class="pane_area1"></textarea>
                            </div>
                          </div>
                        </div>
                          <asp:Button ID="btnSave" runat="server" CssClass="save_btn" Text="提  交" OnClick="btnSave_Click" />
                      </div>                        
                    </div>
                  </div>
                </div>
              </div>
              <div style="clear:both;"></div>
            </section>
            <div style="clear:both;"></div>
            <section class="go-top">
              <a href="#" class="anchor top-of-page"><span class="animated-picto"><img width="69" height="61" src="../images/home.png" alt="" /></span><span class="separator"></span><span class="text">回到顶部</span></a>
            </section>
            <uc3:WebFooter ID="WebFooter1" runat="server" />
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
        <!--选项卡-->
        <script type="text/javascript">
            $(function () {
                $('.tabPane ul li').click(function () {
                    $(this).addClass('hit').siblings().removeClass('hit');
                    $('.panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
                })
            })
        </script>
<script>
    /*定制js*/
    $(function () {
        //点击向天数添加行程信息
        var name = 0;
        $("#paneObj .foodAdd, #paneObj .hotelAdd").click(function () {
            var h1Html = $(this).parent("div").find("h1").eq(0).html();
            var hotspotId = $(this).attr("EID");
            //对应天数在显示的天数下面添加内容
            $("#dayMain .trip_xcdz_main_rt2").each(function (i) {                
                if ($(this).is(':visible')) {
                    //天数
                    var daysNum = $(this).find(".days").eq(0).html();
                    var i = $(this).find(".trip_xcdz_main_pane").length,
                        _i = i + 1;
                    var $html = '<div class="trip_xcdz_main_pane" ><input type="hidden" name="days" value="' + daysNum + '"><input type="hidden" name="hotspotId" value="' + hotspotId + '"><span class="icon_span1"><img src="../images/icons33.png"></span><span class="icon_span2"><img src="../images/member_collect_icon4.png"></span><span class="icon_up">上移</span><span class="icon_down">下移</span><h2 ><i class="h2Nums" >' + _i + '</i>.' + h1Html + '</h2><input type="text" name="remark" class="pane_input1" value="添加备注"};/></div>';
                    $(this).find("#panAddBox").append($html);
                };
            });
        });

        //景点添加
        $("#paneObj .jingdianAdd").click(function () {
            var h1Html = $(this).parent("div").find("h1").eq(0).html();
            var hotspotId = $(this).attr("EID");
            //对应天数在显示的天数下面添加内容
            $("#dayMain .trip_xcdz_main_rt2").each(function (i) {
                if ($(this).is(':visible')) {
                    //天数
                    var daysNum = $(this).find(".days").eq(0).html();
                    var i = $(this).find(".trip_xcdz_main_pane").length,
                        _i = i + 1;
                    var $html = '<div class="trip_xcdz_main_pane " data-name="' + i + '"><input type="hidden" name="days" value="' + daysNum + '"><input type="hidden" name="hotspotId" value="' + hotspotId + '"><span class="icon_span1"><img src="../images/icons33.png"></span><span class="icon_span2"><img src="../images/member_collect_icon4.png"></span><span class="icon_up">上移</span><span class="icon_down">下移</span><h2 ><i class="h2Nums" >' + _i + '</i>.' + h1Html + '</h2><input type="text" class="pane_input1" name="remark" value="添加备注"/></div>';
                    $(this).find("#panAddBox").append($html);
                };
            });
        });
        //景点添加的时候在天数下面添加对应内容
        $("#paneObj .jingdianAdd").click(function () {
            var h1Html = $(this).parent("div").find("h1").eq(0).html(),
                $parents = $("#dayObj h1[class='on']").next(),
                i = $parents.find("li").length;
            $parents.append('<li data-name="' + i + '">' + h1Html + '</li>');
        });

        //添加天数
        $(document).on("click", ".dayBox .addDay", function () {
            var _index = $(this).index(".dayBox .addDay") + 2;
            $("#dayObj h1").removeClass("on");
            var i = $("#dayObj .dayBox").size() + 1;
            var $parent = $(this).parents(".dayBox");
            var $html = '<div class="dayBox" data-id="' + i + '"><h1 class="on"  data-id="' + i + '">D<i class="nums">' + i + '</i><i class="dayDel"></i></h1><ul></ul><h2 class="addDay">+</h2></div>';
            $parent.after($html);
            $("#dayObj .nums").each(function (i) {

                $(this).html(i + 1);
            });
            var $mainHmtl = '<div class="trip_xcdz_main_rt2" data-id="' + i + '"><div class="trip_xcdz_main_rt1">DAY <i class="days"> ' + _index + '</i></div><div  id="panAddBox"></div><div class="trip_xcdz_main_pane1"><p>请继续添加<span>景点</span>、 <span>餐馆</span>、 <span>酒店</span>到“我的计划”列表中。</p><textarea class="pane_area1" value="负责任地介绍这一天的行程亮点和小提醒" /></textarea></div>';
            $("#dayMain .trip_xcdz_main_rt2").hide();
            $("#dayMain").append($mainHmtl);
            //点击天数显示对应天数里的内容
            $(document).on("click", "#dayObj h1", function (event) {
                var ev = event || window.event;
                ev.stopPropagation();
                var _index = $(this).index("#dayObj h1") + 1;
                $("#dayObj h1").removeClass("on");
                $(this).addClass("on");
                var _dataId = $(this).data("id");
                $("#dayMain .trip_xcdz_main_rt2").hide();
                $("#dayMain .trip_xcdz_main_rt2").each(function () {
                    if ($(this).data("id") == _dataId) {
                        $(this).show();
                        $(this).find(".days").html(_index);
                    }
                });
            });
        });

        //删除天数
        $(document).on("click", "#dayObj .dayDel", function (event) {
            var ev = event || window.event;
            ev.stopPropagation();
            var $parent = $(this).parents(".dayBox"),
                _index,
                _id = $parent.attr("data-id"),
                _lens = $("#dayObj .dayBox").length;
            _index = $(this).index("#dayObj .dayDel") - 1;
            if (_lens > 1) {//判断还有几天
                var _dialog = confirm("是否需要删除");
                if (_dialog == true) {
                    $("#dayMain .trip_xcdz_main_rt2[data-id=" + _id + "]").remove();
                    $parent.remove();
                    fnAutosort("#dayObj .nums");
                    fnAutosort("#dayMain .days");
                    console.dir($("#dayObj h1").eq(_index))
                    $("#dayObj h1").removeClass("on");
                    $(".dayBox h1").eq(_index).addClass("on");
                    $("#dayMain .trip_xcdz_main_rt2").hide();
                    $("#dayMain .trip_xcdz_main_rt2").eq(_index).show();
                }
            } else if (_lens == 1) {
                alert('只有一天不能删除');
            }
        });
        //删除天数
        $(document).on("click", ".icon_span2", function (i) {
            var $parent = $(this).parents(".trip_xcdz_main_pane"),
           _id = $(this).parents(".trip_xcdz_main_rt2").attr("data-id"),
           _name = $parent.attr("data-name"),
           i = 0;
            $parent.remove();
            fnAutosort(".trip_xcdz_main_rt2[data-id=" + _id + "] .h2Nums");
            $(".dayBox[data-id=" + _id + "] li[data-name=" + _name + "]").remove();
        });

        //上移
        $(document).on("click", ".trip_xcdz_main_rt2:visible .icon_up", function (event) {
            var ev = event || window.event,
                _id = $(this).parents(".trip_xcdz_main_rt2").attr("data-id"),
                _index = $(this).index(".trip_xcdz_main_rt2:visible .icon_up"),
               $parent = $(this).parents(".trip_xcdz_main_pane"),
                _prev = $parent.prev(".trip_xcdz_main_pane"),
                _name = $(this).parents(".trip_xcdz_main_pane").attr("data-name");

            var $li = $(".dayBox[data-id=" + _id + "] li[data-name=" + _name + "]"),
                $liPrev = $li.prev();
            if (_index != 0) {//不是第一个元素
                $parent.after(_prev);
                $li.after($liPrev);
                fnAutosort(".trip_xcdz_main_rt2[data-id=" + _id + "] .h2Nums");
            } else {//已经第一个元素
                alert("不能上移，已经第一个元素");
            }
        });

        //下移
        $(document).on("click", ".trip_xcdz_main_rt2:visible .icon_down", function (event) {
            var ev = event || window.event,
                _index = $(this).index(".trip_xcdz_main_rt2:visible .icon_down"),
               $parent = $(this).parents(".trip_xcdz_main_pane"),
                _next = $parent.next(".trip_xcdz_main_pane"),
                _id = $(this).parents(".trip_xcdz_main_rt2").attr("data-id"),
                _name = $(this).parents(".trip_xcdz_main_pane").attr("data-name"),
                _lens = $(".trip_xcdz_main_rt2[data-id=" + _id + "] .trip_xcdz_main_pane").length;
            var $li = $(".dayBox[data-id=" + _id + "] li[data-name=" + _name + "]"),
                  $liNext = $li.next();

            if (_index != _lens - 1) {//不是第一个元素
                $parent.before(_next);
                fnAutosort(".trip_xcdz_main_rt2[data-id=" + _id + "] .h2Nums");
                $li.before($liNext);
            } else {//已经第一个元素	
                alert("不能下移，已经是最后一个元素");
            }



        });

        //排序
        //公共方法（内容块自动排序）
        function fnAutosort(obj) {
            $(obj).each(function (i) {
                $(this).html(i + 1);
            });
        }

        //标题根据右侧内容排序
        function fnAutosortTitle(obj) {
            $(obj).each(function (i) {
                $(this).html(i + 1);
            });
        }
    });
</script>
</body>
</html>