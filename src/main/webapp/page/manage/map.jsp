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
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=4vYD7CG1HjAKfDhKAoUpVNyGho0H8pCF">
    </script>
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
                var map = new BMapGL.Map("container");
                var point = new BMapGL.Point(116.331398,39.897445);
                map.centerAndZoom(point,12);                                        //中心点以及缩放
                map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
                var geolocation = new BMapGL.Geolocation();
                geolocation.getCurrentPosition(function(r){
                    if(this.getStatus() == BMAP_STATUS_SUCCESS){
                        var mk = new BMapGL.Marker(r.point);
                        map.addOverlay(mk);
                        map.panTo(r.point);
                    }
                    else {
                        alert('failed' + this.getStatus());
                    }
                });
                addMarker(map);
            }

            function addMarker(map){
              <c:forEach items="${sessionScope.locations}" var="location">
                    var marker = new BMapGL.Marker(new BMapGL.Point(${location.longtitude}, ${location.latitude}));
                    map.addOverlay(marker);
                </c:forEach>
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
