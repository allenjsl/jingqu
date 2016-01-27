<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="travel_hotel_inorder.aspx.cs" Inherits="Adpost.YCH.WEB.traveling.travel_hotel_inorder" %>
<%@ Register src="~/WebControls/RightQuickMenu.ascx" tagname="RightQuickMenu" tagprefix="uc1" %>
<%@ Register src="~/WebControls/WebHeader.ascx" tagname="WebHeader" tagprefix="uc2" %>
<%@ Register src="~/WebControls/WebFooter.ascx" tagname="WebFooter" tagprefix="uc3" %>
<%@ Register Src="~/WebControls/CommonLogin.ascx" TagPrefix="uc1" TagName="CommonLogin" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head runat="server">
    <meta name="google" content="notranslate">
    <meta charset="UTF-8">
    <meta name="author" content="UZIK">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>多彩な旅-泊まる</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link href="../css/reset.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../css/style1.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../css/travel.css">
    <link rel="stylesheet" type="text/css" href="../css/public.css">

    <link href="../css/datepicker.css" rel="stylesheet">
    <style>
        .container {
            background: #fff;
        }

        #alert {
            display: none;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.SuperSlide.2.1.js"></script>
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



            <section class="travel_shopping_list_main">
                <div class="shopping_list_body">

                    <div class="shopping_list_leftmenu">
                        <ul>
                            <li><a href="travel_hotel_list.aspx">度假区酒店列表</a></li>
                            <li><a href="#" class="on">填写预定订单</a></li>
                            <li><a href="#">确认订单</a></li>
                            <li><a href="#">在线支付</a></li>
                        </ul>
                    </div>

                    <div class="food_list_title"><h2>填写预定订单</h2></div>

                    <div class="well">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>入住时间</th>
                                    <th>离店时间</th>
                                    <th>入住天数</th>
                                </tr>
                                <tr>
                                    <th><input type="text" class="span2" value="" id="dpd1" name="dpd1"></th>
                                    <th><input type="text" class="span2" value="" id="dpd2" name="dpd2"></th>
                                    <th><input type="text" class="span3" readonly id="dpd3" name="dpd3"></th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="hotel_list_messages">
                        <table>
                            <tr>
                                <td width="15%">联系人：</td>
                                <td width="85%"><input type="text" class="hotel_ip3" name="linkman"></td>
                            </tr>
                            <tr>
                                <td width="15%">手机号：</td>
                                <td width="85%"><input type="text" class="hotel_ip3" name="phone"></td>
                            </tr>
                            <tr>
                                <td width="15%">地址：</td>
                                <td width="85%"><input type="text" class="hotel_ip3" name="address"></td>
                            </tr>
                            <tr>
                                <td>备注：</td>
                                <td><textarea class="hotel_are1" name="remark"></textarea></td>
                            </tr>
                        </table>
                    </div>

                    <div class="hotel_list_num">
                        <div class="hotel_list_num_lt left"><p><asp:Literal ID="ltrRoomName" runat="server"></asp:Literal></p><span>&yen;<asp:Literal ID="ltrPrice" runat="server"></asp:Literal></span></div>
                        <div class="hotel_list_num_rt right">
                            <table>
                                <tr>
                                    <td width="50%">成人入住数</td>
                                    <td width="50%">儿童入住数</td>
                                </tr>
                                <tr>
                                    <td style="position:relative;">
                                        <input type="text" class="hotel_ip1" id="peo1" name="peo1" value="1">
                                        <div class="hotel_list_down" id="hotel_down1">
                                            <ul>
                                                <li>1</li>
                                                <li>2</li>
                                                <li>3</li>
                                                <li>4</li>
                                                <li>5</li>
                                            </ul>
                                        </div>
                                    </td>
                                    <td style="position:relative;">
                                        <input type="text" class="hotel_ip1" id="peo2" name="peo2" value="0">
                                        <div class="hotel_list_down" id="hotel_down2">
                                            <ul>
                                                <li>0</li>
                                                <li>1</li>
                                                <li>2</li>
                                                <li>3</li>
                                                <li>4</li>
                                                <li>5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <!--
                    <div class="hotel_list_sale">
                        优惠券码<input type="text" class="hotel_ip2">
                    </div>
                    -->
                    <div class="hotel_list_btn">
                        <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click">下一步</asp:LinkButton></div>

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
                    is_tablet: false,
                    fixedTop: 0,
                    is_mobile: false
                }
            );
        });
    </script>

    <script src="../js/prettify.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script>
        if (top.location != location) {
            top.location.href = document.location.href;
        }
        $(function () {
            window.prettyPrint && prettyPrint();
            // disabling dates
            var nowTemp = new Date();
            var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

            var checkin = $('#dpd1').datepicker({
                onRender: function (date) {
                    return date.valueOf() < now.valueOf() ? 'disabled' : '';
                }
            }).on('changeDate', function (ev) {
                if (ev.date.valueOf() > checkout.date.valueOf()) {
                    var newDate = new Date(ev.date)
                    newDate.setDate(newDate.getDate() + 1);
                    checkout.setValue(newDate);
                }
                checkin.hide();
                $('#dpd2')[0].focus();
            }).data('datepicker');
            var checkout = $('#dpd2').datepicker({
                onRender: function (date) {
                    return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
                }
            }).on('changeDate', function (ev) {
                checkout.hide();
                var date1 = $("#dpd1").val();
                var date2 = $("#dpd2").val();
                var date3 = getDays(date1, date2);

                $("#dpd3").val(date3);

            }).data('datepicker');
        });

        function getDays(strDateStart, strDateEnd) {
            var strSeparator = "/"; //日期分隔符
            var oDate1;
            var oDate2;
            var iDays;
            oDate1 = strDateStart.split(strSeparator);
            oDate2 = strDateEnd.split(strSeparator);
            var strDateS = new Date(oDate1[0] + "/" + oDate1[1] + "/" + oDate1[2]);
            var strDateE = new Date(oDate2[0] + "/" + oDate2[1] + "/" + oDate2[2]);
            iDays = parseInt(Math.abs(strDateS - strDateE) / 1000 / 60 / 60 / 24)//把相差的毫秒数转换为天数
            return iDays;
        }

    </script>
</body>
</html>
