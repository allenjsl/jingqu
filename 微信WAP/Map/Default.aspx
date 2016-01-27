<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ychmap._Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>阳澄湖地图</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/map.css" />
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="mapapi_3.12.15.js"></script>
    <script type="text/javascript">
        var mapconfig = null;
        var attstyle = '<div style="position:relative;white-space: nowrap;  width：auto;border:1px solid #275D6C; border-radius:6px; background:#259BBE;box-shadow: 3px 3px 5px #888888;  text-align:center; padding:0 15px;" onclick="showcard(\'{1}\')"><span style=" line-height:30px;color:#fff; ">{0}<i style="display:block; width:0; height:0; border-width:10px 10px 0px; border-style:solid; border-color:#259BBE transparent transparent; position:absolute; bottom:-10px; *bottom:-38px; left: 50%; margin-left: -13px;"></i></span></div>';
        var showname = ['星华街游客中心', '奕欧来苏州精品旅游购物村', '仙樱湖公园', '云彬湖公园', '重元寺', '浅水湾商业街', '生态湿地', '阳澄西湖果园', '樱花岛', '天主教堂', '阳澄人家', '草鞋山遗址', '莲池湖公园'];
        var step; var z; var xxx; var yyy; var scegooglex; var scegoogley; var spinzoomx; var spinzoomy; var spinx; var spiny;
        var host = 'http://img.weyoo.cn/';
        var map;
        var sceid = 5023;
        var allpoint = null;
        var pointmarker = [];
        var pointdiv = [];
        var pointlatlng = [];
        var polyline = null;
        var allpoint = new Array();
        var locationlogo = null;
        var xy;
        var sx = 0.000026;
        var sy = 0.00005;
        var stepnum = 0;
        var iscamera = false;

        $("document").ready(function () {//开始
            if (fnRequest("id") != "") {
                sceid = fnRequest("id");
                //document.getElementById("iop").src = "operator.aspx?id=" + sceid;
            }
            if (fnRequest("c") == "true") {
                iscamera = true;
            } else {
                iscamera = false;
            }
            function loadmap() {
                step = parseInt(mapconfig.maplevel) - 1;
                z = parseInt(mapconfig.fitvalue);
                xxx = mapconfig.googlecenterx * 1;
                yyy = mapconfig.googlecentery * 1;
                scegooglex = mapconfig.googlex;
                scegoogley = mapconfig.googley;
                spinzoomx = mapconfig.googlespinzoomx;
                spinzoomy = mapconfig.googlespinzoomy;
                spinx = mapconfig.googlespinx;
                spiny = mapconfig.googlespiny;
                var mapOptions = {
                    getTileUrl: function (coord, zoom) {
                        var ymax = 1 << zoom;
                        var y = ymax - coord.y - 1;
                        return getmapimage(zoom, coord.x, coord.y);
                    },
                    tileSize: new google.maps.Size(256, 256),
                    isPng: false,
                    maxZoom: mapconfig.fitvalue * 1 + mapconfig.maplevel * 1 - 1,
                    minZoom: mapconfig.fitvalue * 1,
                    name: '3dmap',
                    opacity: 1
                }
                var myMapType = new google.maps.ImageMapType(mapOptions);
                //var point3d = googleto3d(mapconfig.x * 1, mapconfig.y * 1);
                //var myLatLng = new google.maps.LatLng(point3d.x, point3d.y);
                var myLatLng = new google.maps.LatLng(mapconfig.x * 1, mapconfig.y * 1);
                var myOptions = {
                    zoom: mapconfig.initlevel * 1,
                    center: myLatLng,
                    disableDefaultUI: true,
                    zoomControl: true,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    zoomControlOptions: {
                        style: google.maps.ZoomControlStyle.DEFAULT,
                        position: google.maps.ControlPosition.RIGHT_CENTER
                    },
                    mapTypeControlOptions: {
                        mapTypeIds: ["3dmap", google.maps.MapTypeId.SATELLITE]
                    }
                }
                map = new google.maps.Map(document.getElementById("map"), myOptions);
                map.mapTypes.set("3dmap", myMapType);
                map.setMapTypeId("3dmap");
                var pointleft = xytolatlng(0, 0);
                var pointright = xytolatlng(mapconfig.maxwidth, mapconfig.maxheight);
                var point3dleft = googleto3d(pointleft.x, pointleft.y);
                var point3dright = googleto3d(pointright.x, pointright.y);
                imgleftx = point3dleft.x;
                imglefty = point3dleft.y;
                imgrightx = point3dright.x;
                imgrighty = point3dright.y;
                stepnum = mapconfig.fitvalue * 1 + mapconfig.maplevel * 1 - map.zoom;
                google.maps.event.addListener(map, "dragend", function (e) {
                    $(".map_box").hide();
                });
                google.maps.event.addListener(map, "zoom_changed", function (e) {
                    if (map.zoom == 16) {
                        clearmarker();
                        cleardiv();
                        laodspecialpoint();
                        if (iscamera) {
                            stepnum = mapconfig.fitvalue * 1 + mapconfig.maplevel * 1 - map.zoom;
                            loadp();
                        }
                    } else if (map.zoom == 17) {
                        clearmarker();
                        cleardiv();
                        loadths();
                    } else if (map.zoom == 18) {
                        clearmarker();
                        cleardiv();
                        loadmarker();
                    }
                    else {
                        clearmarker();
                        cleardiv();
                        stepnum = mapconfig.fitvalue * 1 + mapconfig.maplevel * 1 - map.zoom;
                        loadp();
                    }
                });
                if (mapconfig.initlevel != "16") {
                    loadp();
                }

                if (mapconfig.initlevel == "16") {
                    laodspecialpoint();
                }
                return map;
            }
            function getmapimage(zoom, x, y) {
                var zoooom = mapconfig.fitvalue * 1;
                if (zoom == zoooom)
                    return host + "map/map_sec_" + mapconfig.scecode + "/map1/" + (x - xxx) + "," + (y - yyy) + ".jpg";
                else if (zoom == zoooom + 1)
                    return host + "map/map_sec_" + mapconfig.scecode + "/map2/" + (x - xxx * 2) + "," + (y - yyy * 2) + ".jpg";
                else if (zoom == zoooom + 2)
                    return host + "map/map_sec_" + mapconfig.scecode + "/map3/" + (x - xxx * 4) + "," + (y - yyy * 4) + ".jpg";
                else if (zoom == zoooom + 3)
                    return host + "map/map_sec_" + mapconfig.scecode + "/map4/" + (x - xxx * 8) + "," + (y - yyy * 8) + ".jpg";
                else if (zoom == zoooom + 4)
                    return host + "map/map_sec_" + mapconfig.scecode + "/map5/" + (x - xxx * 16) + "," + (y - yyy * 16) + ".jpg";
                else if (zoom == zoooom + 5)
                    return host + "map/map_sec_" + mapconfig.scecode + "/map6/" + (x - xxx * 32) + "," + (y - yyy * 32) + ".jpg";
            }
            function clearmarker() {
                if (pointmarker != null && pointmarker.length > 0) {
                    for (var i = 0; i < pointmarker.length; i++) {
                        pointmarker[i].setMap(null);
                    }
                    pointmarker.length = 0;
                }
            }
            function cleardiv() {
                if (pointdiv != null && pointdiv.length > 0) {
                    for (var i = 0; i < pointdiv.length; i++) {
                        pointdiv[i].setMap(null);
                    }
                    pointdiv.length = 0;
                }
            }
            function fnRequest(strName) {
                var strHref = window.document.location.href;
                var intPos = strHref.indexOf("?");
                var strRight = strHref.substr(intPos + 1);
                var arrTmp = strRight.split("&");
                for (var i = 0; i < arrTmp.length; i++) {
                    var arrTemp = arrTmp[i].split("=");
                    if (arrTemp[0].toUpperCase() == strName.toUpperCase()) return arrTemp[1];
                }
                return "";
            }
            $.ajax({
                url: 'mapconfig.txt',
                success: function (data) {
                    mapconfig = $.parseJSON(data);
                },
                complete: function (a, b) {
                    map = loadmap();
                }
            });

        });


        //结束
        CreateCustomMarker.prototype = new google.maps.OverlayView();
        function CreateCustomMarker(latlng, html) {
            this.map = map;
            this.text = html;
            this.latLng = latlng;
            this.div = null;
            this.setMap(map);
        }
        CreateCustomMarker.prototype.onAdd = function () {
            this.div = document.createElement('div');
            this.div.style.position = 'absolute';
            this.div.innerHTML = this.text;
            this.getPanes().floatPane.appendChild(this.div);
        };
        CreateCustomMarker.prototype.draw = function () {
            if (this.div) {
                var latLng = this.getProjection().fromLatLngToDivPixel(this.latLng),
           size = new google.maps.Size(0, 0);
                this.div.style.left = latLng.x + size.width + 'px';
                this.div.style.top = latLng.y + size.height + 'px';
            }
        };
        CreateCustomMarker.prototype.onRemove = function () {
            this.div.parentNode.removeChild(this.div)
            this.div = null;
        }
        function mypixToworldpix(x, y, zoom) {
            var zoooom;
            zoooom = mapconfig.fitvalue * 1;
            var px, py;
            px = (x + 256 * xxx * Math.pow(2, zoom)) / Math.pow(2, (zoom + zoooom));
            py = (y + 256 * yyy * Math.pow(2, zoom)) / Math.pow(2, (zoom + zoooom));
            var point1 = new google.maps.Point(px, py);
            return point1;
        }
        function pixelToLng(pixelX, zoom) {
            return pixelX * 360 / (256 << zoom) - 180;
        }

        function pixelToLat(pixelY, zoom) {
            var y = 2 * Math.PI * (1 - pixelY / (128 << zoom));
            var z = Math.pow(Math.E, y);
            var siny = (z - 1) / (z + 1);
            return Math.asin(siny) * 180 / Math.PI;
        }
        function lngToPixel(lng, zoom) {
            return (lng * 1 + 180) * (256 << zoom) / 360;
        }

        function latToPixel(lat, zoom) {
            var siny = Math.sin(lat * Math.PI / 180);
            var y = Math.log((1 + siny) / (1 - siny));
            return (128 << zoom) * (1 - y / (2 * Math.PI));
        }
        function inRatpoint(x, y) {
            var x1 = (x - spinx) * spinzoomx;
            var y1 = (y - spiny) * spinzoomy;
            var point = new google.maps.Point(x1, y1);
            return point;
        }
        function inoffset(x, y) {
            var x000000000 = scegooglex * 1;
            var y000000000 = scegoogley * 1;
            var x1 = x + x000000000;
            var y1 = y + y000000000;
            var point = new google.maps.Point(x1, y1);
            return point;
        }
        function getRatpoint(x, y) {
            var x1 = x / spinzoomx + spinx * 1;
            var y1 = y / spinzoomy + spiny * 1;
            var point = new google.maps.Point(x1, y1);
            return point;
        }
        function rotate(x, y) {
            var a1 = Math.PI / 180 * 45;
            var a2 = Math.PI / 180 * 30;

            var a3 = Math.PI / 180 * 31;
            var x3 = x * Math.cos(a3) - y * Math.sin(a3);
            var y3 = y * Math.cos(a3) + x * Math.sin(a3);
            var point1 = new google.maps.Point(x3, y3);
            return point1;

        }
        function inrotate(x, y) {
            var a1 = Math.PI / 180 * 45;
            var a2 = Math.PI / 180 * 30;
            var a3 = Math.PI / 180 * (-31);
            var x3 = x * Math.cos(a3) - y * Math.sin(a3);
            var y3 = y * Math.cos(a3) + x * Math.sin(a3);
            var point1 = new google.maps.Point(x3, y3);
            return point1;
        }
        function getRefpoint(x, y) {
            var x000000000 = scegooglex;
            var y000000000 = scegoogley;
            var x0 = x - x000000000;
            var y0 = y - y000000000;
            var point2 = new google.maps.Point(x0, y0);
            return point2;
        }
        function googleto3d(lat, lng) {
            var point3 = getRefpoint(lngToPixel(lng, 0), latToPixel(lat, 0));
            var point2 = rotate(point3.x, point3.y);
            var point5 = getRatpoint(point2.x, point2.y);
            var point = new google.maps.Point();
            point.y = pixelToLng(point5.x, 0);
            point.x = pixelToLat(point5.y, 0);
            return point;
        }
        function d3togoogle(lat, lng) {
            var point3 = inRatpoint(lngToPixel(lng, 0), latToPixel(lat, 0));
            var point2 = inrotate(point3.x, point3.y);
            var point5 = inoffset(point2.x, point2.y);
            var point = new google.maps.Point();
            point.y = pixelToLng(point5.x, 0);
            point.x = pixelToLat(point5.y, 0);
            return point;
        }
        function latlngtoxy(x, y) {
            var lat = x * 1;
            var lng = y * 1;
            var point;
            var xlat = latToPixel(lat, 0);
            var xlng = lngToPixel(lng, 0);
            point = getRefpoint(xlng, xlat);
            point = rotate(point.x, point.y);
            point = getRatpoint(point.x, point.y);
            var y = parseInt(point.y * Math.pow(2, z + step) - yyy * Math.pow(2, step) * 256);
            var x = parseInt(point.x * Math.pow(2, z + step) - xxx * Math.pow(2, step) * 256);
            var jjj = new google.maps.Point(x, y);
            return jjj;
        }
        function xytolatlng(x, y) {
            var lat = x * 1;
            var lng = y * 1;
            var point = mypixToworldpix(lat, lng, step);
            var xlng = pixelToLng(point.x, 0);
            var xlat = pixelToLat(point.y, 0);
            var point1 = inRatpoint(lngToPixel(xlng, 0), latToPixel(xlat, 0));
            var point2 = inrotate(point1.x, point1.y);
            var point3 = inoffset(point2.x, point2.y);
            var x = point3.x;
            var y = point3.y;
            var nlng = pixelToLng(x, 0);
            var nlat = pixelToLat(y, 0);
            var jjj = new google.maps.Point(nlat, nlng);
            return jjj;
        }
        function laodspecialpoint() {
            if (pointlist != 'undefined' && pointlist != null) {
                for (var i = 1; i < pointlist.length; i++) {
                    if (!iscamera) {
                        for (var j = 0; j < showname.length; j++) {
                            if (pointlist[i].name == showname[j]) {
                                var p = xytolatlng(pointlist[i].x * 32, pointlist[i].y * 32);
                                var p = googleto3d(p.x, p.y);
                                var xy = new google.maps.LatLng(p.x + sx * 32, p.y - sy * 32);
                                pointdiv.push(new CreateCustomMarker(xy, attstyle.replace("{0}", pointlist[i].name).replace("{1}", pointlist[i].name)));
                            }
                        }
                    }
                }
            }
        }
        function loadths() {
            if (pointlist != 'undefined' && pointlist != null) {
                for (var i = 1; i < pointlist.length; i++) {
                    var p = xytolatlng(pointlist[i].x * 32, pointlist[i].y * 32);
                    var p = googleto3d(p.x, p.y);
                    if (!iscamera) {
                        if (pointlist[i].type == "4" || pointlist[i].type == "7") {
                            var xy = new google.maps.LatLng(p.x, p.y);
                            var marker = new google.maps.Marker({
                                position: xy,
                                map: map,
                                icon: 'http://drore.weyoo.cn/' + pointlist[i].src,
                                title: pointlist[i].name
                            });
                            pointmarker.push(marker);
                        }
                    } else {
                        if (pointlist[i].type == "13") {
                            var xy = new google.maps.LatLng(p.x, p.y);
                            var marker = new google.maps.Marker({
                                position: xy,
                                map: map,
                                icon: 'http://drore.weyoo.cn/' + pointlist[i].src,
                                title: pointlist[i].name
                            });
                            pointmarker.push(marker);
                        }
                    }
                }
            }

        }
        function loadmarker() {
            if (pointlist != 'undefined' && pointlist != null) {
                for (var i = 1; i < pointlist.length; i++) {
                    var p = xytolatlng(pointlist[i].x * 32, pointlist[i].y * 32);
                    var p = googleto3d(p.x, p.y);
                    if (!iscamera) {
                        if (pointlist[i].type != "0" && pointlist[i].type != "13") {
                            var xy = new google.maps.LatLng(p.x, p.y);
                            var marker = new google.maps.Marker({
                                position: xy,
                                map: map,
                                icon: 'http://drore.weyoo.cn/' + pointlist[i].src,
                                title: pointlist[i].name
                            });
                            pointmarker.push(marker);
                        }
                    } else {
                        if (pointlist[i].type == "13") {
                            var xy = new google.maps.LatLng(p.x, p.y);
                            var marker = new google.maps.Marker({
                                position: xy,
                                map: map,
                                icon: 'http://drore.weyoo.cn/' + pointlist[i].src,
                                title: pointlist[i].name
                            });
                            pointmarker.push(marker);
                        }
                    }
                }
            }

        }


        function loadp() {
            if (pointlist != 'undefined' && pointlist != null) {
                for (var i = 1; i < pointlist.length; i++) {
                    var p = xytolatlng(pointlist[i].x * 32, pointlist[i].y * 32);
                    var p = googleto3d(p.x, p.y);
                    if (!iscamera) {
                        if (pointlist[i].type == "0") {
                            var n = 0;
                            if (stepnum == 1) {
                                n = 1;
                            } else if (stepnum == 2) {
                                n = 2;
                            } else if (stepnum == 3) {
                                n = 4;
                            } else if (stepnum == 4) {
                                n = 8;
                            } else if (stepnum == 5) {
                                n = 16;
                            } else if (stepnum == 6) {
                                n = 32;
                            }
                            var xy = new google.maps.LatLng(p.x + sx * n, p.y - sy * n);
                            pointdiv.push(new CreateCustomMarker(xy, attstyle.replace("{0}", pointlist[i].name).replace("{1}", pointlist[i].name)));
                        } else {
                            if (pointlist[i].type != "13") {
                                var xy = new google.maps.LatLng(p.x, p.y);
                                var marker = new google.maps.Marker({
                                    position: xy,
                                    map: map,
                                    icon: 'http://drore.weyoo.cn/' + pointlist[i].src,
                                    title: pointlist[i].name
                                });
                                pointmarker.push(marker);
                            }
                        }


                    } else {
                        if (pointlist[i].type == "13") {
                            var xy = new google.maps.LatLng(p.x, p.y);
                            var marker = new google.maps.Marker({
                                position: xy,
                                map: map,
                                icon: 'http://drore.weyoo.cn/' + pointlist[i].src,
                                title: pointlist[i].name
                            });
                            pointmarker.push(marker);
                        }
                    }
                }
            }

        }
        function showaudio() {
            if ($("#ptitle").html() == "语言讲解") {
                document.getElementById("aplay").src = $("#txtaudiourl").val();
                aplay.outerHTML = aplay.outerHTML;
                $("#ptitle").html('关闭讲解')
            } else {
                document.getElementById("aplay").src = "";
                aplay.outerHTML = aplay.outerHTML;
                $("#ptitle").html('语言讲解')
            }
        }
        function showcard(name) {
            var url = 'http://gk.sip-ych.com/ashx/MapHandler.ashx?action=getscenicspots&name=' + encodeURIComponent(name);
            $.ajax({
                type: "GET",
                url: url,
                dataType: "jsonp",
                cache: false,
                success: function (data) {
                    if (data) {
                        if (data.data && data.data[0]) {
                            var img = "";
                            var card = $(".map_box");
                            if (data.data[0].photos) {
                                var f = $.parseJSON(data.data[0].photos);
                                img = data.imgServerDomain + f.img;
                                $("#txtaudiourl").val(data.imgServerDomain + f.audio);
                            }
                            if (img != "")
                                $("#aimg").attr("src", img);
                            if (data.data[0].title != "")
                                $("#atitle").html(data.data[0].title);
                            if (data.data[0].pricedesc != "")
                                $("#acontent").html(data.data[0].pricedesc);
                            $(".map_box").show();
                        }
                    } else {
                        alert('数据请求失败');
                    }
                },
                error: function (msg) {
                    alert('数据请求失败');
                }
            });
        }
        function b(b) {
            if (locationlogo != null) {
                locationlogo.setMap(null);
                locationlogo = null;
            }
            var blat = b.lat + 0.00075;
            var blon = b.lon + 0.0003;
            var pp = latlngtoxy(blat, blon);
            var d3xy = googleto3d(blat, blon);
            if (pp.x > 0 && pp.x < mapconfig.maxwidth && pp.y > 0 && pp.y < mapconfig.maxheight) {
                var xy3d = new google.maps.LatLng(d3xy.x, d3xy.y);
                locationlogo = new google.maps.Marker({
                    position: xy3d,
                    map: map
                });
                map.panTo(xy3d);
            } else {
                alert("您不在景区内");
            }
        }
        var getLocation = function (cb) {
            var pos = null, nav = navigator;
            if (nav.geolocation) {
                nav.geolocation.getCurrentPosition(function (position) {
                    pos = {
                        lat: position.coords.latitude,
                        lon: position.coords.longitude
                    }
                    cb(pos);
                }, function () {
                    alert('获取您的位置信息失败！');
                    cb(pos);
                }, {

                });
            }
            else {
                alert('您的浏览器不支持定位！');
                cb(pos);
            }
        };
        function getlocation() {
            getLocation(b);
        }
    </script>
</head>
<body>
    <input type="hidden" id="txtaudiourl" />
    <embed autoplay="true" src="" hidden="true" id="aplay" />
    <div style="width: 100%; height: 100%; overflow: hidden; position: relative;">
        <form id="form1" runat="server">
            <div style="height: 100%; width: 100%" id="map"></div>
        </form>
    </div>
    <div class="map_box" id="map_box" style="display: none">
        <div class="map_tel" onclick="showaudio();">
            <img src="images/tel.png" /><p id="ptitle">语言讲解</p>
        </div>
        <div class="map_main">
            <img src="{0}" id="aimg" />
            <h2 id="atitle">loading...</h2>
            <p id="acontent">loading...</p>

        </div>
    </div>
    <div style="position: absolute; left: 0px; top: 260px; width: 90px; height: 90px" onclick="getlocation();">
        <img style="width: 30px; height: 30px" src="images/ico_mylocation.png" />
    </div>
</body>
</html>
