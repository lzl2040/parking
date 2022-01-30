<%--
  Created by IntelliJ IDEA.
  User: yxm521
  Date: 2022/1/23
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=4vYD7CG1HjAKfDhKAoUpVNyGho0H8pCF"></script>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=1.0&type=webgl&ak=4vYD7CG1HjAKfDhKAoUpVNyGho0H8pCF"></script>
    <style type="text/css">
        body{
            width: 100%;
            height: 100%;
        }
        .middleFrame{
            display: flex;
            margin: 0 0;
            background: grey;
            width: 100%;
            height: 100%;
        }
        .leftFrame{
            float: left;
            height: 100%;
            width: 120px;
            background: rgb(54,58,71);
        }
        .mainFrame{
            width: 100%;
            height: 100%;
            background: white;
            float: left;
        }
    </style>
    <%@include file="/page/common/base.jsp"%>
    <%--    address int there do not need to add /--%>
    <script src="static/jquery/jquery-3.5.1.js"></script>
    <title>管理中心</title>
    <style type="text/css">
        #container{
            height: 100%;
        }
    </style>
</head>
<body>
    <%@include file="/page/common/userTop.jsp"%>
    <div class="middleFrame">
        <%@include file="/page/common/leftNav.jsp"%>
        <div class="mainFrame">
            <div id="container">

            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function (){
            setSelected(window.location.hash);
            initMap();

            $(".function-menu").on("click","li",function (){
                var eId = $(this).data("id");
                window.location.hash = eId;
            });

            function initMap(){
                var freeSpace = new BMapGL.Icon("static/img/free.png", new BMapGL.Size(23, 23), {
                    // 指定定位位置。
                    // 当标注显示在地图上时，其所指向的地理位置距离图标左上
                    // 角各偏移10像素和25像素。您可以看到在本例中该位置即是
                    // 图标中央下端的尖角位置。
                    anchor: new BMapGL.Size(10, 25)
                });
                var notFreeSpace = new BMapGL.Icon("static/img/notfree.png", new BMapGL.Size(23, 23), {
                    // 指定定位位置。
                    // 当标注显示在地图上时，其所指向的地理位置距离图标左上
                    // 角各偏移10像素和25像素。您可以看到在本例中该位置即是
                    // 图标中央下端的尖角位置。
                    anchor: new BMapGL.Size(10, 25)
                });
                var map = new BMapGL.Map("container");
                var point = new BMapGL.Point(116.331398,39.897445);
                map.centerAndZoom(point,19);                                        //中心点以及缩放
                map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
                locateMyPosition(map);
                addMarker(map,freeSpace,notFreeSpace);
            }

            function addMarker(map,free,notfree){
              <c:forEach items="${sessionScope.locations}" var="location">
                    <c:if test="${location.has_car == 1}">
                        var marker1 = new BMapGL.Marker(new BMapGL.Point(${location.longtitude}, ${location.latitude}),{icon: notfree});
                        map.addOverlay(marker1);
                    </c:if>
                    <c:if test="${location.has_car == 0}">
                        var marker = new BMapGL.Marker(new BMapGL.Point(${location.longtitude}, ${location.latitude}),{icon: free});
                        map.addOverlay(marker);
                    </c:if>
                </c:forEach>
            };

            function locateMyPosition(map){
                var ggPoint = null;
                var x,y;
                navigator.geolocation.getCurrentPosition(function (position) {
                     //得到html5定位结果
                     x = position.coords.longitude;
                     y = position.coords.latitude;
                     map.panTo(new BMapGL.Point(x,y));
                     console.log("经度:"+x+" 纬度:"+y);
                });

            };

            function setSelected(eId){
                switch (eId){
                    case "#car-position":
                        $(".function-menu li").eq(0).addClass("current").siblings().removeClass("current");
                        break;
                    case "#person-info":
                        $(".function-menu li").eq(1).addClass("current").siblings().removeClass("current");
                        break;
                    default:
                        $(".function-menu li").eq(0).addClass("current").siblings().removeClass("current");
                        break;
                }
            };
        });
    </script>
</body>
</html>
