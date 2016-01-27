<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xingcheng-list.aspx.cs" Inherits="Adpost.YCH.WAP.WEB.xingcheng_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/xingcheng-list.css">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<script src="../js/zepto.min.js" type="text/javascript"></script>
<title>阳澄湖半岛旅游度假区</title>
</head>
<body>
    <form id="form1" runat="server">
    <!--header begin-->
<header class="header center">
	<div class="hd-back font16">
		<a href="javascript:history.go(-1);">
			
		</a>
	</div>
	<div class="hd-title font24 bold">阳澄湖半岛度假区</div>
	<a class="hd-user icon" href="user-center.html"></a>
</header>
<!--header end-->
<!--outer-wrap begin-->
<div class="outer-wrap borderBox">
	<!--nav begin-->
	<!--load begin-->
	<div id="navObj"></div>
	<script>
	    $(function () {
	        $("#navObj").load("nav.aspx", function () {
	            $(".nav li").eq(2).addClass("active");
	        });
	    });
	</script>
	<!--load end-->
	<!--load注释里面内容请开发时换用include引用-->
	<!--nav end-->
	<!--inner-wrap begin-->
	<div class="inner-wrap borderBox">
		<div class="in-banner fixed borderBox">
			<div class="icon dz-banner posR"></div>
		</div>
        <div class="in-box-top"></div>
	</div>
    <div class="main_bg">
        <div class="main_content">
            <div class="main_content_top">
                <table>
                	<tr>
                    	<td>行程名称：</td>
                        <td><input type="text" name="tourname"></td>
                    </tr>
                    <tr>
                    	<td>行程日期：</td>
                        <td><input type="text" name="tourdate"></td>
                    </tr>
                </table>
            </div>
            <div class="main_content_body">
                <div class="trip_main">
                <div class="tabPane">
                    <ul>
                      <li class="hit">景点</li>
                      <li>美食</li>
                      <li>酒店</li>
                    </ul>
                  </div>
                <div class="trip_main_lt left">
                  
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
                    
                    <div class="trip_xcdz_main">
                      <div class="trip_xcdz_main_lt left" id="dayObj">
                        <div class="dayBox" data-id="1">
                          <h1 class="on"  data-id="1">D<i class="nums">1</i></h1>                          
                          <ul></ul>
                          <i class="dayDel">删除</i>
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
                              <textarea name="lineremark" class="pane_area1" value="负责任地介绍这一天的行程亮点和小提醒" onBlur="if(this.value==''){this.value='负责任地介绍这一天的行程亮点和小提醒'};" onFocus="if(this.value=='负责任地介绍这一天的行程亮点和小提醒'){this.value=''};"/></textarea>
                            </div>
                          </div>
                        </div><asp:Button ID="btnSave" runat="server" CssClass="save_btn" Text="点击保存" OnClick="btnSave_Click" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
        </div>
    </div>
	<!--inner-wrap end-->
</div>
<!--outer-wrap end-->
    </form>
    <script src="../js/utils.js" type="text/javascript"></script>
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
            var h1Html = $(this).parent("li").find("h1").eq(0).html();
            var hotspotId = $(this).attr("EID");
            //对应天数在显示的天数下面添加内容
            $("#dayMain .trip_xcdz_main_rt2").each(function (i) {
                if ($(this).is(':visible')) {
                    //天数
                    var daysNum = $(this).find(".days").eq(0).html();
                    var i = $(this).find(".trip_xcdz_main_pane").length,
                        _i = i + 1;
                    var $html = '<div class="trip_xcdz_main_pane" ><input type="hidden" name="days" value="' + daysNum + '"><input type="hidden" name="hotspotId" value="' + hotspotId + '"><span class="icon_span1"><img src="../images/icons33.png"></span><span class="icon_span2"><img src="../images/member_collect_icon4.png"></span><h2 ><i class="h2Nums" >' + _i + '</i>.' + h1Html + '</h2><input type="text" name="remark" class="pane_input1" value="添加备注"};/></div>';
                    $(this).find("#panAddBox").append($html);
                };
            });
        });

        //景点添加
        $("#paneObj .jingdianAdd").click(function () {
            var h1Html = $(this).parent("li").find("h1").eq(0).html();
            var hotspotId = $(this).attr("EID");
            //对应天数在显示的天数下面添加内容
            $("#dayMain .trip_xcdz_main_rt2").each(function (i) {
                if ($(this).is(':visible')) {
                    //天数
                    var daysNum = $(this).find(".days").eq(0).html();
                    var i = $(this).find(".trip_xcdz_main_pane").length,
                        _i = i + 1;
                    var $html = '<div class="trip_xcdz_main_pane " data-name="' + i + '"><input type="hidden" name="days" value="' + daysNum + '"><input type="hidden" name="hotspotId" value="' + hotspotId + '"><span class="icon_span1"><img src="../images/icons33.png"></span><span class="icon_span2"><img src="../images/member_collect_icon4.png"></span><h2 ><i class="h2Nums" >' + _i + '</i>.' + h1Html + '</h2><input type="text" class="pane_input1" name="remark" value="添加备注"/></div>';
                    $(this).find("#panAddBox").append($html);
                };
            });
        });
        //景点添加的时候在天数下面添加对应内容
        $("#paneObj .jingdianAdd").click(function () {
            var h1Html = $(this).parent("li").find("h1").eq(0).html(),
                $parents = $("#dayObj h1[class='on']").next(),
                i = $parents.find("li").length;
            //$parents.append('<li data-name="' + i + '">' + h1Html + '</li>');
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
