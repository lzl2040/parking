<%--
  Created by IntelliJ IDEA.
  User: 联想
  Date: 2021/11/23
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    </script>
</head>

<body>
<div id="container"></div>
<script type="text/javascript">
    var map = new BMapGL.Map("container");
    var point = new BMapGL.Point(116.331398,39.897445);
    map.centerAndZoom(point,12);                                        //中心点以及缩放
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
</script>
</body>
</html>
